import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

class ReleaseCountdownBadge extends StatelessWidget {
  final String dateString;

  ReleaseCountdownBadge({super.key, required Movie movie})
      : dateString = movie.releaseDate;

  const ReleaseCountdownBadge.forDate({super.key, required this.dateString});

  static int? _daysUntil(String dateStr) {
    if (dateStr.isEmpty) return null;
    final date = DateTime.tryParse(dateStr);
    if (date == null) return null;
    final diff = date.difference(DateTime.now()).inDays;
    return diff >= 0 ? diff : null;
  }

  static bool isUpcoming(Movie movie) => _daysUntil(movie.releaseDate) != null;

  static bool isUpcomingDate(String dateString) =>
      _daysUntil(dateString) != null;

  @override
  Widget build(BuildContext context) {
    final days = _daysUntil(dateString);
    if (days == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.darkElevated.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: AppColors.ratingGold.withValues(alpha: 0.35), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.new_releases_rounded,
              color: AppColors.ratingGold, size: 12),
          const SizedBox(width: 4),
          Text(
            '${t.home.upcoming} · ${days == 0 ? t.movie_detail.release_today : days == 1 ? t.movie_detail.release_1_day : '$days ${t.movie_detail.release_days}'}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.ratingGold,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

