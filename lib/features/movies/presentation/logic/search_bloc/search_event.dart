abstract class SearchEvent {}

class ExecuteSearch extends SearchEvent {
  final String query;
  ExecuteSearch(this.query);
}

class ClearSearch extends SearchEvent {}
