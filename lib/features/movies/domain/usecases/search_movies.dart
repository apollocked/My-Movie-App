import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies({required this.repository});

  Future<List<Movie>> call(String query) async {
    return await repository.search(query);
  }
}
