import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['TMDB_API_ACCESS_TOKEN']}',
          'Content-Type': 'application/json;charset=utf-8',
        },
      ),
    );
  }

  Future<Map<String, dynamic>> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);
      
      if (response.statusCode == 200 && response.data is Map) {
        return (response.data as Map).cast<String, dynamic>();
      } else if (response.statusCode == 200) {
        return {};
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Server Error: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Network timeout. Please check your connection.');
      } else if (e.type == DioExceptionType.badResponse) {
        throw Exception('Server error: ${e.response?.statusCode}');
      }
      throw Exception('Unexpected network error: ${e.message}');
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }
}
