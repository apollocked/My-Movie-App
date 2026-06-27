import 'package:flutter/material.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class ErrorSwipeView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorSwipeView({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded, size: 64, color: AppColors.errorRed.withValues(alpha: 0.7)),
            const SizedBox(height: 16),
            Text(t.swipe.error_title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            const SizedBox(height: 24),
            AnimatedButton(text: t.swipe.retry, onPressed: onRetry,
                icon: Icons.refresh_rounded),
          ],
        ),
      ),
    );
  }
}

class EmptySwipeView extends StatelessWidget {
  final String message;
  final VoidCallback onChangeFilters;

  const EmptySwipeView({super.key, required this.message, required this.onChangeFilters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sentiment_dissatisfied_rounded, size: 64,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 24),
            AnimatedButton(text: t.swipe.change_filters, onPressed: onChangeFilters,
                icon: Icons.tune_rounded),
          ],
        ),
      ),
    );
  }
}

class AllSwipedView extends StatelessWidget {
  final int count;
  final VoidCallback onViewWatchLater;
  final VoidCallback onRefine;

  const AllSwipedView({
    super.key,
    required this.count,
    required this.onViewWatchLater,
    required this.onRefine,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded, size: 80,
                color: AppColors.successGreen.withValues(alpha: 0.8)),
            const SizedBox(height: 20),
            Text(t.swipe.all_caught_up,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(count == 0 ? t.swipe.no_movies_added
                : '$count ${count == 1 ? t.swipe.movie_added : t.swipe.movies_added}',
                style: TextStyle(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            const SizedBox(height: 40),
            AnimatedButton(
              text: t.swipe.change_filters,
              onPressed: onRefine,
              icon: Icons.tune_rounded,
              height: 50,
            ),
            const SizedBox(height: 12),
            AnimatedButton(
              text: t.swipe.view_watch_later,
              onPressed: onViewWatchLater,
              icon: Icons.watch_later_rounded,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}