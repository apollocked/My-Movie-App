import 'package:isar/isar.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/data/models/cached_movie.dart';

class MovieDataService {
  final ApiClient apiClient;
  final Isar isar;

  MovieDataService({required this.apiClient, required this.isar});

  Future<List<Movie>> fetchAndCache(
      String category, String endpoint, String language) async {
    final data = await apiClient.get(endpoint, params: {'language': language});
    final movies = _parseMovies(data['results'] as List);

    await isar.writeTxn(() async {
      final cached = movies.map((m) => CachedMovie()
        ..movieId = m.id
        ..title = m.title
        ..overview = m.overview
        ..posterPath = m.posterPath
        ..backdropPath = m.backdropPath
        ..releaseDate = m.releaseDate
        ..voteAverage = m.voteAverage
        ..category = category).toList();
      await isar.cachedMovies.putAll(cached);
    });
    return movies;
  }

  Future<List<Movie>> getCached(String category) async {
    final cached = await isar.cachedMovies.filter().categoryEqualTo(category).findAll();
    return cached.map((c) => Movie(
      id: c.movieId, title: c.title, overview: c.overview,
      posterPath: c.posterPath, backdropPath: c.backdropPath,
      releaseDate: c.releaseDate, voteAverage: c.voteAverage,
    )).toList();
  }

  List<Movie> _parseMovies(List jsonList) {
    return jsonList.map((json) => Movie(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
    )).toList();
  }
}
