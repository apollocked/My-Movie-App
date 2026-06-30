import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/core/utils/responsive.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import '../widgets/episode_hero.dart';
import '../widgets/episode_info.dart';
import '../widgets/episode_guest_stars.dart';

class EpisodeDetailPage extends StatefulWidget {
  final int showId;
  final int seasonNumber;
  final int episodeNumber;
  final Map<String, dynamic>? episodeData;

  const EpisodeDetailPage({
    super.key,
    required this.showId,
    required this.seasonNumber,
    required this.episodeNumber,
    this.episodeData,
  });

  @override
  State<EpisodeDetailPage> createState() => _EpisodeDetailPageState();
}

class _EpisodeDetailPageState extends State<EpisodeDetailPage> {
  final ApiClient _apiClient = ApiClient();
  bool _isLoading = true;
  Map<String, dynamic>? _details;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final lang =
          getTmdbLanguageCode(context.read<SettingsCubit>().state.locale);
      final data = await _apiClient.get(
        '/tv/${widget.showId}/season/${widget.seasonNumber}/episode/${widget.episodeNumber}',
        params: {'language': lang},
      );
      if (!mounted) return;
      setState(() {
        _details = data;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('EpisodeDetailPage error: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final ep = _details ?? widget.episodeData ?? {};
    final epNum = (ep['episode_number'] as num?)?.toInt() ?? widget.episodeNumber;
    final seasonNum = (ep['season_number'] as num?)?.toInt() ?? widget.seasonNumber;
    final stillPath = ep['still_path'] as String? ?? '';
    final overview = ep['overview'] as String? ?? '';
    final guestStars = (ep['guest_stars'] as List?) ?? [];
    final crew = (ep['crew'] as List?) ?? [];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          EpisodeHero(stillPath: stillPath),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  AppSizing.safeHorizontal(context), 8,
                  AppSizing.safeHorizontal(context), 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  EpisodeInfo(
                    seasonNum: seasonNum,
                    epNum: epNum,
                    title: ep['name'] as String? ?? '',
                    rating: (ep['vote_average'] as num?)?.toDouble() ?? 0,
                    runtime: (ep['runtime'] as num?)?.toInt(),
                    airDate: ep['air_date'] as String? ?? '',
                  ),
                  if (overview.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Container(
                      width: 4,
                      height: 18,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      overview,
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(height: 1.7, color: theme.hintColor),
                    ),
                  ],
                  if (guestStars.isNotEmpty || crew.isNotEmpty) ...[
                    const SizedBox(height: 32),
                    EpisodeGuestStars(
                      guestStars: guestStars,
                      crew: crew,
                    ),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
