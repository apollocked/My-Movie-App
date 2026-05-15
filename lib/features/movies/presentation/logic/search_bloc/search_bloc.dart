import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/entities/movie.dart';
import 'package:my_movies_app/features/movies/presentation/logic/search_bloc/search_event.dart';
import 'package:my_movies_app/features/movies/presentation/logic/search_bloc/search_state.dart';

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
      final data =
          await apiClient.get('/search/movie', params: {'query': event.query});
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

      emit(SearchLoaded(movies));
    } catch (e) {
      emit(SearchError('Failed to complete search query.'));
    }
  }
}
