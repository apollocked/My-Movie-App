import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import '../../logic/movie_bloc/movie_bloc.dart';
import '../../logic/movie_bloc/movie_event.dart';

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
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text('${movie.voteAverage.toStringAsFixed(1)}/10',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 16),
                      const Icon(Icons.calendar_month, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(movie.releaseDate.split('-').first,
                          style: const TextStyle(color: Colors.grey)),
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
                        color: Colors.red, size: 32),
                    onPressed: () {
                      context.read<MovieBloc>().add(ToggleFavorite(movie));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(isFav
                            ? 'Removed from favorites'
                            : 'Added to favorites'),
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
        const Text('Overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(overview ?? movie.overview,
            style: theme.textTheme.bodyLarge
                ?.copyWith(height: 1.6, color: theme.hintColor)),
      ],
    );
  }
}
