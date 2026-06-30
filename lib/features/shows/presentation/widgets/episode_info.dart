import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/presentation/widgets/release_countdown_badge.dart';

class EpisodeInfo extends StatelessWidget {
  final int seasonNum;
  final int epNum;
  final String title;
  final double rating;
  final int? runtime;
  final String airDate;

  const EpisodeInfo({
    super.key,
    required this.seasonNum,
    required this.epNum,
    required this.title,
    required this.rating,
    this.runtime,
    required this.airDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${t.movie_detail.show.season} $seasonNum · ${t.movie_detail.show.episode} $epNum',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (ReleaseCountdownBadge.isUpcomingDate(airDate)) ...[
              const SizedBox(width: 12),
              ReleaseCountdownBadge.forDate(dateString: airDate),
            ],
          ],
        ),
        if (title.isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
        ],
        const SizedBox(height: 16),
        Row(
          children: [
            if (rating > 0) ...[
              const Icon(Icons.star_rounded,
                  size: 16, color: AppColors.ratingGold),
              const SizedBox(width: 4),
              Text(
                rating.toStringAsFixed(1),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.ratingGold,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 16),
            ],
            if (runtime != null && runtime! > 0) ...[
              Icon(Icons.schedule_rounded,
                  size: 16,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight),
              const SizedBox(width: 4),
              Text(
                '${runtime}m',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
              const SizedBox(width: 16),
            ],
            if (airDate.isNotEmpty)
              Text(
                airDate,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
