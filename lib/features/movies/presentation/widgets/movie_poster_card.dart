import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';

class MoviePosterCard extends StatelessWidget {
  final double height;
  final Movie? movie;

  const MoviePosterCard({super.key, this.height = 260, this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final width = height * 0.68;

    // Read dynamic asset locations when data binding is ready
    final imageUrl = movie?.fullPosterUrl ??
        'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500';
    final rating = movie?.voteAverage.toStringAsFixed(1) ?? '8.4';

    return Container(
      width: width,
      margin: const EdgeInsets.only(
          right: 16,
          bottom: 8), // Added bottom margin to prevent shadow clipping
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.5)
                : Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: isDark ? Colors.grey[900] : Colors.grey[200],
                child:
                    Icon(Icons.movie_rounded, color: theme.hintColor, size: 32),
              ),
            ),
          ),
          if (movie != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                      Colors.black.withValues(alpha: 0.9),
                    ],
                  ),
                ),
                child: Text(
                  movie!.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          _buildRatingBadge(theme, isDark, rating),
        ],
      ),
    );
  }

  Widget _buildRatingBadge(ThemeData theme, bool isDark, String rating) {
    return Positioned(
      top: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.black.withValues(alpha: 0.7)
              : Colors.white.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.dividerColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star_rounded, color: theme.primaryColor, size: 14),
            const SizedBox(width: 2),
            Text(
              rating,
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
