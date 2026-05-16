import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';
import '../logic/movie_bloc/movie_bloc.dart';
import '../logic/movie_bloc/movie_event.dart';

class HeroActionChip extends StatelessWidget {
  final Movie movie;
  final String uid;
  final String collection;
  final String label;
  final IconData icon, inactiveIcon;
  final Color activeColor;

  const HeroActionChip({
    super.key, required this.movie, required this.uid, required this.collection,
    required this.label, required this.icon, required this.inactiveIcon,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid)
          .collection(collection).doc(movie.id.toString()).snapshots(),
      builder: (context, snapshot) {
        final isActive = snapshot.hasData && snapshot.data!.exists;
        return ActionChip(
          onPressed: () {
            if (collection == 'favorites') {
              context.read<MovieBloc>().add(ToggleFavorite(movie));
            } else {
              context.read<MovieBloc>().add(ToggleWatchLater(movie));
            }
          },
          avatar: Icon(isActive ? icon : inactiveIcon, color: isActive ? activeColor : Colors.white70, size: 16),
          label: Text(label),
          backgroundColor: Colors.black.withValues(alpha: 0.3),
          labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
      },
    );
  }
}
