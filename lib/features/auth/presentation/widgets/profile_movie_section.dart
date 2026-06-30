import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_poster_card.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';

class ProfileMovieSection extends StatefulWidget {
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
  State<ProfileMovieSection> createState() => _ProfileMovieSectionState();
}

class _ProfileMovieSectionState extends State<ProfileMovieSection> {
  final CollectionService _service = getIt<CollectionService>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTv = context.watch<ContentTypeCubit>().state == ContentType.shows;

    return StreamBuilder<List<Movie>>(
      stream: _service.watchCollection(widget.collectionType),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }
        final allMovies = snapshot.data!;
        final movies = allMovies.where((m) => m.isShow == isTv).toList();
        if (movies.isEmpty) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
              child: Row(
                children: [
                  Icon(widget.icon, color: widget.iconColor, size: 20),
                  const SizedBox(width: 8),
                  Text(widget.title,
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
                    key: ValueKey('profile_movie_${movie.id}'),
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        if (isTv) {
                          context.push('/show/${movie.id}', extra: movie);
                        } else {
                          context.push('/movie/${movie.id}', extra: movie);
                        }
                      },
                      child: MoviePosterCard(movie: movie, height: 170),
                    ),
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
