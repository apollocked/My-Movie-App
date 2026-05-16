import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/core/localization/app_strings.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/movie_horizontal_list.dart';

class WatchLaterRow extends StatelessWidget {
  const WatchLaterRow({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return const SizedBox.shrink();

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('watch_later')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const SizedBox.shrink();
        }

        final movies = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Movie(
            id: data['id'],
            title: data['title'] ?? '',
            overview: data['overview'] ?? '',
            posterPath: data['posterPath'] ?? '',
            backdropPath: data['backdropPath'] ?? '',
            releaseDate: data['releaseDate'] ?? '',
            voteAverage: (data['voteAverage'] as num?)?.toDouble() ?? 0.0,
          );
        }).toList();

        return Column(
          children: [
            MovieHorizontalList(
              title: AppStrings.getTitle('Your Watch Later',
                  context.read<SettingsCubit>().state.locale),
              movies: movies,
              cardHeight: 220,
              onMovieTap: (Movie movie) {
                context.push('/movie/${movie.id}', extra: movie);
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
