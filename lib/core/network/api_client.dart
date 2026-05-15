import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final http.Client _client = http.Client();
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Map<String, String> get _headers => {
        'Authorization': 'Bearer ${dotenv.env['TMDB_READ_ACCESS_TOKEN']}',
        'Content-Type': 'application/json;charset=utf-8',
      };

  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String>? params}) async {
    final queryParams = params ?? {};
    queryParams['api_key'] = dotenv.env['TMDB_API_KEY'] ?? '';

    final uri =
        Uri.parse('$_baseUrl$endpoint').replace(queryParameters: queryParams);
    final response = await _client.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Server Error: ${response.statusCode}');
    }
  }
}
