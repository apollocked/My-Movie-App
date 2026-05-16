import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/core/utils/locale_utils.dart';
import 'package:my_movies_app/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
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
  late YoutubePlayerController _ytController;
  bool _hasTrailer = false;
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
      final data = await _apiClient.get('/movie/${widget.movieId}', params: {
        'append_to_response': 'videos',
        'language': getTmdbLanguageCode(locale),
      });

      if (mounted) {
        final videos = data['videos']?['results'] as List?;
        String? trailerKey;
        if (videos != null && videos.isNotEmpty) {
          final t = videos.firstWhere(
              (v) => v['site'] == 'YouTube' && v['type'] == 'Trailer',
              orElse: () => videos.firstWhere((v) => v['site'] == 'YouTube',
                  orElse: () => null));
          if (t != null) trailerKey = t['key'];
        }
        setState(() {
          _details = data;
          _isLoading = false;
          if (trailerKey != null) {
            _ytController = YoutubePlayerController.fromVideoId(
              videoId: trailerKey,
              autoPlay: false,
              params: const YoutubePlayerParams(
                showControls: true,
                showFullscreenButton: true,
              ),
            );
            setState(() {
              _hasTrailer = true;
              _details = data;
              _isLoading = false;
            });
          }
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
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
                background: _hasTrailer
                    ? YoutubePlayer(controller: _ytController)
                    : Image.network(currentMovie.fullPosterUrl,
                        fit: BoxFit.cover)),
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
