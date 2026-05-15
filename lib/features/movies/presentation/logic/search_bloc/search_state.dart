abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<dynamic> results;
  const SearchLoaded(this.results);
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}
