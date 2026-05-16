import 'package:flutter/material.dart';
import 'package:my_movies_app/i18n/strings.g.dart';

class CollectionEmptyState extends StatelessWidget {
  const CollectionEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_filter_outlined,
              size: 80, color: theme.hintColor.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(
            t.common.empty_list,
            style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
