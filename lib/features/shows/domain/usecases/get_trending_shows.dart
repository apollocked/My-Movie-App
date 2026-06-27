import '../repositories/show_repository.dart';

class GetTrendingShows {
  final ShowRepository repository;
  GetTrendingShows(this.repository);

  Future call() => repository.getTrending();
}
