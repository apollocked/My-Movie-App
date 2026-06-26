import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/recommendations/data/datasources/recommendation_remote_data_source.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';
import 'package:my_movie/features/recommendations/domain/repositories/recommendation_repository.dart';

class RecommendationRepositoryImpl implements RecommendationRepository {
  final RecommendationRemoteDataSource remoteDataSource;

  RecommendationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getRecommendations(
    RecommendationFilter filter,
    String language, {
    int page = 1,
  }) async {
    return remoteDataSource.fetchDiscoverMovies(filter, language, page: page);
  }
}
