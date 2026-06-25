import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class CastSection extends StatelessWidget {
  final List<dynamic> cast;
  final List<dynamic> crew;

  const CastSection({super.key, required this.cast, required this.crew});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (cast.isEmpty && crew.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (crew.isNotEmpty) ...[
          _buildSectionHeader(theme, 'Director'),
          const SizedBox(height: 12),
          ...crew
              .where((c) => c['job'] == 'Director')
              .map((d) => Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: theme.dividerColor.withValues(alpha: 0.5)),
                    ),
                    child: Text(d['name'] ?? '',
                        style: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  )),
          const SizedBox(height: 20),
        ],
        if (cast.isNotEmpty) ...[
          _buildSectionHeader(theme, 'Cast'),
          const SizedBox(height: 14),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length > 10 ? 10 : cast.length,
              itemBuilder: (context, index) {
                final person = cast[index];
                final profilePath = person['profile_path'] as String? ?? '';
                final name = person['name'] as String? ?? '';
                final character = person['character'] as String? ?? '';
                final personId = person['id'] as int;

                return GestureDetector(
                  onTap: () => context.push('/person/$personId',
                      extra: {'name': name, 'profilePath': profilePath}),
                  child: Container(
                    width: 85,
                    margin: const EdgeInsets.only(right: 14),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.darkBorder
                                    .withValues(alpha: 0.3),
                                width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 34,
                            backgroundColor: theme.cardColor,
                            backgroundImage: profilePath.isNotEmpty
                                ? NetworkImage(
                                    'https://image.tmdb.org/t/p/w185$profilePath')
                                : null,
                            child: profilePath.isEmpty
                                ? Icon(Icons.person_rounded,
                                    size: 28, color: theme.hintColor)
                                : null,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600)),
                        if (character.isNotEmpty)
                          Text(character,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: theme.hintColor,
                                  fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(title,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
