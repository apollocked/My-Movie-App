import '../repositories/show_repository.dart';

class SearchShows {
  final ShowRepository repository;
  SearchShows(this.repository);

  Future call(String query) => repository.search(query);
}
