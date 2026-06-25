import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movie/features/movies/data/datasources/guest_local_data_source.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

void main() {
  late GuestLocalDataSource dataSource;

  final testMovie = Movie(
    id: 550,
    title: 'Fight Club',
    overview: 'Test overview',
    posterPath: '/poster.jpg',
    backdropPath: '/backdrop.jpg',
    releaseDate: '1999-10-15',
    voteAverage: 8.4,
  );

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    dataSource = GuestLocalDataSource();
  });

  group('GuestLocalDataSource', () {
    test('initial collection is empty', () async {
      final items = await dataSource.getCollection('favorites');
      expect(items, isEmpty);
    });

    test('toggleCollection adds movie to favorites', () async {
      await dataSource.toggleCollection(testMovie, 'favorites');
      final items = await dataSource.getCollection('favorites');
      expect(items.length, 1);
      expect(items.first.id, 550);
    });

    test('toggleCollection removes movie from favorites', () async {
      await dataSource.toggleCollection(testMovie, 'favorites');
      await dataSource.toggleCollection(testMovie, 'favorites');
      final items = await dataSource.getCollection('favorites');
      expect(items, isEmpty);
    });

    test('isInCollection returns correct state', () async {
      var inCollection = await dataSource.isInCollection(550, 'favorites');
      expect(inCollection, false);

      await dataSource.toggleCollection(testMovie, 'favorites');
      inCollection = await dataSource.isInCollection(550, 'favorites');
      expect(inCollection, true);
    });

    test('collections are independent', () async {
      await dataSource.toggleCollection(testMovie, 'favorites');
      await dataSource.toggleCollection(testMovie, 'watch_later');

      final favs = await dataSource.getCollection('favorites');
      final wl = await dataSource.getCollection('watch_later');

      expect(favs.length, 1);
      expect(wl.length, 1);
    });

    test('saveRating saves and retrieves rating', () async {
      await dataSource.saveRating(testMovie, 8.5);
      final rating = await dataSource.getRating(550);
      expect(rating, 8.5);
    });

    test('getRating returns null for unrated movie', () async {
      final rating = await dataSource.getRating(999);
      expect(rating, isNull);
    });

    test('saveRating updates existing rating', () async {
      await dataSource.saveRating(testMovie, 8.5);
      await dataSource.saveRating(testMovie, 9.0);
      final rating = await dataSource.getRating(550);
      expect(rating, 9.0);
    });
  });
}
