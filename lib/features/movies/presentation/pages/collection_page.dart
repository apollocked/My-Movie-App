import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movies_app/i18n/strings.g.dart';
import '../widgets/collection_grid.dart';
import '../widgets/collection_empty_state.dart';

class CollectionPage extends StatelessWidget {
  final String title;
  final String collectionPath;

  const CollectionPage({super.key, required this.title, required this.collectionPath});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid;
    
    String translatedTitle = title;
    if (title == 'Watch Later') translatedTitle = t.profile.watch_later;
    if (title == 'My Favorites') translatedTitle = t.profile.my_favorites;
    if (title == 'My Ratings') translatedTitle = t.profile.my_ratings;

    if (uid == null) {
      return Scaffold(
        appBar: AppBar(title: Text(translatedTitle)),
        body: Center(child: Text(t.auth.login_required_desc)),
      );
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(translatedTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(uid).collection(collectionPath)
            .orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return _fallbackList(uid);
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return CollectionEmptyState();
          return CollectionGrid(docs: snapshot.data!.docs, collectionPath: collectionPath);
        },
      ),
    );
  }

  Widget _fallbackList(String uid) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid).collection(collectionPath).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return CollectionEmptyState();
        return CollectionGrid(docs: snapshot.data!.docs, collectionPath: collectionPath);
      },
    );
  }
}
