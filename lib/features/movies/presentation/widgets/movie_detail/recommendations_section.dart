import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_poster_card.dart';

class RecommendationsSection extends StatelessWidget {
  final List<Movie> movies;

  const RecommendationsSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You Might Also Like',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () =>
                    context.push('/movie/${movie.id}', extra: movie),
                child: SizedBox(
                  width: 130,
                  child: MoviePosterCard(height: 200, movie: movie),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
