import 'package:flutter/material.dart';

class PersonProfileHeader extends StatelessWidget {
  final String name;
  final String profilePath;
  final String knownFor;

  const PersonProfileHeader({
    super.key,
    required this.name,
    required this.profilePath,
    this.knownFor = '',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: theme.dividerColor.withValues(alpha: 0.5), width: 2),
            ),
            child: CircleAvatar(
              radius: 56,
              backgroundColor: theme.cardColor,
              backgroundImage: profilePath.isNotEmpty
                  ? NetworkImage(
                      'https://image.tmdb.org/t/p/w185$profilePath')
                  : null,
              child: profilePath.isEmpty
                  ? Icon(Icons.person_rounded, size: 46, color: theme.hintColor)
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(name,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w800)),
        if (knownFor.isNotEmpty) ...[
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(knownFor,
                style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ],
    );
  }
}
