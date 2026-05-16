import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/movies/data/services/firestore_service.dart';
import 'package:my_movies_app/features/movies/data/services/movie_data_service.dart';
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
  final MovieDataService _dataService;
  final FirestoreService _firestoreService = FirestoreService();

  MovieBloc({required ApiClient apiClient, required Isar isar})
      : _dataService = MovieDataService(apiClient: apiClient, isar: isar),
        super(const MovieInitialState()) {
    on<LoadTrendingMovies>((event, emit) => _load(
        'Trending', _categoryEndpoints['Trending']!, emit, event.language));
    on<LoadMoviesByCategory>((event, emit) {
      final endpoint =
          _categoryEndpoints[event.category] ?? '/trending/movie/day';
      _load(event.category, endpoint, emit, event.language);
    });
    on<ToggleWatchLater>((event, emit) async =>
        await _firestoreService.toggleCollection(event.movie, 'watch_later'));
    on<ToggleFavorite>((event, emit) async =>
        await _firestoreService.toggleCollection(event.movie, 'favorites'));
    on<RateMovie>((event, emit) async =>
        await _firestoreService.saveRating(event.movie, event.rating));
  }

  Future<void> _load(
      String cat, String end, Emitter<MovieState> emit, String lang) async {
    emit(const MovieLoading());
    try {
      final movies = await _dataService.fetchAndCache(cat, end, lang);
      emit(MovieLoaded(movies));
    } catch (e) {
      final cached = await _dataService.getCached(cat);
      if (cached.isNotEmpty) {
        emit(MovieLoaded(cached));
      } else {
        emit(MovieError(e.toString()));
      }
    }
  }
}
