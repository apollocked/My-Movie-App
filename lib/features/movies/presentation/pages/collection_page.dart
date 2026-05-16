import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/movie_poster_card.dart';

class CollectionPage extends StatelessWidget {
  final String title;
  final String collectionPath;

  const CollectionPage({
    super.key,
    required this.title,
    required this.collectionPath,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: const Center(child: Text('Please log in to view your collection')),
      );
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection(collectionPath)
            // Note: If you just added a field, you might need to wait for index generation in Firestore
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Fallback if orderBy fails due to missing index
            return _buildSimpleList(uid, theme);
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildEmptyState(theme);
          }

          return _buildGrid(snapshot.data!.docs);
        },
      ),
    );
  }

  Widget _buildSimpleList(String uid, ThemeData theme) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection(collectionPath)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return _buildEmptyState(theme);
        return _buildGrid(snapshot.data!.docs);
      },
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_filter_outlined, size: 80, color: theme.hintColor.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text('Your $title list is empty', style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor)),
        ],
      ),
    );
  }

  Widget _buildGrid(List<QueryDocumentSnapshot> docs) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final data = docs[index].data() as Map<String, dynamic>;
        final movie = Movie(
          id: data['id'],
          title: data['title'] ?? '',
          overview: data['overview'] ?? '',
          posterPath: data['posterPath'] ?? '',
          backdropPath: data['backdropPath'] ?? '',
          releaseDate: data['releaseDate'] ?? '',
          voteAverage: (data['voteAverage'] as num?)?.toDouble() ?? 0.0,
        );

        return Stack(
          children: [
            InkWell(
              onTap: () => context.push('/movie/${movie.id}', extra: movie),
              borderRadius: BorderRadius.circular(20),
              child: MoviePosterCard(
                movie: movie,
              ),
            ),
            if (collectionPath == 'ratings' && data.containsKey('rating'))
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.black),
                      const SizedBox(width: 4),
                      Text(
                        '${(data['rating'] as num).toInt()}',
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
