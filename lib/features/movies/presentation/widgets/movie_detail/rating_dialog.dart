import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_event.dart';
import '../../blocs/movie_bloc/movie_bloc.dart';
import '../../blocs/movie_bloc/movie_event.dart';

class RatingDialog extends StatefulWidget {
  final Movie movie;

  const RatingDialog({super.key, required this.movie});

  @override
  State<RatingDialog> createState() => _RatingDialogState();

  static void show(BuildContext context, Movie movie) {
    showDialog(
      context: context,
      builder: (context) => RatingDialog(movie: movie),
    );
  }
}

class _RatingDialogState extends State<RatingDialog> {
  double _selectedRating = 5.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title:
          Text(t.movie_detail.prompts.rate_title, textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${_selectedRating.toInt()}/10',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.amber)),
          const SizedBox(height: 16),
          Slider(
            value: _selectedRating,
            min: 1,
            max: 10,
            divisions: 9,
            activeColor: Colors.amber,
            onChanged: (val) => setState(() => _selectedRating = val),
          ),
          Text(t.movie_detail.prompts.slide_to_rate,
              style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.brightness == Brightness.dark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight)),
        ],
      ),
      actions: [
        AnimatedButton.text(
          text: t.common.cancel,
          onPressed: () => Navigator.pop(context),
          foregroundColor: Theme.of(context).hintColor,
        ),
        AnimatedButton(
          text: t.common.submit,
          onPressed: () {
            final ct = context.read<ContentTypeCubit>().state;
            if (ct == ContentType.movies) {
              context
                  .read<MovieBloc>()
                  .add(RateMovie(widget.movie, _selectedRating));
            } else {
              context
                  .read<ShowBloc>()
                  .add(RateShow(widget.movie, _selectedRating));
            }
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    '${t.movie_detail.saved_rating} ${_selectedRating.toInt()}/10'),
                behavior: SnackBarBehavior.floating));
          },
        ),
      ],
    );
  }
}
