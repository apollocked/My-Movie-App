import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

class SwipeCardInfoPanel extends StatelessWidget {
  final Movie movie;

  const SwipeCardInfoPanel({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      color: isDark ? AppColors.darkSurface : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title, style: TextStyle(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            fontSize: 20, fontWeight: FontWeight.w700,
          ), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 6),
          Row(
            children: [
              if (movie.voteAverage > 0) ...[
                Icon(Icons.star_rounded, color: AppColors.ratingGold, size: 18),
                const SizedBox(width: 4),
                Text(movie.voteAverage.toStringAsFixed(1), style: TextStyle(
                  color: AppColors.ratingGold, fontWeight: FontWeight.w700, fontSize: 14,
                )),
                const SizedBox(width: 12),
              ],
              if (movie.releaseDate.length >= 4)
                Text(movie.releaseDate.substring(0, 4), style: TextStyle(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  fontSize: 14, fontWeight: FontWeight.w500,
                )),
            ],
          ),
          const SizedBox(height: 8),
          if (movie.overview.isNotEmpty)
            Text(movie.overview, style: TextStyle(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              fontSize: 13, fontWeight: FontWeight.w400, height: 1.4,
            ), maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
