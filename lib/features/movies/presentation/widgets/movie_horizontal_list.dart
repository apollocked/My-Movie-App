import 'package:flutter/material.dart';
import 'movie_poster_card.dart';

class MovieHorizontalList extends StatelessWidget {
  final String title;
  final List<dynamic> movies;
  final double cardHeight;
  final ValueChanged<dynamic>? onMovieTap;

  const MovieHorizontalList({
    super.key,
    required this.title,
    required this.movies,
    this.cardHeight = 260,
    this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: movies.isEmpty ? 5 : movies.length,
            itemBuilder: (context, index) {
              final movie = movies.isEmpty ? null : movies[index];

              return GestureDetector(
                onTap: () {
                  if (movie != null && onMovieTap != null) {
                    onMovieTap!(movie);
                  }
                },
                child: MoviePosterCard(height: cardHeight, movie: movie),
              );
            },
          ),
        ),
      ],
    );
  }
}
