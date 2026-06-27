import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_event.dart';
import '../../blocs/movie_bloc/movie_bloc.dart';
import '../../blocs/movie_bloc/movie_event.dart';

class FavoriteButton extends StatelessWidget {
  final Movie movie;

  const FavoriteButton({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final service = CollectionService();
    return StreamBuilder<bool>(
      stream: service.isInCollectionStream('favorites', movie.id),
      initialData: false,
      builder: (context, snapshot) {
        final isFav = snapshot.data ?? false;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.favoriteRed.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                color: AppColors.favoriteRed, size: 26),
            onPressed: () {
              final ct = context.read<ContentTypeCubit>().state;
              if (ct == ContentType.movies) {
                context.read<MovieBloc>().add(ToggleFavorite(movie));
              } else {
                context.read<ShowBloc>().add(ToggleShowFavorite(movie));
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(isFav
                    ? t.movie_detail.removed_from_favorites
                    : t.movie_detail.added_to_favorites),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
              ));
            },
          ),
        );
      },
    );
  }
}