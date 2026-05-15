import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/movies/domain/entities/movie.dart';
import '../../features/movies/presentation/pages/main_navigation_shell.dart';
import '../../features/movies/presentation/pages/home_page.dart';
import '../../features/movies/presentation/pages/search_page.dart';
import '../../features/movies/presentation/pages/profile_page.dart';
import '../../features/movies/presentation/pages/settings_page.dart';
import '../../features/movies/presentation/pages/movie_detail_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      // StatefulShellRoute maintains separate navigation states for each sub-tab
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigationShell(navigationShell: navigationShell);
        },
        branches: [
          // Branch 1: Home Dashboard Ecosystem
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // Branch 2: Search Core Engine Hub
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: 'search',
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          // Branch 3: User Notes & Profile Customizations
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
          // Branch 4: System Localization & Preferences Configuration
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),

      // Full-screen Sub-route stacked on top of the navigation shell
      GoRoute(
        path: '/movie/:id',
        name: 'movie_details',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          // Fallback parsing if arguments aren't explicitly passed directly via extra parameter maps
          final movie = state.extra as Movie;
          return MovieDetailPage(movie: movie);
        },
      ),
    ],
  );
}
