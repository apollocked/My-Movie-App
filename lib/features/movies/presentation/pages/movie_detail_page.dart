import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_event.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

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
      final data = await _apiClient.get(
        '/movie/${widget.movie.id}',
        params: {'append_to_response': 'videos'},
      );

      if (mounted) {
        final videos = data['videos']?['results'] as List?;
        String? trailerKey;

        if (videos != null && videos.isNotEmpty) {
          // Find YouTube trailer
          final t = videos.firstWhere(
            (v) => v['site'] == 'YouTube' && v['type'] == 'Trailer',
            orElse: () => videos.firstWhere(
              (v) => v['site'] == 'YouTube',
              orElse: () => null,
            ),
          );
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

  void _execAction(String msg, VoidCallback action) {
    final authState = context.read<AuthBloc>().state;
    if (authState is! Authenticated) {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock, size: 54, color: Colors.orange),
              const SizedBox(height: 16),
              Text('Account Required',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Sign in to $msg.', textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  Navigator.pop(ctx);
                  context.go('/onboarding');
                },
                child: const Text('Login / Register'),
              ),
            ],
          ),
        ),
      );
    } else {
      action();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_ytController != null)
                    YoutubePlayer(
                      controller: _ytController!,
                      showVideoProgressIndicator: true,
                      progressColors: ProgressBarColors(
                        playedColor: theme.primaryColor,
                        handleColor: theme.primaryColor,
                      ),
                    )
                  else
                    Image.network(
                      widget.movie.fullPosterUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(height: 300, color: theme.cardColor),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.movie.title,
                            style: theme.textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: theme.colorScheme.secondary, size: 20),
                            const SizedBox(width: 4),
                            Text(
                                '${widget.movie.voteAverage.toStringAsFixed(1)}/10'),
                            const SizedBox(width: 16),
                            const Icon(Icons.calendar_month,
                                size: 18, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(widget.movie.releaseDate,
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          _details?['overview'] ?? widget.movie.overview,
                          style:
                              theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () =>
                                    _execAction('add to Watch Later', () {
                                  context
                                      .read<MovieBloc>()
                                      .add(ToggleWatchLater(widget.movie));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Added to Watch Later!')));
                                }),
                                icon: const Icon(Icons.bookmark_add_outlined),
                                label: const Text('Watch Later'),
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12)),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _execAction('rate movies', () {
                                  context.read<MovieBloc>().add(RateMovie(widget.movie, 10.0));
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('10/10 Rating Submitted to Firebase!')));
                                }),
                                icon: const Icon(Icons.star_border),
                                label: const Text('Rate'),
                                style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
