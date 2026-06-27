import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'favorite_button.dart';

class MovieDetailInfo extends StatelessWidget {
  final Movie movie;
  final String? uid;
  final String? overview;

  const MovieDetailInfo({
    super.key,
    required this.movie,
    this.uid,
    this.overview,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: movie.fullPosterUrl,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  width: 100,
                  height: 150,
                  color: isDark
                      ? AppColors.darkSurfaceVariant
                      : AppColors.lightSurfaceVariant,
                ),
                errorWidget: (_, __, ___) => Container(
                  width: 100,
                  height: 150,
                  color: isDark
                      ? AppColors.darkSurfaceVariant
                      : AppColors.lightSurfaceVariant,
                  child: Icon(Icons.movie_rounded,
                      color: theme.hintColor, size: 32),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.ratingGold.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                color: AppColors.ratingGold, size: 16),
                            const SizedBox(width: 4),
                            Text(
                                '${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: AppColors.ratingGold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.calendar_month_rounded,
                          size: 16,
                          color: isDark
                              ? AppColors.textTertiaryDark
                              : AppColors.textTertiaryLight),
                      const SizedBox(width: 4),
                      Text(movie.releaseDate.split('-').first,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: isDark
                                ? AppColors.textTertiaryDark
                                : AppColors.textTertiaryLight,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            FavoriteButton(movie: movie),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 12),
        Text(overview ?? movie.overview,
            style: theme.textTheme.bodyLarge
                ?.copyWith(height: 1.7, color: theme.hintColor)),
      ],
    );
  }

}
