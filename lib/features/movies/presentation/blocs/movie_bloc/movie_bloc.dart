import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/movies/data/datasources/movie_firestore_data_source.dart';
import 'package:my_movies_app/features/movies/data/datasources/movie_local_data_source.dart';
import 'movie_event.dart';
import 'movie_state.dart';

const _categoryEndpoints = {
  'Trending': '/trending/movie/day',
  'Top Rated': '/movie/top_rated',
  'Action': '/movie/now_playing',
  'Sci-Fi': '/movie/popular',
  'Horror': '/movie/upcoming',
};

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiClient apiClient;
  final MovieLocalDataSource _dataService;
  final MovieFirestoreDataSourceImpl movieFirestoreDataSourceImpl =
      MovieFirestoreDataSourceImpl();

  MovieBloc({required this.apiClient, required Isar isar})
      : _dataService = MovieLocalDataSource(apiClient: apiClient, isar: isar),
        super(const MovieInitialState()) {
    on<LoadTrendingMovies>((event, emit) async {
      await _load(
          'Trending', _categoryEndpoints['Trending']!, emit, event.language);
    });
    on<LoadMoviesByCategory>((event, emit) async {
      final endpoint =
          _categoryEndpoints[event.category] ?? '/trending/movie/day';
      await _load(event.category, endpoint, emit, event.language);
    });
    on<ToggleWatchLater>((event, emit) async =>
        await movieFirestoreDataSourceImpl.toggleCollection(
            event.movie, 'watch_later'));
    on<ToggleFavorite>((event, emit) async => await movieFirestoreDataSourceImpl
        .toggleCollection(event.movie, 'favorites'));
    on<RateMovie>((event, emit) async => await movieFirestoreDataSourceImpl
        .saveRating(event.movie, event.rating));
  }

  Future<void> _load(
      String cat, String end, Emitter<MovieState> emit, String lang) async {
    emit(const MovieLoading());
    try {
      final movies = await _dataService.fetchAndCache(cat, end, lang);
      if (!emit.isDone) emit(MovieLoaded(movies));
    } catch (e) {
      final cached = await _dataService.getCached(cat);
      if (!emit.isDone) {
        if (cached.isNotEmpty) {
          emit(MovieLoaded(cached));
        } else {
          emit(MovieError(e.toString()));
        }
      }
    }
  }
}
