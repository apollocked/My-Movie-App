import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

class MovieFirestoreDataSourceImpl {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> toggleCollection(Movie movie, String collection) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection(collection)
        .doc(movie.id.toString());
    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set(_movieToMap(movie));
    }
  }

  Future<void> saveRating(Movie movie, double rating) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('ratings')
        .doc(movie.id.toString());
    final map = _movieToMap(movie);
    map['rating'] = rating;
    await docRef.set(map);
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
