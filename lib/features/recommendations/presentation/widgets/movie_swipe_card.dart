import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'movie_network_image.dart';
import 'swipe_card_info_panel.dart';

class MovieSwipeCard extends StatelessWidget {
  final Movie movie;

  const MovieSwipeCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: MovieNetworkImage(
                  backdropUrl: movie.fullBackdropUrl,
                  posterUrl: movie.fullPosterUrl,
                  title: movie.title,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SwipeCardInfoPanel(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}
