import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';

class SeasonEpisodeSection extends StatefulWidget {
  final int showId;
  final List<dynamic> seasons;

  const SeasonEpisodeSection({
    super.key,
    required this.showId,
    required this.seasons,
  });

  @override
  State<SeasonEpisodeSection> createState() => _SeasonEpisodeSectionState();
}

class _SeasonEpisodeSectionState extends State<SeasonEpisodeSection> {
  int? _expandedSeason;
  final Map<int, List<Map<String, dynamic>>> _episodeCache = {};
  final Map<int, bool> _loadingSeason = {};
  final ApiClient _api = ApiClient();

  Future<void> _fetchEpisodes(int seasonNumber) async {
    if (_episodeCache.containsKey(seasonNumber)) return;
    setState(() => _loadingSeason[seasonNumber] = true);
    try {
      final data = await _api.get(
        '/tv/${widget.showId}/season/$seasonNumber',
      );
      final episodes =
          (data['episodes'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      if (mounted) {
        setState(() {
          _episodeCache[seasonNumber] = episodes;
          _loadingSeason[seasonNumber] = false;
        });
      }
    } catch (e) {
      debugPrint('SeasonEpisodeSection.fetchEpisodes error: $e');
      if (mounted) setState(() => _loadingSeason[seasonNumber] = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final validSeasons = widget.seasons
        .where((s) => (s['season_number'] as num?)?.toInt() != 0)
        .toList();
    if (validSeasons.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        ...validSeasons.map((s) => _buildSeasonCard(context, s)),
      ],
    );
  }

  Widget _buildHeader() {
    final theme = Theme.of(context);
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
        Flexible(
            child: Text(t.movie_detail.show.seasons_and_episodes,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700))),
      ],
    );
  }

  Widget _buildSeasonCard(BuildContext context, Map<String, dynamic> season) {
    final theme = Theme.of(context);
    final sn = (season['season_number'] as num?)?.toInt() ?? 0;
    final name =
        season['name'] as String? ?? '${t.movie_detail.show.season} $sn';
    final epCount = (season['episode_count'] as num?)?.toInt() ?? 0;
    final posterPath = season['poster_path'] as String? ?? '';
    final isExpanded = _expandedSeason == sn;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expandedSeason = isExpanded ? null : sn;
            });
            if (!isExpanded) _fetchEpisodes(sn);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
            decoration: BoxDecoration(
              color: isExpanded
                  ? theme.colorScheme.primary.withValues(alpha: 0.08)
                  : theme.cardColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isExpanded
                    ? theme.colorScheme.primary.withValues(alpha: 0.3)
                    : theme.dividerColor.withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: CachedNetworkImage(
                      imageUrl: posterPath.isNotEmpty
                          ? 'https://image.tmdb.org/t/p/w185$posterPath'
                          : '',
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(
                        color: theme.cardColor,
                        child:
                            const Icon(Icons.tv_rounded, color: Colors.white24),
                      ),
                      errorWidget: (_, __, ___) => Container(
                        color: theme.cardColor,
                        child:
                            const Icon(Icons.tv_rounded, color: Colors.white24),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('$epCount ${t.movie_detail.show.episodes}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.hintColor,
                          )),
                    ],
                  ),
                ),
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child:
                      Icon(Icons.expand_more_rounded, color: theme.hintColor),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: _buildEpisodeList(theme, sn),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
        ),
      ],
    );
  }

  Widget _buildEpisodeList(ThemeData theme, int seasonNumber) {
    final loading = _loadingSeason[seasonNumber] ?? false;
    if (loading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
            child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2))),
      );
    }
    final episodes = _episodeCache[seasonNumber];
    if (episodes == null || episodes.isEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 0, 12),
        child: Text(t.movie_detail.show.no_episodes,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 12),
      child: Column(
        children: episodes
            .map((ep) => _buildEpisodeCard(
                context, theme, ep, seasonNumber,
                ValueKey('ep_${seasonNumber}_${ep['episode_number']}')))
            .toList(),
      ),
    );
  }

  Widget _buildEpisodeCard(BuildContext context, ThemeData theme,
      Map<String, dynamic> ep, int seasonNumber, [Key? key]) {
    final epNum = (ep['episode_number'] as num?)?.toInt() ?? 0;
    final title = ep['name'] as String? ?? '';
    final overview = ep['overview'] as String? ?? '';
    final stillPath = ep['still_path'] as String? ?? '';
    final runtime = (ep['runtime'] as num?)?.toInt();
    final rating = (ep['vote_average'] as num?)?.toDouble() ?? 0;
    final airDate = ep['air_date'] as String? ?? '';

    return GestureDetector(
        key: key,
        onTap: () => context.push(
              '/show/${widget.showId}/season/$seasonNumber/episode/$epNum',
              extra: ep,
            ),
        child: Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.cardColor.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: theme.dividerColor.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (stillPath.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: AppSizing.scale(context, 120).clamp(80.0, 160.0),
                        height: AppSizing.scale(context, 68).clamp(48.0, 90.0),
                        child: CachedNetworkImage(
                          imageUrl: 'https://image.tmdb.org/t/p/w300$stillPath',
                          fit: BoxFit.cover,
                          placeholder: (_, __) => Container(
                            color: theme.disabledColor.withValues(alpha: 0.2),
                          ),
                          errorWidget: (_, __, ___) => Container(
                            color: theme.disabledColor.withValues(alpha: 0.2),
                            child: const Icon(Icons.broken_image_rounded,
                                size: 24, color: Colors.white24),
                          ),
                        ),
                      ),
                    ),
                  if (stillPath.isNotEmpty) const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary
                                    .withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text('$epNum',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.labelLarge
                                      ?.copyWith(fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            if (rating > 0) ...[
                              Icon(Icons.star_rounded,
                                  size: 12, color: AppColors.ratingGold),
                              const SizedBox(width: 2),
                              Text(rating.toStringAsFixed(1),
                                  style: theme.textTheme.labelSmall
                                      ?.copyWith(color: AppColors.ratingGold)),
                              const SizedBox(width: 12),
                            ],
                            if (runtime != null && runtime > 0) ...[
                              Icon(Icons.schedule_rounded,
                                  size: 12, color: theme.hintColor),
                              const SizedBox(width: 2),
                              Text('${runtime}m',
                                  style: theme.textTheme.labelSmall
                                      ?.copyWith(color: theme.hintColor)),
                              const SizedBox(width: 12),
                            ],
                            if (airDate.isNotEmpty)
                              Expanded(
                                child: Text(airDate,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelSmall
                                        ?.copyWith(color: theme.hintColor)),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (overview.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall
                        ?.copyWith(height: 1.5, color: theme.hintColor)),
              ],
            ],
          ),
        ));
  }
}
