import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Placeholder widgets to satisfy compilation until we build them
class MainNavigationShell extends StatelessWidget {
  final Widget child;
  const MainNavigationShell({super.key, required this.child});
  @override
  Widget build(BuildContext context) => Scaffold(body: child);
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainNavigationShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Home Screen'))),
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => const Scaffold(
                body: Center(child: Text('Dedicated Search Screen'))),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const Scaffold(
                body: Center(child: Text('Profile (Liked, Ratings, Notes)'))),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const Scaffold(
                body: Center(child: Text('Settings (Language, Theme)'))),
          ),
        ],
      ),
      GoRoute(
        path: '/movie/:id',
        builder: (context, state) {
          final movieId = state.pathParameters['id'] ?? '';
          return Scaffold(
              body: Center(child: Text('Movie Details ID: $movieId')));
        },
      ),
    ],
  );
}
