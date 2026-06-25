import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

class GuestLocalDataSource {
  static const _prefKey = 'guest_collections';
  final Map<String, StreamController<bool>> _itemControllers = {};
  final Map<String, StreamController<Map<String, dynamic>?>> _ratingControllers = {};
  final Map<String, StreamController<List<Movie>>> _collectionControllers = {};

  Future<List<Movie>> getCollection(String type) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('${_prefKey}_$type');
    if (data == null) return [];
    final list = json.decode(data) as List;
    return list.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> toggleCollection(Movie movie, String type) async {
    final items = await getCollection(type);
    final index = items.indexWhere((m) => m.id == movie.id);
    if (index >= 0) {
      items.removeAt(index);
    } else {
      items.add(movie);
    }
    await _saveCollection(type, items);
    _notifyCollectionChanged(type);
    _notifyItemChanged(type, movie.id);
  }

  Future<bool> isInCollection(int movieId, String type) async {
    final items = await getCollection(type);
    return items.any((m) => m.id == movieId);
  }

  Future<void> saveRating(Movie movie, double rating) async {
    final items = await getCollection('ratings');
    final index = items.indexWhere((m) => m.id == movie.id);
    if (index >= 0) {
      items[index] = movie;
    } else {
      items.add(movie);
    }
    await _saveCollection('ratings', items);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('guest_rating_${movie.id}', rating);
    _notifyRatingChanged(movie.id);
  }

  Future<double?> getRating(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('guest_rating_$movieId');
  }

  Stream<bool> watchItem(String type, int movieId) {
    final key = '${type}_$movieId';
    _itemControllers.putIfAbsent(key, () => StreamController<bool>.broadcast());
    isInCollection(movieId, type).then((v) => _itemControllers[key]!.add(v));
    return _itemControllers[key]!.stream;
  }

  Stream<Map<String, dynamic>?> watchRating(int movieId) {
    final key = 'rating_$movieId';
    _ratingControllers.putIfAbsent(key, () => StreamController<Map<String, dynamic>?>.broadcast());
    getRating(movieId).then((r) => _ratingControllers[key]!.add(r != null ? {'rating': r} : null));
    return _ratingControllers[key]!.stream;
  }

  Stream<List<Movie>> watchCollection(String type) {
    _collectionControllers.putIfAbsent(type, () => StreamController<List<Movie>>.broadcast());
    getCollection(type).then((v) => _collectionControllers[type]!.add(v));
    return _collectionControllers[type]!.stream;
  }

  void _notifyItemChanged(String type, int movieId) {
    final key = '${type}_$movieId';
    if (_itemControllers.containsKey(key)) {
      isInCollection(movieId, type).then((v) => _itemControllers[key]!.add(v));
    }
  }

  void _notifyRatingChanged(int movieId) {
    final key = 'rating_$movieId';
    if (_ratingControllers.containsKey(key)) {
      getRating(movieId).then((r) => _ratingControllers[key]!.add(r != null ? {'rating': r} : null));
    }
  }

  void _notifyCollectionChanged(String type) {
    if (_collectionControllers.containsKey(type)) {
      getCollection(type).then((v) => _collectionControllers[type]!.add(v));
    }
  }

  Future<void> _saveCollection(String type, List<Movie> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = json.encode(items.map((m) => m.toJson()).toList());
    await prefs.setString('${_prefKey}_$type', jsonStr);
  }
}
