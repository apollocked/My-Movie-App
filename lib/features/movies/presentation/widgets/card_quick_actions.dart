import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/core/theme/app_colors.dart';
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
              context.read<MovieBloc>().add(ToggleFavorite(movie));
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
              context.read<MovieBloc>().add(ToggleWatchLater(movie));
              _showFeedback(context, t.movie_detail.added_to_watch_later);
            },
          ),
        ],
      ),
    );
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

class _ActionIcon extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final service = CollectionService();
    return StreamBuilder<bool>(
      stream: service.isInCollectionStream(collection, movie.id),
      initialData: false,
      builder: (context, snapshot) {
        final isActive = snapshot.data ?? false;
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                color: Colors.black54, shape: BoxShape.circle),
            child: Icon(isActive ? icon : inactiveIcon,
                color: isActive ? activeColor : Colors.white70, size: 16),
          ),
        );
      },
    );
  }
}
