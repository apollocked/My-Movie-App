import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/shows/domain/repositories/show_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class ShowSearchBloc extends Bloc<ShowSearchEvent, ShowSearchState> {
  final ShowRepository repository;

  ShowSearchBloc({required this.repository}) : super(ShowSearchInitial()) {
    on<ExecuteShowSearch>(_onExecuteSearch);
    on<ClearShowSearch>((event, emit) => emit(ShowSearchInitial()));
  }

  Future<void> _onExecuteSearch(
      ExecuteShowSearch event, Emitter<ShowSearchState> emit) async {
    if (event.query.trim().isEmpty) {
      emit(ShowSearchInitial());
      return;
    }
    emit(ShowSearchLoading());
    try {
      final shows = await repository.search(event.query);
      final movies = shows.map((s) => s.toMovie()).toList();
      emit(ShowSearchLoaded(movies));
    } catch (e) {
      emit(ShowSearchError('Failed to search shows: ${e.toString()}'));
    }
  }
}
