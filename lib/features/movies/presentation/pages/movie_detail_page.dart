import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      _showAuthPrompt(context, msg);
    } else {
      action();
    }
  }

  void _showAuthPrompt(BuildContext context, String msg) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock, size: 54, color: Colors.orange),
            const SizedBox(height: 16),
            Text('Account Required', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Sign in to $msg.', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
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
  }

  void _showRatingDialog() {
    double selectedRating = 5.0;
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Rate this Movie'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${selectedRating.toInt()}/10 Stars', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Slider(
                value: selectedRating,
                min: 1,
                max: 10,
                divisions: 9,
                activeColor: Colors.amber,
                onChanged: (val) => setDialogState(() => selectedRating = val),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(10, (index) => Icon(
                  index < selectedRating ? Icons.star : Icons.star_border,
                  size: 20,
                  color: Colors.amber,
                )),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                context.read<MovieBloc>().add(RateMovie(widget.movie, selectedRating));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Rated ${selectedRating.toInt()}/10!')));
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uid = FirebaseAuth.instance.currentUser?.uid;

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
                    )
                  else
                    Image.network(widget.movie.fullPosterUrl, height: 300, width: double.infinity, fit: BoxFit.cover),
                  
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(widget.movie.title, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                            ),
                            if (uid != null)
                              StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance.collection('users').doc(uid).collection('favorites').doc(widget.movie.id.toString()).snapshots(),
                                builder: (context, snapshot) {
                                  final isFav = snapshot.hasData && snapshot.data!.exists;
                                  return IconButton(
                                    icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red, size: 30),
                                    onPressed: () => context.read<MovieBloc>().add(ToggleFavorite(widget.movie)),
                                  );
                                },
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text('${widget.movie.voteAverage.toStringAsFixed(1)}/10'),
                            const SizedBox(width: 16),
                            const Icon(Icons.calendar_month, size: 18, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(widget.movie.releaseDate, style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(_details?['overview'] ?? widget.movie.overview, style: theme.textTheme.bodyLarge?.copyWith(height: 1.5)),
                        const SizedBox(height: 32),
                        
                        Row(
                          children: [
                            Expanded(
                              child: StreamBuilder<DocumentSnapshot>(
                                stream: uid == null ? const Stream.empty() : FirebaseFirestore.instance.collection('users').doc(uid).collection('watch_later').doc(widget.movie.id.toString()).snapshots(),
                                builder: (context, snapshot) {
                                  final isAdded = snapshot.hasData && snapshot.data!.exists;
                                  return ElevatedButton.icon(
                                    onPressed: () => _execAction('add to Watch Later', () {
                                      context.read<MovieBloc>().add(ToggleWatchLater(widget.movie));
                                    }),
                                    icon: Icon(isAdded ? Icons.bookmark : Icons.bookmark_add_outlined),
                                    label: Text(isAdded ? 'Saved' : 'Watch Later'),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      backgroundColor: isAdded ? Colors.green : theme.primaryColor,
                                      foregroundColor: Colors.white,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: StreamBuilder<DocumentSnapshot>(
                                stream: uid == null ? const Stream.empty() : FirebaseFirestore.instance.collection('users').doc(uid).collection('ratings').doc(widget.movie.id.toString()).snapshots(),
                                builder: (context, snapshot) {
                                  final hasRated = snapshot.hasData && snapshot.data!.exists;
                                  final rating = hasRated ? (snapshot.data!.data() as Map<String, dynamic>)['rating'] : null;
                                  return OutlinedButton.icon(
                                    onPressed: () => _execAction('rate movies', _showRatingDialog),
                                    icon: Icon(hasRated ? Icons.star : Icons.star_border, color: Colors.amber),
                                    label: Text(hasRated ? '${rating.toInt()}/10' : 'Rate'),
                                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12)),
                                  );
                                },
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
