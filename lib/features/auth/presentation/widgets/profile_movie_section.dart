import 'package:flutter/material.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_poster_card.dart';

class ProfileMovieSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String collectionType;
  final Color iconColor;

  const ProfileMovieSection({
    super.key,
    required this.icon,
    required this.title,
    required this.collectionType,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final service = CollectionService();

    return StreamBuilder<List<Movie>>(
      stream: service.watchCollection(collectionType),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }
        final movies = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: Row(
                children: [
                  Icon(icon, color: iconColor, size: 20),
                  const SizedBox(width: 8),
                  Text(title,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 24),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: MoviePosterCard(movie: movie, height: 170),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
