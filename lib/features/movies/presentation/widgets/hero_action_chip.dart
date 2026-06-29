import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_event.dart';
import '../blocs/movie_bloc/movie_bloc.dart';
import '../blocs/movie_bloc/movie_event.dart';

class HeroActionChip extends StatefulWidget {
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
  State<HeroActionChip> createState() => _HeroActionChipState();
}

class _HeroActionChipState extends State<HeroActionChip> {
  late final Stream<bool> _collectionStream;

  @override
  void initState() {
    super.initState();
    final service = getIt<CollectionService>();
    _collectionStream = service.isInCollectionStream(widget.collection, widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _collectionStream,
      initialData: false,
      builder: (context, snapshot) {
        final isActive = snapshot.data ?? false;
        return GestureDetector(
          onTap: () {
            final isMovies = context.read<ContentTypeCubit>().state == ContentType.movies;
            if (isMovies) {
              if (widget.collection == 'favorites') {
                context.read<MovieBloc>().add(ToggleFavorite(widget.movie));
              } else {
                context.read<MovieBloc>().add(ToggleWatchLater(widget.movie));
              }
            } else {
              if (widget.collection == 'favorites') {
                context.read<ShowBloc>().add(ToggleShowFavorite(widget.movie));
              } else {
                context.read<ShowBloc>().add(ToggleShowWatchLater(widget.movie));
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive
                  ? widget.activeColor.withValues(alpha: 0.2)
                  : Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive
                    ? widget.activeColor.withValues(alpha: 0.5)
                    : Colors.white.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(isActive ? widget.icon : widget.inactiveIcon,
                    color: isActive ? widget.activeColor : Colors.white70, size: 16),
                const SizedBox(width: 6),
                Text(widget.label,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isActive ? widget.activeColor : Colors.white70,
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
