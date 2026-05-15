abstract class SearchEvent {
  const SearchEvent();
}

class ExecuteSearch extends SearchEvent {
  final String query;
  const ExecuteSearch({required this.query});
}

class ClearSearch extends SearchEvent {
  const ClearSearch();
}
