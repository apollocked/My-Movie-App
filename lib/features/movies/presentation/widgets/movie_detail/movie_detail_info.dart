import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import '../../blocs/movie_bloc/movie_bloc.dart';
import '../../blocs/movie_bloc/movie_event.dart';

class MovieDetailInfo extends StatelessWidget {
  final Movie movie;
  final String? uid;
  final String? overview;

  const MovieDetailInfo({
    super.key,
    required this.movie,
    this.uid,
    this.overview,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.ratingGold.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star_rounded,
                                color: AppColors.ratingGold, size: 16),
                            const SizedBox(width: 4),
                            Text(
                                '${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: AppColors.ratingGold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.calendar_month_rounded,
                          size: 16,
                          color: isDark
                              ? AppColors.textTertiaryDark
                              : AppColors.textTertiaryLight),
                      const SizedBox(width: 4),
                      Text(movie.releaseDate.split('-').first,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: isDark
                                ? AppColors.textTertiaryDark
                                : AppColors.textTertiaryLight,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            _buildFavoriteButton(context, theme),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 12),
        Text(overview ?? movie.overview,
            style: theme.textTheme.bodyLarge
                ?.copyWith(height: 1.7, color: theme.hintColor)),
      ],
    );
  }

  Widget _buildFavoriteButton(BuildContext context, ThemeData theme) {
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
              context.read<MovieBloc>().add(ToggleFavorite(movie));
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
