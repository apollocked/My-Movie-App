import 'package:flutter/material.dart';

class ActorBiographyCard extends StatelessWidget {
  final String biography;
  const ActorBiographyCard({super.key, required this.biography});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: theme.dividerColor.withValues(alpha: 0.3)),
      ),
      child: Text(biography,
          style: theme.textTheme.bodyMedium
              ?.copyWith(height: 1.7, color: theme.hintColor)),
    );
  }
}
