import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie/features/movies/presentation/widgets/trailer_feedback.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../widgets/movie_detail/movie_detail_bottom_actions.dart';
import '../widgets/movie_detail/movie_detail_info.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie? movie;
  final int movieId;

  const MovieDetailPage({super.key, this.movie, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final ApiClient _apiClient = ApiClient();

  YoutubePlayerController? _ytController;
  StreamSubscription? _ytSubscription;
  String? _trailerKey;

  bool _hasTrailer = false;
  bool _trailerBlocked = false;
  bool _isLoading = true;

  Map<String, dynamic>? _details;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final locale = context.read<SettingsCubit>().state.locale;
      final data = await _apiClient.get('/movie/${widget.movieId}', params: {
        'append_to_response': 'videos',
        'language': getTmdbLanguageCode(locale),
      });

      if (!mounted) return;

      String? trailerKey;
      final videos = data['videos']?['results'] as List?;
      if (videos != null && videos.isNotEmpty) {
        final t = videos.firstWhere(
          (v) => v['site'] == 'YouTube' && v['type'] == 'Trailer',
          orElse: () => videos.firstWhere(
            (v) => v['site'] == 'YouTube',
            orElse: () => null,
          ),
        );
        if (t != null) trailerKey = t['key'];
      }

      if (trailerKey != null) {
        _trailerKey = trailerKey;

        _ytController = YoutubePlayerController(
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,
            mute: false,
          ),
        );

        _ytController!.loadVideoById(videoId: trailerKey);

        _ytSubscription = _ytController!.stream.listen((value) {
          if (mounted && value.error != YoutubeError.none) {
            setState(() => _trailerBlocked = true);
          }
        });
      }

      setState(() {
        _details = data;
        _hasTrailer = trailerKey != null;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('MovieDetailPage error: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _ytSubscription?.cancel();
    _ytSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentMovie = widget.movie ??
        Movie(
          id: widget.movieId,
          title: _details?['title'] as String? ?? '',
          overview: _details?['overview'] as String? ?? '',
          posterPath: _details?['poster_path'] as String? ?? '',
          backdropPath: _details?['backdrop_path'] as String? ?? '',
          releaseDate: _details?['release_date'] as String? ?? '',
          voteAverage: (_details?['vote_average'] as num?)?.toDouble() ?? 0.0,
        );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  _hasTrailer && !_trailerBlocked && _ytController != null
                      ? YoutubePlayer(controller: _ytController!)
                      : TrailerFallback(
                          posterUrl: currentMovie.fullPosterUrl,
                          trailerKey: _trailerBlocked ? _trailerKey : null,
                        ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailInfo(
                    movie: currentMovie,
                    uid: uid,
                    overview: _details?['overview'],
                  ),
                  const SizedBox(height: 32),
                  MovieDetailBottomActions(
                    movie: currentMovie,
                    uid: uid,
                  ),
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
