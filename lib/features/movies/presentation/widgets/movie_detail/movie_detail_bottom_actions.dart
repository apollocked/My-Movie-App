import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
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
    if (authState is Authenticated) {
      action();
    } else {
      AuthPromptSheet.show(context, msg);
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
              return AnimatedButton(
                text: isAdded
                    ? t.movie_detail.saved
                    : t.movie_detail.watch_later,
                onPressed: () => _execAction(
                  context,
                  t.movie_detail.actions.add_watch_later,
                  () {
                    context.read<MovieBloc>().add(ToggleWatchLater(movie));
                  },
                ),
                icon: isAdded ? Icons.check_circle : Icons.add_circle_outline,
                backgroundColor:
                    isAdded ? AppColors.watchLaterGreen : theme.primaryColor,
                foregroundColor: Colors.white,
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
              return AnimatedButton(
                text: hasRated && rating != null
                    ? '${rating.toInt()}/10'
                    : t.movie_detail.rate_movie,
                onPressed: () => _execAction(
                  context,
                  t.movie_detail.actions.rate_movies,
                  () {
                    RatingDialog.show(context, movie);
                  },
                ),
                icon: hasRated ? Icons.star : Icons.star_border,
                foregroundColor: Colors.amber,
                borderColor: theme.dividerColor,
              );
            },
          ),
        ),
      ],
    );
  }
}
