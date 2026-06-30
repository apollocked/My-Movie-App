import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_event.dart';
import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiClient apiClient;

  SearchBloc({required this.apiClient}) : super(SearchInitial()) {
    on<ExecuteSearch>(_onExecuteSearch);
    on<ClearSearch>((event, emit) => emit(SearchInitial()));
  }

  Future<void> _onExecuteSearch(
      ExecuteSearch event, Emitter<SearchState> emit) async {
    if (event.query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try {
      String endpoint = '/search/multi';
      if (event.filter == 'Movies') endpoint = '/search/movie';
      if (event.filter == 'TV Shows') endpoint = '/search/tv';
      if (event.filter == 'Actors') endpoint = '/search/person';

      final data = await apiClient.get(endpoint,
          params: {'query': event.query, 'language': event.language});
      final results = (data['results'] as List?) ?? [];

      var filtered = results.where((json) =>
          json['media_type'] != 'person' ||
          event.filter == 'Actors' ||
          event.filter == 'All');

      final ol = event.originalLanguage;
      if (ol != null && ol.isNotEmpty) {
        filtered = filtered.where(
            (json) => (json['original_language'] as String?) == ol);
      }

      final movies = filtered
          .map((json) => Movie(
                id: (json['id'] as num?)?.toInt() ?? 0,
                title: json['title'] ?? json['name'] ?? '',
                overview:
                    json['overview'] ?? json['known_for_department'] ?? '',
                posterPath: json['poster_path'] ?? json['profile_path'] ?? '',
                backdropPath: json['backdrop_path'] ?? '',
                releaseDate:
                    json['release_date'] ?? json['first_air_date'] ?? '',
                originalLanguage: json['original_language'] as String? ?? '',
                voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
              ))
          .toList();

      emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchError('Failed to complete search query: ${e.toString()}'));
    }
  }
}
