import 'package:flutter/material.dart';

class CollectionEmptyState extends StatelessWidget {
  final Locale locale;

  const CollectionEmptyState({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAr = locale.languageCode == 'ar';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_filter_outlined,
              size: 80, color: theme.hintColor.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(
            isAr ? 'قائمتك فارغة حالياً' : 'Your list is currently empty',
            style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor),
          ),
        ],
      ),
    );
  }
}
