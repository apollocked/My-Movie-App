import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movie/features/shows/domain/entities/show.dart';

class ShowGuestLocalDataSource {
  static const _prefKey = 'guest_show_collections';
  final Map<String, StreamController<bool>> _itemControllers = {};
  final Map<String, StreamController<Map<String, dynamic>?>> _ratingControllers = {};
  final Map<String, StreamController<List<Show>>> _collectionControllers = {};

  Future<List<Show>> getCollection(String type) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('${_prefKey}_$type');
    if (data == null) return [];
    final list = json.decode(data) as List;
    return list.map((e) => Show.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> toggleCollection(Show show, String type) async {
    final items = await getCollection(type);
    final index = items.indexWhere((s) => s.id == show.id);
    if (index >= 0) {
      items.removeAt(index);
    } else {
      items.add(show);
    }
    await _saveCollection(type, items);
    _notifyCollectionChanged(type);
    _notifyItemChanged(type, show.id);
  }

  Future<bool> isInCollection(int showId, String type) async {
    final items = await getCollection(type);
    return items.any((s) => s.id == showId);
  }

  Future<void> saveRating(Show show, double rating) async {
    final items = await getCollection('ratings');
    final index = items.indexWhere((s) => s.id == show.id);
    if (index >= 0) {
      items[index] = show;
    } else {
      items.add(show);
    }
    await _saveCollection('ratings', items);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('guest_show_rating_${show.id}', rating);
    _notifyRatingChanged(show.id);
  }

  Future<double?> getRating(int showId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('guest_show_rating_$showId');
  }

  Stream<bool> watchItem(String type, int showId) {
    final key = 'show_${type}_$showId';
    _itemControllers.putIfAbsent(key, () => StreamController<bool>.broadcast());
    isInCollection(showId, type).then((v) => _itemControllers[key]!.add(v));
    return _itemControllers[key]!.stream;
  }

  Stream<Map<String, dynamic>?> watchRating(int showId) {
    final key = 'show_rating_$showId';
    _ratingControllers.putIfAbsent(key, () => StreamController<Map<String, dynamic>?>.broadcast());
    getRating(showId).then((r) => _ratingControllers[key]!.add(r != null ? {'rating': r} : null));
    return _ratingControllers[key]!.stream;
  }

  Stream<List<Show>> watchCollection(String type) {
    _collectionControllers.putIfAbsent(type, () => StreamController<List<Show>>.broadcast());
    getCollection(type).then((v) => _collectionControllers[type]!.add(v));
    return _collectionControllers[type]!.stream;
  }

  void _notifyItemChanged(String type, int showId) {
    final key = 'show_${type}_$showId';
    if (_itemControllers.containsKey(key)) {
      isInCollection(showId, type).then((v) => _itemControllers[key]!.add(v));
    }
  }

  void _notifyRatingChanged(int showId) {
    final key = 'show_rating_$showId';
    if (_ratingControllers.containsKey(key)) {
      getRating(showId).then((r) => _ratingControllers[key]!.add(r != null ? {'rating': r} : null));
    }
  }

  void _notifyCollectionChanged(String type) {
    if (_collectionControllers.containsKey(type)) {
      getCollection(type).then((v) => _collectionControllers[type]!.add(v));
    }
  }

  Future<void> _saveCollection(String type, List<Show> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = json.encode(items.map((s) => s.toJson()).toList());
    await prefs.setString('${_prefKey}_$type', jsonStr);
  }
}
