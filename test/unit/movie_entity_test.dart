import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

void main() {
  group('Movie entity', () {
    const movie = Movie(
      id: 550,
      title: 'Fight Club',
      overview: 'A ticking time bomb of a movie.',
      posterPath: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
      backdropPath: '/hZkgoQYus5dXo3H8T7hPk8jHv0.jpg',
      releaseDate: '1999-10-15',
      voteAverage: 8.4,
    );

    test('fullPosterUrl returns correct URL', () {
      expect(movie.fullPosterUrl,
          'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg');
    });

    test('fullBackdropUrl returns correct URL', () {
      expect(movie.fullBackdropUrl,
          'https://image.tmdb.org/t/p/w780/hZkgoQYus5dXo3H8T7hPk8jHv0.jpg');
    });

    test('toJson serializes correctly', () {
      final json = movie.toJson();
      expect(json['id'], 550);
      expect(json['title'], 'Fight Club');
      expect(json['overview'], 'A ticking time bomb of a movie.');
      expect(json['poster_path'],
          '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg');
      expect(json['backdrop_path'],
          '/hZkgoQYus5dXo3H8T7hPk8jHv0.jpg');
      expect(json['release_date'], '1999-10-15');
      expect(json['vote_average'], 8.4);
    });

    test('fromJson deserializes correctly', () {
      final json = {
        'id': 550,
        'title': 'Fight Club',
        'overview': 'A ticking time bomb of a movie.',
        'poster_path': '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
        'backdrop_path': '/hZkgoQYus5dXo3H8T7hPk8jHv0.jpg',
        'release_date': '1999-10-15',
        'vote_average': 8.4,
      };
      final fromJson = Movie.fromJson(json);
      expect(fromJson.id, 550);
      expect(fromJson.title, 'Fight Club');
      expect(fromJson.voteAverage, 8.4);
    });

    test('fromJson handles null values', () {
      final json = <String, dynamic>{};
      final fromJson = Movie.fromJson(json);
      expect(fromJson.id, 0);
      expect(fromJson.title, '');
      expect(fromJson.voteAverage, 0.0);
    });

    test('toJson -> fromJson roundtrip', () {
      final json = movie.toJson();
      final roundtrip = Movie.fromJson(json);
      expect(roundtrip.id, movie.id);
      expect(roundtrip.title, movie.title);
      expect(roundtrip.voteAverage, movie.voteAverage);
    });
  });
}
