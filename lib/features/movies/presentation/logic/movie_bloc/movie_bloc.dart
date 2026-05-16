import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/data/models/cached_movie.dart';
import 'movie_event.dart';
import 'movie_state.dart';

/// Maps UI category labels to valid TMDB API endpoint slugs.
const _categoryEndpointMap = {
  'Trending': '/trending/movie/day',
  'Top Rated': '/movie/top_rated',
  'Action': '/movie/now_playing',
  'Sci-Fi': '/movie/popular',
  'Horror': '/movie/upcoming',
};

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiClient apiClient;
  final Isar isar;

  MovieBloc({
    required this.apiClient,
    required this.isar,
  }) : super(const MovieInitialState()) {
    on<LoadTrendingMovies>(_onLoadTrendingMovies);
    on<LoadMoviesByCategory>(_onLoadMoviesByCategory);
    on<ToggleWatchLater>(_onToggleWatchLater);
  }

  Future<void> _onLoadTrendingMovies(
    LoadTrendingMovies event,
    Emitter<MovieState> emit,
  ) async {
    await _fetchAndCacheMovies('Trending', _categoryEndpointMap['Trending']!, emit);
  }

  Future<void> _onLoadMoviesByCategory(
    LoadMoviesByCategory event,
    Emitter<MovieState> emit,
  ) async {
    if (event.category == 'Watch Later') {
      emit(const MovieLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        final watchLaterJson = prefs.getStringList('watch_later') ?? [];
        final movies = watchLaterJson.map((jsonStr) {
          final json = jsonDecode(jsonStr);
          return Movie(
            id: json['id'],
            title: json['title'],
            overview: json['overview'],
            posterPath: json['posterPath'],
            backdropPath: json['backdropPath'],
            releaseDate: json['releaseDate'],
            voteAverage: json['voteAverage'],
          );
        }).toList();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to load Watch Later list: $e'));
      }
      return;
    }

    final endpoint = _categoryEndpointMap[event.category] ?? '/trending/movie/day';
    await _fetchAndCacheMovies(event.category, endpoint, emit);
  }

  Future<void> _onToggleWatchLater(
    ToggleWatchLater event,
    Emitter<MovieState> emit,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final watchLaterJson = prefs.getStringList('watch_later') ?? [];
      final movieJsonStr = jsonEncode({
        'id': event.movie.id,
        'title': event.movie.title,
        'overview': event.movie.overview,
        'posterPath': event.movie.posterPath,
        'backdropPath': event.movie.backdropPath,
        'releaseDate': event.movie.releaseDate,
        'voteAverage': event.movie.voteAverage,
      });

      final existingIndex = watchLaterJson.indexWhere((jsonStr) => jsonDecode(jsonStr)['id'] == event.movie.id);
      
      if (existingIndex >= 0) {
        watchLaterJson.removeAt(existingIndex);
      } else {
        watchLaterJson.add(movieJsonStr);
      }
      
      await prefs.setStringList('watch_later', watchLaterJson);
    } catch (_) {
      // Silently fail for toggle
    }
  }

  Future<void> _fetchAndCacheMovies(
    String categoryType,
    String endpoint,
    Emitter<MovieState> emit,
  ) async {
    emit(const MovieLoading());
    try {
      final data = await apiClient.get(endpoint);
      final movies = _parseMovies(data['results'] as List);

      await isar.writeTxn(() async {
        final cachedMovies = movies.map((m) => CachedMovie()
          ..movieId = m.id
          ..title = m.title
          ..overview = m.overview
          ..posterPath = m.posterPath
          ..backdropPath = m.backdropPath
          ..releaseDate = m.releaseDate
          ..voteAverage = m.voteAverage
          ..categoryType = categoryType).toList();
        
        await isar.cachedMovies.putAll(cachedMovies);
      });

      emit(MovieLoaded(movies));
    } catch (e) {
      try {
        final cachedData = await isar.cachedMovies
            .filter()
            .categoryTypeEqualTo(categoryType)
            .findAll();
            
        if (cachedData.isNotEmpty) {
          final movies = cachedData.map((c) => Movie(
            id: c.movieId,
            title: c.title,
            overview: c.overview,
            posterPath: c.posterPath,
            backdropPath: c.backdropPath,
            releaseDate: c.releaseDate,
            voteAverage: c.voteAverage,
          )).toList();
          emit(MovieLoaded(movies));
        } else {
          emit(MovieError('Failed to load movies. No offline data available.'));
        }
      } catch (cacheError) {
        emit(MovieError('Error loading movies: ${e.toString()}'));
      }
    }
  }

  List<Movie> _parseMovies(List rawList) {
    return rawList
        .map((json) => Movie(
              id: (json['id'] as num?)?.toInt() ?? 0,
              title: json['title'] as String? ?? '',
              overview: json['overview'] as String? ?? '',
              posterPath: json['poster_path'] as String? ?? '',
              backdropPath: json['backdrop_path'] as String? ?? '',
              releaseDate: json['release_date'] as String? ?? '',
              voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
            ))
        .toList();
  }
}
