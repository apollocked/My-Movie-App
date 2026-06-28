import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/shows/domain/entities/show.dart';

class ShowLocalDataSource {
  final ApiClient apiClient;

  ShowLocalDataSource({required this.apiClient});

  Future<List<Show>> fetchAndCache(
      String category, String endpoint, String language) async {
    final data = await apiClient.get(endpoint, params: {'language': language});
    return _parseShows((data['results'] as List?) ?? []);
  }

  List<Show> _parseShows(List jsonList) {
    return jsonList
        .map((json) => Show(
              id: (json['id'] as num?)?.toInt() ?? 0,
              name: json['name'] as String? ?? '',
              overview: json['overview'] as String? ?? '',
              posterPath: json['poster_path'] as String? ?? '',
              backdropPath: json['backdrop_path'] as String? ?? '',
              firstAirDate: json['first_air_date'] as String? ?? '',
              voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
            ))
        .toList();
  }
}
