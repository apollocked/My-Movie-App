import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/movie_horizontal_list.dart';

class WatchLaterRow extends StatefulWidget {
  const WatchLaterRow({super.key});

  @override
  State<WatchLaterRow> createState() => _WatchLaterRowState();
}

class _WatchLaterRowState extends State<WatchLaterRow> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadWatchLater();
  }

  Future<void> _loadWatchLater() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('watch_later') ?? [];
    if (mounted) {
      setState(() {
        _movies = list.map((e) {
          final json = jsonDecode(e);
          return Movie(
            id: json['id'],
            title: json['title'],
            overview: json['overview'],
            posterPath: json['posterPath'],
            backdropPath: json['backdropPath'],
            releaseDate: json['releaseDate'],
            voteAverage: json['voteAverage'],
          );
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_movies.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        MovieHorizontalList(
          title: 'Your Watch Later',
          movies: _movies,
          cardHeight: 220,
          onMovieTap: (Movie movie) {
            // Reload when returning from details page in case it was removed
            context.push('/movie/${movie.id}', extra: movie).then((_) => _loadWatchLater());
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
