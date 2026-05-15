import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';
import 'movie_poster_card.dart';

class MovieHorizontalList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final double cardHeight;

  const MovieHorizontalList({
    super.key,
    required this.title,
    required this.movies,
    this.cardHeight = 220,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) =>
                MoviePosterCard(movie: movies[index], height: cardHeight),
          ),
        ),
      ],
    );
  }
}
