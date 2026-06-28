import 'package:flutter/material.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'movie_poster_card.dart';

class MovieHorizontalList extends StatelessWidget {
  final String? title;
  final List<Movie> movies;
  final double cardHeight;
  final ValueChanged<Movie>? onMovieTap;

  const MovieHorizontalList({
    super.key,
    this.title,
    required this.movies,
    this.cardHeight = 260,
    this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
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
