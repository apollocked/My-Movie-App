import 'package:flutter/material.dart';

class SwipeProgressBadge extends StatelessWidget {
  final int current;
  final int total;

  const SwipeProgressBadge({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text('$current / $total',
            style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
