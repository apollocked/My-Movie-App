import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_event.dart';
import '../../blocs/movie_bloc/movie_bloc.dart';
import '../../blocs/movie_bloc/movie_event.dart';
import 'rating_dialog.dart';
import 'auth_prompt_sheet.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_state.dart';

class MovieDetailBottomActions extends StatefulWidget {
  final Movie movie;
  final String? uid;

  const MovieDetailBottomActions({super.key, required this.movie, this.uid});

  @override
  State<MovieDetailBottomActions> createState() => _MovieDetailBottomActionsState();
}

class _MovieDetailBottomActionsState extends State<MovieDetailBottomActions> {
  late final Stream<bool> _watchLaterStream;
  late final Stream<Map<String, dynamic>?> _ratingStream;

  @override
  void initState() {
    super.initState();
    final service = getIt<CollectionService>();
    _watchLaterStream = service.isInCollectionStream('watch_later', widget.movie.id);
    _ratingStream = service.getRatingStream(widget.movie.id);
  }

  void _execAction(BuildContext context, String msg, VoidCallback action) {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      action();
    } else {
      AuthPromptSheet.show(context, msg);
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: StreamBuilder<bool>(
            stream: _watchLaterStream,
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
                    _toggleWatchLater(context, widget.movie);
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
            stream: _ratingStream,
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
                    RatingDialog.show(context, widget.movie);
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
