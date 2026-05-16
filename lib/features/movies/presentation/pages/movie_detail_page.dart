import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/core/utils/locale_utils.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import '../widgets/movie_detail/movie_detail_bottom_actions.dart';
import '../widgets/movie_detail/movie_detail_info.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final ApiClient _apiClient = ApiClient();
  YoutubePlayerController? _ytController;
  Map<String, dynamic>? _details;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final locale = context.read<SettingsCubit>().state.locale;
      final data = await _apiClient.get('/movie/${widget.movie.id}', params: {
        'append_to_response': 'videos',
        'language': getTmdbLanguageCode(locale),
      });

      if (mounted) {
        final videos = data['videos']?['results'] as List?;
        String? trailerKey;
        if (videos != null && videos.isNotEmpty) {
          final t = videos.firstWhere((v) => v['site'] == 'YouTube' && v['type'] == 'Trailer',
              orElse: () => videos.firstWhere((v) => v['site'] == 'YouTube', orElse: () => null));
          if (t != null) trailerKey = t['key'];
        }
        setState(() {
          _details = data;
          _isLoading = false;
          if (trailerKey != null) {
            _ytController = YoutubePlayerController(
              initialVideoId: trailerKey,
              flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
            );
          }
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _ytController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 240,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _ytController != null
                        ? YoutubePlayer(controller: _ytController!)
                        : Image.network(widget.movie.fullPosterUrl, fit: BoxFit.cover),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieDetailInfo(movie: widget.movie, uid: uid, overview: _details?['overview']),
                        const SizedBox(height: 32),
                        MovieDetailBottomActions(movie: widget.movie, uid: uid),
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
