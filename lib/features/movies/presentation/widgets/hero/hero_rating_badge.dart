import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class HeroRatingBadge extends StatelessWidget {
  const HeroRatingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: theme.colorScheme.secondary.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded,
              color: theme.colorScheme.secondary, size: 14),
          const SizedBox(width: 4),
          Text(t.search.top_rated_badge,
          
              style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2)),
        ],
      ),
    );
  }
}
