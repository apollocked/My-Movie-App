import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'movie_poster_card.dart';

class CollectionGrid extends StatelessWidget {
  final List<QueryDocumentSnapshot> docs;
  final String collectionPath;

  const CollectionGrid({
    super.key,
    required this.docs,
    required this.collectionPath,
  });

  @override
  Widget build(BuildContext context) {
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
        final movie = _mapToMovie(data);

        return Stack(
          children: [
            InkWell(
              onTap: () => context.push('/movie/${movie.id}', extra: movie),
              borderRadius: BorderRadius.circular(20),
              child: MoviePosterCard(movie: movie),
            ),
            if (collectionPath == 'ratings' && data.containsKey('rating'))
              _buildRatingBadge(data['rating']),
          ],
        );
      },
    );
  }

  Movie _mapToMovie(Map<String, dynamic> data) {
    return Movie(
      id: data['id'], title: data['title'] ?? '', overview: data['overview'] ?? '',
      posterPath: data['posterPath'] ?? '', backdropPath: data['backdropPath'] ?? '',
      releaseDate: data['releaseDate'] ?? '',
      voteAverage: (data['voteAverage'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Widget _buildRatingBadge(dynamic rating) {
    return Positioned(
      top: 8, right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 6, offset: const Offset(0, 2))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 16, color: Colors.black),
            const SizedBox(width: 4),
            Text('${(rating as num).toInt()}',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
