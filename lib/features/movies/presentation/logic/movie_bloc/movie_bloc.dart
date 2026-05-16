import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiClient apiClient;
  final Isar isar;

  MovieBloc({
    required this.apiClient,
    required this.isar,
  }) : super(const MovieInitialState()) {
    on<LoadTrendingMovies>(_onLoadTrendingMovies);
    on<LoadMoviesByCategory>(_onLoadMoviesByCategory);
  }

  Future<void> _onLoadTrendingMovies(
    LoadTrendingMovies event,
    Emitter<MovieState> emit,
  ) async {
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

      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError('Failed to load trending movies.'));
    }
  }

  Future<void> _onLoadMoviesByCategory(
    LoadMoviesByCategory event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      final data = await apiClient.get('/movie/${event.category}');
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

      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError('Failed to load movies for this category.'));
    }
  }
}
