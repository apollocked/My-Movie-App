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
import 'package:my_movie/features/movies/presentation/widgets/movie_detail/movie_detail_bottom_actions.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_detail/movie_detail_info.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_detail/cast_section.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_detail/play_trailer_button.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_detail/section_divider.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_detail/recommendations_section.dart';


class ShowDetailPage extends StatefulWidget {
  final Movie? show;
  final int showId;
  final bool autoPlayTrailer;
  const ShowDetailPage({super.key, this.show, required this.showId, this.autoPlayTrailer = false});
  @override
  State<ShowDetailPage> createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  final ApiClient _apiClient = ApiClient();
  YoutubePlayerController? _ytController;
  StreamSubscription? _ytSubscription;
  String? _trailerKey;
  bool _hasTrailer = false, _trailerBlocked = false, _isLoading = true;
  Map<String, dynamic>? _details;
  List<Movie> _recommendations = [];
  List<dynamic> _cast = [], _crew = [];

  @override
  void initState() { super.initState(); _fetchData(); }

  Future<void> _fetchData() async {
    try {
      final lang = getTmdbLanguageCode(context.read<SettingsCubit>().state.locale);
      final data = await _apiClient.get('/tv/${widget.showId}',
          params: {'append_to_response': 'videos,credits', 'language': lang});
      if (!mounted) return;
      String? trailerKey;
      final videos = data['videos']?['results'] as List?;
      if (videos != null && videos.isNotEmpty) {
        final t = videos.firstWhere(
          (v) => v['site'] == 'YouTube' && v['type'] == 'Trailer',
          orElse: () => videos.firstWhere((v) => v['site'] == 'YouTube', orElse: () => null));
        if (t != null) trailerKey = t['key'];
      }
      if (trailerKey != null) {
        _trailerKey = trailerKey;
        _ytController?.close();
        _ytSubscription?.cancel();
        _ytController = YoutubePlayerController(
            params: const YoutubePlayerParams(showControls: true, showFullscreenButton: true, mute: false));
        _ytController!.loadVideoById(videoId: trailerKey);
        if (widget.autoPlayTrailer) _ytController!.playVideo();
        _ytSubscription = _ytController!.stream.listen((value) {
          if (mounted && value.error != YoutubeError.none) setState(() => _trailerBlocked = true);
        });
      }
      final credits = data['credits'] as Map<String, dynamic>?;
      final cl = credits?['cast'] as List? ?? [];
      final cw = credits?['crew'] as List? ?? [];
      List<Movie> recs = [];
      try {
        final recData = await _apiClient.get(
            '/tv/${widget.showId}/recommendations', params: {'language': lang});
        recs = ((recData['results'] as List?) ?? []).map((json) => Movie(
          id: (json['id'] as num?)?.toInt() ?? 0,
          title: json['name'] as String? ?? '',
          overview: json['overview'] as String? ?? '',
          posterPath: json['poster_path'] as String? ?? '',
          backdropPath: json['backdrop_path'] as String? ?? '',
          releaseDate: json['first_air_date'] as String? ?? '',
          voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
          isShow: true,
        )).toList();
      } catch (_) {}
      if (!mounted) return;
      setState(() {
        _details = data; _hasTrailer = trailerKey != null; _isLoading = false;
        _cast = cl; _crew = cw; _recommendations = recs;
      });
    } catch (e) {
      debugPrint('ShowDetailPage error: $e');
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _ytController?.close();
    _ytController = null;
    _ytSubscription?.cancel();
    _ytSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (_isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final currentShow = widget.show ?? Movie(
      id: widget.showId,
      title: _details?['name'] as String? ?? '',
      overview: _details?['overview'] as String? ?? '',
      posterPath: _details?['poster_path'] as String? ?? '',
      backdropPath: _details?['backdrop_path'] as String? ?? '',
      releaseDate: _details?['first_air_date'] as String? ?? '',
      voteAverage: (_details?['vote_average'] as num?)?.toDouble() ?? 0.0,
      isShow: true,
    );
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: RefreshIndicator(
        onRefresh: _fetchData,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 260, pinned: true,
              backgroundColor: theme.scaffoldBackgroundColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(fit: StackFit.expand, children: [
                  _hasTrailer && !_trailerBlocked && _ytController != null
                      ? YoutubePlayer(controller: _ytController!)
                      : TrailerFallback(imageUrl: currentShow.fullBackdropUrl),
                  IgnorePointer(child: Container(decoration: const BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xB007090F), Color(0xFF07090F)], stops: [0.0, 0.5, 1.0]),
                  ))),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  if (_hasTrailer) ...[const SizedBox(height: 20), PlayTrailerButton(trailerKey: _trailerKey)],
                  const SizedBox(height: 28),
                  MovieDetailInfo(movie: currentShow, uid: uid, overview: _details?['overview']),
                  CastSection(cast: _cast, crew: _crew),
                  const SizedBox(height: 32),
                  SectionDivider(color: theme.dividerColor),
                  const SizedBox(height: 20),
                  MovieDetailBottomActions(movie: currentShow, uid: uid),
                  const SizedBox(height: 32),
                  RecommendationsSection(movies: _recommendations),
                  const SizedBox(height: 40),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
