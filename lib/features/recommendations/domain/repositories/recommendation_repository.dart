import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';

abstract class RecommendationRepository {
  Future<List<Movie>> getRecommendations(
    RecommendationFilter filter,
    String language, {
    int page = 1,
  });
}
