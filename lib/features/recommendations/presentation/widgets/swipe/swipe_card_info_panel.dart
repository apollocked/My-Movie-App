import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

class SwipeCardInfoPanel extends StatelessWidget {
  final Movie movie;
  final String? fullOverview;

  const SwipeCardInfoPanel({super.key, required this.movie, this.fullOverview});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 6),
          Row(
            children: [
              if (movie.voteAverage > 0) ...[
                Icon(Icons.star_rounded, color: AppColors.ratingGold, size: 18),
                const SizedBox(width: 4),
                Text(movie.voteAverage.toStringAsFixed(1),
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.ratingGold,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(width: 12),
              ],
              if (movie.releaseDate.length >= 4)
                Text(movie.releaseDate.substring(0, 4),
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      fontWeight: FontWeight.w500,
                    )),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                fullOverview ?? movie.overview,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(height: 1.7, color: theme.hintColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
