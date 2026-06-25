import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../../blocs/movie_bloc/movie_bloc.dart';
import '../../blocs/movie_bloc/movie_event.dart';
import 'rating_dialog.dart';
import 'auth_prompt_sheet.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_state.dart';

class MovieDetailBottomActions extends StatelessWidget {
  final Movie movie;
  final String? uid;

  const MovieDetailBottomActions({super.key, required this.movie, this.uid});

  void _execAction(BuildContext context, String msg, VoidCallback action) {
    final authState = context.read<AuthBloc>().state;
    if (authState is! Authenticated) {
      AuthPromptSheet.show(context, msg);
    } else {
      action();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final service = CollectionService();

    return Row(
      children: [
        Expanded(
          child: StreamBuilder<bool>(
            stream: service.isInCollectionStream('watch_later', movie.id),
            initialData: false,
            builder: (context, snapshot) {
              final isAdded = snapshot.data ?? false;
              return ElevatedButton.icon(
                onPressed: () => _execAction(
                  context,
                  t.movie_detail.actions.add_watch_later,
                  () {
                    context.read<MovieBloc>().add(ToggleWatchLater(movie));
                  },
                ),
                icon: Icon(
                    isAdded ? Icons.check_circle : Icons.add_circle_outline),
                label: Text(isAdded
                    ? t.movie_detail.saved
                    : t.movie_detail.watch_later),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor:
                      isAdded ? AppColors.watchLaterGreen : theme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StreamBuilder<Map<String, dynamic>?>(
            stream: service.getRatingStream(movie.id),
            initialData: null,
            builder: (context, snapshot) {
              final data = snapshot.data;
              final hasRated = data != null;
              final rating = hasRated
                  ? (data['rating'] as num?)?.toDouble()
                  : null;
              return OutlinedButton.icon(
                onPressed: () => _execAction(
                  context,
                  t.movie_detail.actions.rate_movies,
                  () {
                    RatingDialog.show(context, movie);
                  },
                ),
                icon: Icon(hasRated ? Icons.star : Icons.star_border,
                    color: Colors.amber),
                label: Text(hasRated && rating != null
                    ? '${rating.toInt()}/10'
                    : t.movie_detail.rate_movie),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
              );
            },
          ),
        ),
      ],
    );
  }
}
