import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/genre_chip.dart';

class FilterGenreSection extends StatelessWidget {
  final Set<int> selectedGenreIds;
  final ValueChanged<int> onGenreToggled;
  final bool isTv;

  const FilterGenreSection({
    super.key,
    required this.selectedGenreIds,
    required this.onGenreToggled,
    this.isTv = false,
  });

  static const _movieGenres = [
    (28, 'g_28', Icons.flash_on_rounded),
    (12, 'g_12', Icons.explore_rounded),
    (16, 'g_16', Icons.animation_rounded),
    (35, 'g_35', Icons.sentiment_satisfied_rounded),
    (80, 'g_80', Icons.local_police_rounded),
    (99, 'g_99', Icons.description_rounded),
    (18, 'g_18', Icons.theater_comedy_rounded),
    (14, 'g_14', Icons.auto_fix_high_rounded),
    (36, 'g_36', Icons.history_rounded),
    (27, 'g_27', Icons.dangerous_rounded),
    (10402, 'g_10402', Icons.music_note_rounded),
    (9648, 'g_9648', Icons.search_rounded),
    (10749, 'g_10749', Icons.favorite_rounded),
    (878, 'g_878', Icons.rocket_launch_rounded),
    (53, 'g_53', Icons.visibility_rounded),
    (10752, 'g_10752', Icons.shield_rounded),
    (37, 'g_37', Icons.landscape_rounded),
  ];

  static const _tvGenres = [
    (10759, 'g_10759', Icons.flash_on_rounded),
    (16, 'g_16', Icons.animation_rounded),
    (35, 'g_35', Icons.sentiment_satisfied_rounded),
    (80, 'g_80', Icons.local_police_rounded),
    (99, 'g_99', Icons.description_rounded),
    (18, 'g_18', Icons.theater_comedy_rounded),
    (10751, 'g_10751', Icons.family_restroom_rounded),
    (10762, 'g_10762', Icons.child_care_rounded),
    (9648, 'g_9648', Icons.search_rounded),
    (10763, 'g_10763', Icons.newspaper_rounded),
    (10764, 'g_10764', Icons.videocam_rounded),
    (10765, 'g_10765', Icons.rocket_launch_rounded),
    (10766, 'g_10766', Icons.water_drop_rounded),
    (10767, 'g_10767', Icons.chat_rounded),
    (10768, 'g_10768', Icons.shield_rounded),
    (37, 'g_37', Icons.landscape_rounded),
  ];

  List<(int, String, IconData)> get _genres => isTv ? _tvGenres : _movieGenres;

  String _genreLabel((int, String, IconData) g) {
    switch (g.$2) {
      case 'g_28': return t.genres.g_28;
      case 'g_12': return t.genres.g_12;
      case 'g_16': return t.genres.g_16;
      case 'g_35': return t.genres.g_35;
      case 'g_80': return t.genres.g_80;
      case 'g_99': return t.genres.g_99;
      case 'g_18': return t.genres.g_18;
      case 'g_14': return t.genres.g_14;
      case 'g_36': return t.genres.g_36;
      case 'g_27': return t.genres.g_27;
      case 'g_10402': return t.genres.g_10402;
      case 'g_9648': return t.genres.g_9648;
      case 'g_10749': return t.genres.g_10749;
      case 'g_878': return t.genres.g_878;
      case 'g_53': return t.genres.g_53;
      case 'g_10752': return t.genres.g_10752;
      case 'g_37': return t.genres.g_37;
      case 'g_10759': return t.genres_tv.g_10759;
      case 'g_10751': return t.genres.g_10751;
      case 'g_10762': return t.genres_tv.g_10762;
      case 'g_10763': return t.genres_tv.g_10763;
      case 'g_10764': return t.genres_tv.g_10764;
      case 'g_10765': return t.genres_tv.g_10765;
      case 'g_10766': return t.genres_tv.g_10766;
      case 'g_10767': return t.genres_tv.g_10767;
      case 'g_10768': return t.genres_tv.g_10768;
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
          child: Row(
            children: [
              Icon(Icons.category_rounded,
                  size: 16, color: theme.colorScheme.primary),
              const SizedBox(width: 6),
              Text(t.swipe.genres,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              const Spacer(),
              Text('${selectedGenreIds.length} ${t.swipe.selected}',
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: _genres
                  .map((g) => GenreChip(
                        label: _genreLabel(g),
                        icon: g.$3,
                        isSelected: selectedGenreIds.contains(g.$1),
                        onTap: () => onGenreToggled(g.$1),
                      ))
                  .toList(),
            ),
        ),
      ],
    );
  }
}
