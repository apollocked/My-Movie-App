import 'package:flutter/material.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background Backdrop Image Layer
          Positioned.fill(
            child: Image.network(
              movie.fullBackdropUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox(),
            ),
          ),

          // Smooth Dynamic Content Scrim Gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.scaffoldBackgroundColor,
                    theme.scaffoldBackgroundColor.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.35, 1.0],
                ),
              ),
            ),
          ),

          // Movie Meta Detail Labels
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 10),
                Text(
                  movie.overview,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          // Floating Adaptive Navigation Back Button Action
          Positioned(
            top: 40,
            left: 10,
            child: CircleAvatar(
              backgroundColor: isDark ? Colors.black45 : Colors.white70,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: theme.textTheme.titleLarge?.color,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
