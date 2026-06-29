import 'package:flutter/material.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';

class CardRatingBadge extends StatefulWidget {
  final Movie movie;
  final String rating;

  const CardRatingBadge({
    super.key,
    required this.movie,
    required this.rating,
  });

  @override
  State<CardRatingBadge> createState() => _CardRatingBadgeState();
}

class _CardRatingBadgeState extends State<CardRatingBadge> {
  late final Stream<Map<String, dynamic>?> _ratingStream;

  @override
  void initState() {
    super.initState();
    final service = getIt<CollectionService>();
    _ratingStream = service.getRatingStream(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Positioned(
      top: 12,
      right: 12,
      child: StreamBuilder<Map<String, dynamic>?>(
        stream: _ratingStream,
        initialData: null,
        builder: (context, snapshot) {
          final data = snapshot.data;
          final hasRated = data != null;
          final displayRating = hasRated
              ? (data['rating'] as num?)?.toStringAsFixed(1) ?? widget.rating
              : widget.rating;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkElevated.withValues(alpha: 0.85)
                  : AppColors.lightSurface.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: hasRated ? AppColors.ratingGold : theme.dividerColor,
                width: hasRated ? 1.5 : 0.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  hasRated ? Icons.star_rounded : Icons.star_outline_rounded,
                  color: AppColors.ratingGold,
                  size: 14,
                ),
                const SizedBox(width: 2),
                Text(
                  displayRating,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
