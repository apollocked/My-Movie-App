import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie/features/shows/domain/entities/show.dart';

class ShowFirestoreDataSourceImpl {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> toggleCollection(Show show, String collection) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection(collection)
        .doc(show.id.toString());
    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set(_showToMap(show));
    }
  }

  Future<void> saveRating(Show show, double rating) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _db
        .collection('users')
        .doc(uid)
        .collection('ratings')
        .doc(show.id.toString());
    final map = _showToMap(show);
    map['rating'] = rating;
    await docRef.set(map);
  }

  Map<String, dynamic> _showToMap(Show s) {
    return {
      'id': s.id,
      'title': s.name,
      'posterPath': s.posterPath,
      'backdropPath': s.backdropPath,
      'overview': s.overview,
      'voteAverage': s.voteAverage,
      'releaseDate': s.firstAirDate,
      'isShow': true,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
