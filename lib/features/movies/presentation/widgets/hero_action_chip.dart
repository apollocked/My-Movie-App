import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_event.dart';
import '../blocs/movie_bloc/movie_bloc.dart';
import '../blocs/movie_bloc/movie_event.dart';

class HeroActionChip extends StatelessWidget {
  final Movie movie;
  final String collection;
  final String label;
  final IconData icon, inactiveIcon;
  final Color activeColor;

  const HeroActionChip({
    super.key,
    required this.movie,
    required this.collection,
    required this.label,
    required this.icon,
    required this.inactiveIcon,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final service = CollectionService();
    return StreamBuilder<bool>(
      stream: service.isInCollectionStream(collection, movie.id),
      initialData: false,
      builder: (context, snapshot) {
        final isActive = snapshot.data ?? false;
        return GestureDetector(
          onTap: () {
            final isMovies = context.read<ContentTypeCubit>().state == ContentType.movies;
            if (isMovies) {
              if (collection == 'favorites') {
                context.read<MovieBloc>().add(ToggleFavorite(movie));
              } else {
                context.read<MovieBloc>().add(ToggleWatchLater(movie));
              }
            } else {
              if (collection == 'favorites') {
                context.read<ShowBloc>().add(ToggleShowFavorite(movie));
              } else {
                context.read<ShowBloc>().add(ToggleShowWatchLater(movie));
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive
                  ? activeColor.withValues(alpha: 0.2)
                  : Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive
                    ? activeColor.withValues(alpha: 0.5)
                    : Colors.white.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(isActive ? icon : inactiveIcon,
                    color: isActive ? activeColor : Colors.white70, size: 16),
                const SizedBox(width: 6),
                Text(label,
                    style: TextStyle(
                      color: isActive ? activeColor : Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
