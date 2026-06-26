import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../datasources/guest_local_data_source.dart';

class CollectionService {
  static final CollectionService _instance = CollectionService._();
  factory CollectionService() => _instance;
  CollectionService._();

  final GuestLocalDataSource _local = GuestLocalDataSource();
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  User? get _user => _auth.currentUser;
  String? get _uid => _user?.uid;
  bool get _isAuthenticated => _user != null;

  Stream<bool> isInCollectionStream(String collection, int movieId) {
    if (_isAuthenticated) {
      return _db
          .collection('users')
          .doc(_uid)
          .collection(collection)
          .doc(movieId.toString())
          .snapshots()
          .map((doc) => doc.exists);
    } else {
      return _local.watchItem(collection, movieId);
    }
  }

  Stream<Map<String, dynamic>?> getRatingStream(int movieId) {
    if (_isAuthenticated) {
      return _db
          .collection('users')
          .doc(_uid)
          .collection('ratings')
          .doc(movieId.toString())
          .snapshots()
          .map((doc) => doc.exists ? doc.data() : null);
    } else {
      return _local.watchRating(movieId);
    }
  }

  Stream<List<Movie>> watchCollection(String type) {
    if (_isAuthenticated) {
      return _db
          .collection('users')
          .doc(_uid)
          .collection(type)
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((snap) =>
              snap.docs.map((doc) => _docToMovie(doc.data())).toList());
    } else {
      return _local.watchCollection(type);
    }
  }

  Future<void> toggleCollection(Movie movie, String type) async {
    if (_isAuthenticated) {
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
    } else {
      await _local.toggleCollection(movie, type);
    }
  }

  Future<bool> isInCollection(int movieId, String type) async {
    if (_isAuthenticated) {
      final doc = await _db
          .collection('users')
          .doc(_uid)
          .collection(type)
          .doc(movieId.toString())
          .get();
      return doc.exists;
    } else {
      return _local.isInCollection(movieId, type);
    }
  }

  Future<void> saveRating(Movie movie, double rating) async {
    if (_isAuthenticated) {
      final docRef = _db
          .collection('users')
          .doc(_uid)
          .collection('ratings')
          .doc(movie.id.toString());
      final map = _movieToMap(movie);
      map['rating'] = rating;
      await docRef.set(map);
    } else {
      await _local.saveRating(movie, rating);
    }
  }

  Future<double?> getRating(int movieId) async {
    if (_isAuthenticated) {
      final doc = await _db
          .collection('users')
          .doc(_uid)
          .collection('ratings')
          .doc(movieId.toString())
          .get();
      if (doc.exists) {
        return doc.data()!['rating'] as double?;
      }
      return null;
    } else {
      return _local.getRating(movieId);
    }
  }

  Future<List<Movie>> getCollection(String type) async {
    if (_isAuthenticated) {
      final snap = await _db
          .collection('users')
          .doc(_uid)
          .collection(type)
          .orderBy('timestamp', descending: true)
          .get();
      return snap.docs.map((doc) => _docToMovie(doc.data())).toList();
    } else {
      return _local.getCollection(type);
    }
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
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
