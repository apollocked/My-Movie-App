import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';

class ReleaseCountdownBadge extends StatelessWidget {
  final Movie movie;

  const ReleaseCountdownBadge({super.key, required this.movie});

  static int? _daysUntil(String dateStr) {
    if (dateStr.isEmpty) return null;
    final date = DateTime.tryParse(dateStr);
    if (date == null) return null;
    final diff = date.difference(DateTime.now()).inDays;
    return diff >= 0 ? diff : null;
  }

  static bool isUpcoming(Movie movie) => _daysUntil(movie.releaseDate) != null;

  @override
  Widget build(BuildContext context) {
    final days = _daysUntil(movie.releaseDate);
    if (days == null) return const SizedBox.shrink();

    final isUrgent = days <= 7;
    final iconColor = isUrgent ? AppColors.primaryOrange : AppColors.infoCyan;
    final bgColor = isUrgent
        ? AppColors.primaryRed.withValues(alpha: 0.9)
        : AppColors.darkElevated.withValues(alpha: 0.85);

    return Positioned(
      top: 46,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: iconColor.withValues(alpha: 0.4), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.schedule_rounded, color: iconColor, size: 12),
            const SizedBox(width: 4),
            Text(
              days == 0 ? t.movie_detail.release_today : days == 1 ? t.movie_detail.release_1_day : '$days ${t.movie_detail.release_days}',
              style: TextStyle(
                
                color: iconColor,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

