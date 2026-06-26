import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            Text('Something went wrong', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            const SizedBox(height: 24),
            ElevatedButton.icon(onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded), label: const Text('Try Again')),
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
            ElevatedButton.icon(onPressed: onChangeFilters,
                icon: const Icon(Icons.tune_rounded), label: const Text('Change Filters')),
          ],
        ),
      ),
    );
  }
}

class AllSwipedView extends StatelessWidget {
  final int count;
  final VoidCallback onTryAgain;

  const AllSwipedView({super.key, required this.count, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded, size: 80,
                color: AppColors.successGreen.withValues(alpha: 0.8)),
            const SizedBox(height: 20),
            Text('You\'re all caught up!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(count == 0 ? 'No movies were added to watch later.'
                : '$count movie${count == 1 ? '' : 's'} added to watch later!',
                style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            const SizedBox(height: 32),
            ElevatedButton.icon(onPressed: onTryAgain,
                icon: const Icon(Icons.refresh_rounded), label: const Text('Try Again'),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14))),
            const SizedBox(height: 12),
            TextButton.icon(onPressed: () => context.push('/collection/watch_later'),
                icon: const Icon(Icons.watch_later_rounded, size: 18),
                label: const Text('View Watch Later')),
          ],
        ),
      ),
    );
  }
}
