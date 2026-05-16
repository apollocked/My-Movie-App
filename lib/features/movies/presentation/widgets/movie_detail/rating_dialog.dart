import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import '../../logic/movie_bloc/movie_bloc.dart';
import '../../logic/movie_bloc/movie_event.dart';

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
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: const Text('Rate this Movie', textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${_selectedRating.toInt()}/10',
              style: const TextStyle(
                  fontSize: 48,
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
          const Text('Slide to set your rating',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {
            context
                .read<MovieBloc>()
                .add(RateMovie(widget.movie, _selectedRating));
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Saved rating: ${_selectedRating.toInt()}/10'),
                behavior: SnackBarBehavior.floating));
          },
          child: const Text('Submit Rating'),
        ),
      ],
    );
  }
}
