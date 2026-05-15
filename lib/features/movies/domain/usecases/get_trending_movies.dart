import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies({required this.repository});

  Future<List<Movie>> call() async {
    return await repository.getTrending();
  }
}
