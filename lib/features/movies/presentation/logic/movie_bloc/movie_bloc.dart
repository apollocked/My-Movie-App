import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/data/models/cached_movie.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_event.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_state.dart'
    show MovieState, MovieLoading, MovieLoaded, MovieError;

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiClient apiClient;
  final Isar isar;

  MovieBloc({required this.apiClient, required this.isar})
      : super(MovieLoading()) {
    on<LoadTrendingMovies>(_onLoadTrendingMovies);
  }

  Future<void> _onLoadTrendingMovies(
      LoadTrendingMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final data = await apiClient.get('/trending/movie/day');
      final results = data['results'] as List;

      final movies = results
          .map((json) => Movie(
                id: json['id'],
                title: json['title'] ?? '',
                overview: json['overview'] ?? '',
                posterPath: json['poster_path'] ?? '',
                backdropPath: json['backdrop_path'] ?? '',
                releaseDate: json['release_date'] ?? '',
                voteAverage: (json['vote_average'] as num).toDouble(),
              ))
          .toList();

      await isar.writeTxn(() async {
        for (var movie in movies) {
          final cacheItem = CachedMovie()
            ..movieId = movie.id
            ..title = movie.title
            ..overview = movie.overview
            ..posterPath = movie.posterPath
            ..backdropPath = movie.backdropPath
            ..releaseDate = movie.releaseDate
            ..voteAverage = movie.voteAverage
            ..categoryType = 'trending';
          await isar.cachedMovies.put(cacheItem);
        }
      });

      emit(MovieLoaded(movies));
    } catch (e) {
      final cachedItems = await isar.cachedMovies
          .filter()
          .categoryTypeEqualTo('trending')
          .findAll();
      if (cachedItems.isNotEmpty) {
        final fallbackMovies = cachedItems
            .map((c) => Movie(
                  id: c.movieId,
                  title: c.title,
                  overview: c.overview,
                  posterPath: c.posterPath,
                  backdropPath: c.backdropPath,
                  releaseDate: c.releaseDate,
                  voteAverage: c.voteAverage,
                ))
            .toList();
        emit(MovieLoaded(fallbackMovies));
      } else {
        emit(MovieError('Offline. Connect to the internet to load movies.'));
      }
    }
  }
}
