import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/shows/domain/repositories/show_repository.dart';
import 'show_event.dart';
import 'show_state.dart';

const _categoryEndpoints = {
  'Trending': '/trending/tv/day',
  'Top Rated': '/tv/top_rated',
  'Popular': '/tv/popular',
  'Airing Today': '/tv/airing_today',
  'On The Air': '/tv/on_the_air',
  'Action': '/discover/tv?with_genres=10759',
  'Sci-Fi': '/discover/tv?with_genres=10765',
  'Horror': '/discover/tv?with_genres=10764',
  'Drama': '/discover/tv?with_genres=18',
  'Comedy': '/discover/tv?with_genres=35',
  'Mystery': '/discover/tv?with_genres=9648',
  'Animation': '/discover/tv?with_genres=16',
  'Reality': '/discover/tv?with_genres=10764',
};

class ShowBloc extends Bloc<ShowEvent, ShowState> {
  final ShowRepository repository;
  final CollectionService _collectionService = CollectionService();

  ShowBloc({required this.repository})
      : super(const ShowInitialState()) {
    on<LoadTrendingShows>((event, emit) async {
      await _load(_categoryEndpoints['Trending']!, emit, event.language);
    });
    on<LoadShowsByCategory>((event, emit) async {
      final endpoint = _categoryEndpoints[event.category] ?? '/trending/tv/day';
      await _load(endpoint, emit, event.language);
    });
    on<ToggleShowWatchLater>((event, emit) async =>
        await _collectionService.toggleCollection(event.movie, 'watch_later'));
    on<ToggleShowFavorite>((event, emit) async =>
        await _collectionService.toggleCollection(event.movie, 'favorites'));
    on<RateShow>((event, emit) async =>
        await _collectionService.saveRating(event.movie, event.rating));
  }

  Future<void> _load(
      String end, Emitter<ShowState> emit, String lang) async {
    emit(const ShowLoading());
    try {
      final shows = await repository.getByEndpoint(end, lang);
      final movies = shows.map((s) => s.toMovie()).toList();
      if (!emit.isDone) emit(ShowLoaded(movies));
    } catch (e) {
      if (!emit.isDone) emit(ShowError(e.toString()));
    }
  }
}
