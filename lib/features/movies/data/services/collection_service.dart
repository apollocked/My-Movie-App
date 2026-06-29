import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../datasources/guest_local_data_source.dart';

class CollectionService {
  final GuestLocalDataSource _local;
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  CollectionService({GuestLocalDataSource? local})
      : _local = local ?? GuestLocalDataSource();

  User? get _user => _auth.currentUser;
  String? get _uid => _user?.uid;
  bool get _isAuthenticated => _user != null;

  Stream<bool> isInCollectionStream(String collection, int movieId) async* {
    if (_isAuthenticated) {
      try {
        await for (final doc in _db
            .collection('users')
            .doc(_uid)
            .collection(collection)
            .doc(movieId.toString())
            .snapshots()) {
          yield doc.exists;
        }
        return;
      } catch (e) {
        debugPrint('CollectionService.isInCollectionStream error: $e');
      }
    }
    yield* _local.watchItem(collection, movieId);
  }

  Stream<Map<String, dynamic>?> getRatingStream(int movieId) async* {
    if (_isAuthenticated) {
      try {
        await for (final doc in _db
            .collection('users')
            .doc(_uid)
            .collection('ratings')
            .doc(movieId.toString())
            .snapshots()) {
          yield doc.exists ? doc.data() : null;
        }
        return;
      } catch (e) {
        debugPrint('CollectionService.getRatingStream error: $e');
      }
    }
    yield* _local.watchRating(movieId);
  }

  Stream<List<Movie>> watchCollection(String type) async* {
    if (_isAuthenticated) {
      try {
        await for (final snap in _db
            .collection('users')
            .doc(_uid)
            .collection(type)
            .orderBy('timestamp', descending: true)
            .snapshots()) {
          yield snap.docs.map((doc) => _docToMovie(doc.data())).toList();
        }
        return;
      } catch (e) {
        debugPrint('CollectionService.watchCollection error: $e');
      }
    }
    yield* _local.watchCollection(type);
  }

  Future<void> toggleCollection(Movie movie, String type) async {
    if (_isAuthenticated) {
      try {
        final docRef = _db
            .collection('users')
            .doc(_uid)
            .collection(type)
            .doc(movie.id.toString());
        final doc = await docRef.get();
        if (doc.exists) {
          await docRef.delete();
        } else {
          await docRef.set(_movieToMap(movie));
        }
        return;
      } catch (e) {
        debugPrint('CollectionService.toggleCollection error: $e');
      }
    }
    await _local.toggleCollection(movie, type);
  }

  Future<bool> isInCollection(int movieId, String type) async {
    if (_isAuthenticated) {
      try {
        final doc = await _db
            .collection('users')
            .doc(_uid)
            .collection(type)
            .doc(movieId.toString())
            .get();
        return doc.exists;
      } catch (e) {
        debugPrint('CollectionService.isInCollection error: $e');
      }
    }
    return _local.isInCollection(movieId, type);
  }

  Future<void> saveRating(Movie movie, double rating) async {
    if (_isAuthenticated) {
      try {
        final docRef = _db
            .collection('users')
            .doc(_uid)
            .collection('ratings')
            .doc(movie.id.toString());
        final map = _movieToMap(movie);
        map['rating'] = rating;
        await docRef.set(map);
        return;
      } catch (e) {
        debugPrint('CollectionService.saveRating error: $e');
      }
    }
    await _local.saveRating(movie, rating);
  }

  Future<double?> getRating(int movieId) async {
    if (_isAuthenticated) {
      try {
        final doc = await _db
            .collection('users')
            .doc(_uid)
            .collection('ratings')
            .doc(movieId.toString())
            .get();
        if (doc.exists) {
          return doc.data()!['rating'] as double?;
        }
      } catch (e) {
        debugPrint('CollectionService.getRating error: $e');
      }
    }
    return _local.getRating(movieId);
  }

  Future<List<Movie>> getCollection(String type) async {
    if (_isAuthenticated) {
      try {
        final snap = await _db
            .collection('users')
            .doc(_uid)
            .collection(type)
            .orderBy('timestamp', descending: true)
            .get();
        return snap.docs.map((doc) => _docToMovie(doc.data())).toList();
      } catch (e) {
        debugPrint('CollectionService.getCollection error: $e');
      }
    }
    return _local.getCollection(type);
  }

  Movie _docToMovie(Map<String, dynamic> data) {
    return Movie(
      id: data['id'] ?? 0,
      title: data['title'] ?? '',
      overview: data['overview'] ?? '',
      posterPath: data['posterPath'] ?? '',
      backdropPath: data['backdropPath'] ?? '',
      releaseDate: data['releaseDate'] ?? '',
      voteAverage: (data['voteAverage'] as num?)?.toDouble() ?? 0.0,
      isShow: data['isShow'] as bool? ?? false,
    );
  }

  Map<String, dynamic> _movieToMap(Movie m) {
    return {
      'id': m.id,
      'title': m.title,
      'posterPath': m.posterPath,
      'backdropPath': m.backdropPath,
      'overview': m.overview,
      'voteAverage': m.voteAverage,
      'releaseDate': m.releaseDate,
      'isShow': m.isShow,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
