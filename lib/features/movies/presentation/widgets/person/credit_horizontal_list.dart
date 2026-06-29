import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../movie_poster_card.dart';
import '../actor_detail/actor_section_header.dart';

class CreditHorizontalList extends StatelessWidget {
  final String label;
  final List<Movie> items;
  final bool isTv;

  const CreditHorizontalList({
    super.key,
    required this.label,
    required this.items,
    this.isTv = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 28),
        ActorSectionHeader(title: '$label (${items.length})'),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final movie = items[index];
              return GestureDetector(
                onTap: () {
                  if (isTv) {
                    context.push('/show/${movie.id}', extra: movie);
                  } else {
                    context.push('/movie/${movie.id}', extra: movie);
                  }
                },
                child: SizedBox(
                  width: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Column(children: [
                      Expanded(
                          child: MoviePosterCard(height: 200, movie: movie)),
                      const SizedBox(height: 6),
                      Text(movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontWeight: FontWeight.w500)),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
