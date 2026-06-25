import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_horizontal_list.dart';

class WatchLaterRow extends StatelessWidget {
  const WatchLaterRow({super.key});

  @override
  Widget build(BuildContext context) {
    final service = CollectionService();

    return StreamBuilder<List<Movie>>(
      stream: service.watchCollection('watch_later'),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }
        final movies = snapshot.data!;
        return Column(
          children: [
            MovieHorizontalList(
              title: t.movie_detail.watch_later,
              movies: movies,
              cardHeight: 220,
              onMovieTap: (Movie movie) {
                context.push('/movie/${movie.id}', extra: movie);
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
