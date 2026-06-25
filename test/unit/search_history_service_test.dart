import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movie/features/movies/data/services/search_history_service.dart';

void main() {
  group('SearchHistoryService', () {
    late SearchHistoryService service;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      service = SearchHistoryService();
    });

    test('initial history is empty', () async {
      final history = await service.getHistory();
      expect(history, isEmpty);
    });

    test('addQuery adds item to history', () async {
      await service.addQuery('Inception');
      final history = await service.getHistory();
      expect(history, ['Inception']);
    });

    test('addQuery moves duplicate to front', () async {
      await service.addQuery('Inception');
      await service.addQuery('The Matrix');
      await service.addQuery('Inception');
      final history = await service.getHistory();
      expect(history, ['Inception', 'The Matrix']);
    });

    test('addQuery limits to 10 items', () async {
      for (int i = 0; i < 15; i++) {
        await service.addQuery('Query $i');
      }
      final history = await service.getHistory();
      expect(history.length, 10);
      expect(history.first, 'Query 14');
    });

    test('removeQuery removes item', () async {
      await service.addQuery('Inception');
      await service.addQuery('The Matrix');
      await service.removeQuery('Inception');
      final history = await service.getHistory();
      expect(history, ['The Matrix']);
    });

    test('clear removes all items', () async {
      await service.addQuery('Inception');
      await service.addQuery('The Matrix');
      await service.clear();
      final history = await service.getHistory();
      expect(history, isEmpty);
    });
  });
}
