import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_movies_app/i18n/strings.g.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import '../../logic/movie_bloc/movie_bloc.dart';
import '../../logic/movie_bloc/movie_event.dart';
import 'rating_dialog.dart';
import 'auth_prompt_sheet.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_state.dart';

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

    return Row(
      children: [
        Expanded(
          child: StreamBuilder<DocumentSnapshot>(
            stream: uid == null
                ? const Stream.empty()
                : FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .collection('watch_later')
                    .doc(movie.id.toString())
                    .snapshots(),
            builder: (context, snapshot) {
              final isAdded = snapshot.hasData && snapshot.data!.exists;
              return ElevatedButton.icon(
                onPressed: () => _execAction(
                  context,
                  t.movie_detail.actions.add_watch_later,
                  () {
                    context.read<MovieBloc>().add(ToggleWatchLater(movie));
                  },
                ),
                icon: Icon(isAdded ? Icons.check_circle : Icons.add_circle_outline),
                label: Text(isAdded
                    ? t.movie_detail.saved
                    : t.movie_detail.watch_later),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: isAdded ? Colors.green : theme.primaryColor,
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
          child: StreamBuilder<DocumentSnapshot>(
            stream: uid == null
                ? const Stream.empty()
                : FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .collection('ratings')
                    .doc(movie.id.toString())
                    .snapshots(),
            builder: (context, snapshot) {
              final hasRated = snapshot.hasData && snapshot.data!.exists;
              final rating = hasRated
                  ? (snapshot.data!.data() as Map<String, dynamic>)['rating']
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
                label: Text(hasRated
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
