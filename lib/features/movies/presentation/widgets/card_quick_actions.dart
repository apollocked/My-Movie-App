import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_event.dart';
import '../blocs/movie_bloc/movie_bloc.dart';
import '../blocs/movie_bloc/movie_event.dart';

class CardQuickActions extends StatelessWidget {
  final Movie movie;

  const CardQuickActions({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Column(
        children: [
          _ActionIcon(
            movie: movie,
            collection: 'favorites',
            icon: Icons.favorite,
            inactiveIcon: Icons.favorite_border,
            activeColor: AppColors.favoriteRed,
            onTap: () {
              _toggleFavorite(context, movie);
              _showFeedback(context, t.movie_detail.added_to_favorites);
            },
          ),
          const SizedBox(height: 8),
          _ActionIcon(
            movie: movie,
            collection: 'watch_later',
            icon: Icons.bookmark,
            inactiveIcon: Icons.bookmark_add_outlined,
            activeColor: AppColors.watchLaterGreen,
            onTap: () {
              _toggleWatchLater(context, movie);
              _showFeedback(context, t.movie_detail.added_to_watch_later);
            },
          ),
        ],
      ),
    );
  }

  void _toggleFavorite(BuildContext ctx, Movie movie) {
    final ct = ctx.read<ContentTypeCubit>().state;
    if (ct == ContentType.movies) {
      ctx.read<MovieBloc>().add(ToggleFavorite(movie));
    } else {
      ctx.read<ShowBloc>().add(ToggleShowFavorite(movie));
    }
  }

  void _toggleWatchLater(BuildContext ctx, Movie movie) {
    final ct = ctx.read<ContentTypeCubit>().state;
    if (ct == ContentType.movies) {
      ctx.read<MovieBloc>().add(ToggleWatchLater(movie));
    } else {
      ctx.read<ShowBloc>().add(ToggleShowWatchLater(movie));
    }
  }

  void _showFeedback(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      width: 200,
    ));
  }
}

class _ActionIcon extends StatefulWidget {
  final Movie movie;
  final String collection;
  final IconData icon, inactiveIcon;
  final Color activeColor;
  final VoidCallback onTap;

  const _ActionIcon({
    required this.movie,
    required this.collection,
    required this.icon,
    required this.inactiveIcon,
    required this.activeColor,
    required this.onTap,
  });

  @override
  State<_ActionIcon> createState() => _ActionIconState();
}

class _ActionIconState extends State<_ActionIcon> {
  late final Stream<bool> _stream;

  @override
  void initState() {
    super.initState();
    final service = getIt<CollectionService>();
    _stream = service.isInCollectionStream(widget.collection, widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return StreamBuilder<bool>(
      stream: _stream,
      initialData: false,
      builder: (context, snapshot) {
        final isActive = snapshot.data ?? false;
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkElevated.withValues(alpha: 0.85)
                    : AppColors.lightSurface.withValues(alpha: 0.85),
                shape: BoxShape.circle),
            child: Icon(isActive ? widget.icon : widget.inactiveIcon,
                color: isActive
                    ? widget.activeColor
                    : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                size: 16),
          ),
        );
      },
    );
  }
}
