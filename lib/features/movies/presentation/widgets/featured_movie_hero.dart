import 'package:flutter/material.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

class FeaturedMovieHero extends StatelessWidget {
  final Movie? movie;
  final VoidCallback? onPlayPressed;
  final VoidCallback? onInfoPressed;

  const FeaturedMovieHero({
    super.key,
    required this.movie,
    this.onPlayPressed,
    this.onInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (movie == null) {
      return Container(
        height: 450,
        color: theme.cardColor,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      height: 480,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Backdrop
          Image.network(
            movie!.fullPosterUrl,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (_, __, ___) => Container(color: theme.cardColor),
          ),
          
          // Smooth Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  (isDark ? theme.scaffoldBackgroundColor : Colors.white).withValues(alpha: 0.3),
                  (isDark ? theme.scaffoldBackgroundColor : Colors.white).withValues(alpha: 0.8),
                  isDark ? theme.scaffoldBackgroundColor : Colors.white,
                ],
                stops: const [0.4, 0.7, 0.9, 1.0],
              ),
            ),
          ),

          // Content Layer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movie!.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: isDark ? Colors.white : Colors.black87,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_rounded, color: theme.colorScheme.secondary, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        movie!.voteAverage.toStringAsFixed(1),
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        movie!.releaseDate.split('-').first,
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: onPlayPressed,
                          icon: const Icon(Icons.play_arrow_rounded, size: 28),
                          label: const Text(
                            'Play Now',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: isDark ? Colors.white : Colors.black87,
                            side: BorderSide(
                              color: isDark ? Colors.white30 : Colors.black26,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: onInfoPressed,
                          icon: const Icon(Icons.info_outline_rounded),
                          label: const Text(
                            'Details',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
