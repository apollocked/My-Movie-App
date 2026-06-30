import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> searchMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl({required this.dio});

  String get _baseUrl => 'https://api.themoviedb.org/3';
  String get _apiKey => dotenv.env['TMDB_API_KEY'] ?? '';

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await dio.get(
      '$_baseUrl/trending/movie/day',
      queryParameters: {'api_key': _apiKey},
    );
    if (response.statusCode == 200) {
      final results = (response.data['results'] as List?) ?? [];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    }
    throw Exception('Failed to load trending movies');
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await dio.get(
      '$_baseUrl/search/movie',
      queryParameters: {'api_key': _apiKey, 'query': query},
    );
    if (response.statusCode == 200) {
      final results = (response.data['results'] as List?) ?? [];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    }
    throw Exception('Search execution failed');
  }
}
