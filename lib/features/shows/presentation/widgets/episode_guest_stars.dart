import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class EpisodeGuestStars extends StatelessWidget {
  final List<dynamic> guestStars;
  final List<dynamic> crew;

  const EpisodeGuestStars({
    super.key,
    required this.guestStars,
    required this.crew,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          t.movie_detail.cast,
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: guestStars.length + crew.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final isGuest = index < guestStars.length;
              final person = isGuest
                  ? guestStars[index] as Map<String, dynamic>
                  : crew[index - guestStars.length]
                      as Map<String, dynamic>;
              final name = person['name'] as String? ?? '';
              final profilePath = person['profile_path'] as String? ?? '';
              final role = isGuest
                  ? (person['character'] as String? ?? '')
                  : (person['job'] as String? ?? '');

              return SizedBox(
                width: 80,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: profilePath.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w185$profilePath',
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                              placeholder: (_, __) =>
                                  CircleAvatar(
                                backgroundColor: theme
                                    .disabledColor
                                    .withValues(alpha: 0.2),
                              ),
                              errorWidget: (_, __, ___) =>
                                  CircleAvatar(
                                backgroundColor: theme
                                    .disabledColor
                                    .withValues(alpha: 0.2),
                                child: Icon(Icons.person,
                                    size: 24,
                                    color: theme.hintColor),
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: theme
                                  .disabledColor
                                  .withValues(alpha: 0.2),
                              child: Icon(Icons.person,
                                  size: 24,
                                  color: theme.hintColor),
                            ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    if (role.isNotEmpty)
                      Text(
                        role,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelSmall
                            ?.copyWith(
                          color: theme.hintColor,
                          fontSize: 10,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
