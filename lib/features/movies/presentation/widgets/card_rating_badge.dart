import 'package:flutter/material.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';

class CardRatingBadge extends StatelessWidget {
  final Movie movie;
  final String rating;

  const CardRatingBadge({
    super.key,
    required this.movie,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final service = CollectionService();

    return Positioned(
      top: 12,
      right: 12,
      child: StreamBuilder<Map<String, dynamic>?>(
        stream: service.getRatingStream(movie.id),
        initialData: null,
        builder: (context, snapshot) {
          final data = snapshot.data;
          final hasRated = data != null;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: hasRated ? Colors.amber : Colors.white38,
                width: hasRated ? 1.5 : 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  hasRated ? Icons.star_rounded : Icons.star_outline_rounded,
                  color: Colors.amber,
                  size: 14,
                ),
                const SizedBox(width: 2),
                Text(
                  rating,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
