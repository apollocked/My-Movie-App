import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrending();
  Future<List<Movie>> search(String query);
}
