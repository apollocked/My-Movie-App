import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/domain/repositories/movie_repository.dart';

import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getTrending() async {
    // Falls back seamlessly to remote data mapping
    return await remoteDataSource.getTrendingMovies();
  }

  @override
  Future<List<Movie>> search(String query) async {
    return await remoteDataSource.searchMovies(query);
  }
}
