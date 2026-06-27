import 'package:my_movie/features/shows/domain/entities/show.dart';
import 'package:my_movie/features/shows/domain/repositories/show_repository.dart';
import '../datasources/show_remote_data_source.dart';

class ShowRepositoryImpl implements ShowRepository {
  final ShowRemoteDataSource remoteDataSource;

  ShowRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Show>> getTrending() async {
    return await remoteDataSource.getTrendingShows();
  }

  @override
  Future<List<Show>> getByEndpoint(String endpoint, String language) async {
    return await remoteDataSource.fetchByEndpoint(endpoint, language);
  }

  @override
  Future<List<Show>> search(String query) async {
    return await remoteDataSource.searchShows(query);
  }
}
