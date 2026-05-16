abstract class SearchEvent {
  const SearchEvent();
}

class ExecuteSearch extends SearchEvent {
  final String query;
  final String filter;
  const ExecuteSearch({required this.query, this.filter = 'All'});
}

class ClearSearch extends SearchEvent {
  const ClearSearch();
}
