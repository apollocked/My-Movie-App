import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  void _executeProtectedAction(
      BuildContext context, String actionMessage, VoidCallback onAuthorized) {
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthGuest || authState is Unauthenticated) {
      // Prompt user to sign up or log in
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (modalContext) => Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 24),
              const Icon(Icons.lock_outline_rounded,
                  size: 54, color: Colors.orangeAccent),
              const SizedBox(height: 16),
              Text('Account Required',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'You must create an account or sign in to $actionMessage.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Navigator.pop(modalContext); // Dismiss Bottom Sheet
                  context.go('/onboarding'); // Navigate to Registration Stack
                },
                child: const Text('Create Account / Login'),
              ),
            ],
          ),
        ),
      );
    } else {
      // Proceed safely for authenticated users
      onAuthorized();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                color: theme.cardColor,
                child: const Center(child: Icon(Icons.image, size: 100))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // PROTECTED ACTION: Add to Favorites Button
                  ElevatedButton.icon(
                    onPressed: () => _executeProtectedAction(
                        context, 'save movies to your favorites list', () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to Favorites!')));
                    }),
                    icon: const Icon(Icons.favorite_border),
                    label: const Text('Favorite'),
                  ),

                  // PROTECTED ACTION: Rate Movie Button
                  ElevatedButton.icon(
                    onPressed: () => _executeProtectedAction(
                        context, 'submit review ratings', () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Rating Submitted!')));
                    }),
                    icon: const Icon(Icons.star_border_outlined),
                    label: const Text('Rate Movie'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
