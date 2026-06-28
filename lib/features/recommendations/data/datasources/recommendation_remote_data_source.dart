import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';
import 'package:my_movie/features/shows/data/models/show_model.dart';

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

    final endpoint = filter.isForShows ? '/discover/tv' : '/discover/movie';
    final data = await apiClient.get(endpoint, params: params);
    final results = (data['results'] as List?) ?? [];

    if (filter.isForShows) {
      return results
          .map((json) =>
              ShowModel.fromJson(json as Map<String, dynamic>).toMovie())
          .toList();
    }
    return results
        .map((json) => Movie.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
