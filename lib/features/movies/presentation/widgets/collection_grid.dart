import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'movie_poster_card.dart';

class CollectionGrid extends StatelessWidget {
  final List<Movie> movies;
  final String collectionPath;
  final bool isRatings;

  const CollectionGrid({
    super.key,
    required this.movies,
    required this.collectionPath,
    this.isRatings = false,
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
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return Stack(
          children: [
            InkWell(
              onTap: () => context.push('/movie/${movie.id}', extra: movie),
              borderRadius: BorderRadius.circular(20),
              child: MoviePosterCard(movie: movie),
            ),
            if (isRatings) _buildRatingBadge(context, movie),
          ],
        );
      },
    );
  }

  Widget _buildRatingBadge(BuildContext context, Movie movie) {
    final service = CollectionService();

    return StreamBuilder<Map<String, dynamic>?>(
      stream: service.getRatingStream(movie.id),
      initialData: null,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) return const SizedBox.shrink();
        final rating = data['rating'] as num?;
        if (rating == null) return const SizedBox.shrink();
        return Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    offset: const Offset(0, 2))
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, size: 16, color: Colors.black),
                const SizedBox(width: 4),
                Text('${rating.toInt()}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 14)),
              ],
            ),
          ),
        );
      },
    );
  }
}
