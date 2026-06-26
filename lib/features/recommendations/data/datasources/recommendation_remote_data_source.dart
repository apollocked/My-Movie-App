import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';

class RecommendationRemoteDataSource {
  final ApiClient apiClient;

  RecommendationRemoteDataSource({required this.apiClient});

  Future<List<Movie>> fetchDiscoverMovies(
    RecommendationFilter filter,
    String language, {
    int page = 1,
  }) async {
    final params = filter.toQueryParams(language);
    params['page'] = page;

    final data = await apiClient.get('/discover/movie', params: params);
    final results = data['results'] as List;

    return results.map((json) => Movie.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<List<Movie>> fetchPage(String endpoint, String language, {int page = 1}) async {
    final data = await apiClient.get(endpoint, params: {'language': language, 'page': page});
    final results = data['results'] as List;
    return results.map((json) => Movie.fromJson(json as Map<String, dynamic>)).toList();
  }
}
