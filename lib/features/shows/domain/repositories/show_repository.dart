import '../entities/show.dart';

abstract class ShowRepository {
  Future<List<Show>> getTrending();
  Future<List<Show>> getByEndpoint(String endpoint, String language);
  Future<List<Show>> search(String query);
}
