import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

class CardRatingBadge extends StatelessWidget {
  final Movie movie;
  final String? uid;
  final String rating;

  const CardRatingBadge({
    super.key,
    required this.movie,
    required this.uid,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Positioned(
      top: 12, right: 12,
      child: StreamBuilder<DocumentSnapshot>(
        stream: uid == null
            ? const Stream.empty()
            : FirebaseFirestore.instance.collection('users').doc(uid)
                .collection('ratings').doc(movie.id.toString()).snapshots(),
        builder: (context, snapshot) {
          final hasRated = snapshot.hasData && snapshot.data!.exists;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isDark
                  ? (hasRated ? Colors.amber.withValues(alpha: 0.2) : Colors.black87)
                  : Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: hasRated ? Colors.amber : theme.dividerColor, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(hasRated ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: hasRated ? Colors.amber : theme.primaryColor, size: 14),
                const SizedBox(width: 2),
                Text(rating, style: TextStyle(
                  color: hasRated ? Colors.amber : theme.textTheme.bodyLarge?.color,
                  fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
