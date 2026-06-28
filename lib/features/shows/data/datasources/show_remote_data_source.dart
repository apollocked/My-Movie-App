import 'package:my_movie/core/network/api_client.dart';
import '../models/show_model.dart';

abstract class ShowRemoteDataSource {
  Future<List<ShowModel>> getTrendingShows();
  Future<List<ShowModel>> fetchByEndpoint(String endpoint, String language);
  Future<List<ShowModel>> searchShows(String query);
}

class ShowRemoteDataSourceImpl implements ShowRemoteDataSource {
  final ApiClient apiClient;

  ShowRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<ShowModel>> getTrendingShows() async {
    final data = await apiClient.get('/trending/tv/day');
    final results = (data['results'] as List?) ?? [];
    return results.map((json) => ShowModel.fromJson(json)).toList();
  }

  @override
  Future<List<ShowModel>> fetchByEndpoint(String endpoint, String language) async {
    final data = await apiClient.get(endpoint, params: {'language': language});
    final results = (data['results'] as List?) ?? [];
    return results.map((json) => ShowModel.fromJson(json)).toList();
  }

  @override
  Future<List<ShowModel>> searchShows(String query) async {
    final data = await apiClient.get('/search/tv', params: {'query': query});
    final results = (data['results'] as List?) ?? [];
    return results.map((json) => ShowModel.fromJson(json)).toList();
  }
}
