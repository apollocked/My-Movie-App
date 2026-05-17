import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
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
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: AppColors.ratingYellow, size: 20),
                      const SizedBox(width: 4),
                      Text('${movie.voteAverage.toStringAsFixed(1)}/10',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(width: 16),
                      Icon(Icons.calendar_month,
                          size: 18,
                          color: theme.brightness == Brightness.dark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight),
                      const SizedBox(width: 4),
                      Text(movie.releaseDate.split('-').first,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.brightness == Brightness.dark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            if (uid != null)
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .collection('favorites')
                    .doc(movie.id.toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  final isFav = snapshot.hasData && snapshot.data!.exists;
                  return IconButton(
                    icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.favoriteRed, size: 32),
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
                  );
                },
              ),
          ],
        ),
        const SizedBox(height: 24),
        Text(t.movie_detail.overview,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(overview ?? movie.overview,
            style: theme.textTheme.bodyLarge
                ?.copyWith(height: 1.6, color: theme.hintColor)),
      ],
    );
  }
}
