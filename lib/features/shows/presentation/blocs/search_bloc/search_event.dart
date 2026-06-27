abstract class ShowSearchEvent {
  const ShowSearchEvent();
}

class ExecuteShowSearch extends ShowSearchEvent {
  final String query;
  final String filter;
  final String language;
  const ExecuteShowSearch({required this.query, this.filter = 'All', this.language = 'en-US'});
}

class ClearShowSearch extends ShowSearchEvent {
  const ClearShowSearch();
}
