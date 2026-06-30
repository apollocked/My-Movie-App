abstract class SearchEvent {
  const SearchEvent();
}

class ExecuteSearch extends SearchEvent {
  final String query;
  final String filter;
  final String language;
  final String? originalLanguage;
  const ExecuteSearch({required this.query, this.filter = 'All', this.language = 'en-US', this.originalLanguage});
}

class ClearSearch extends SearchEvent {
  const ClearSearch();
}
