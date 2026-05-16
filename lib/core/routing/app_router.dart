import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/movies/domain/entities/movie.dart';
import '../../features/movies/presentation/pages/main_navigation_shell.dart';
import '../../features/movies/presentation/pages/home_page.dart';
import '../../features/movies/presentation/pages/search_page.dart';
import '../../features/auth/presentation/pages/profile_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/sigin_up_page.dart';
import '../../features/auth/presentation/pages/onboarding/onboarding_page.dart';
import '../../features/movies/presentation/pages/settings_page.dart';
import '../../features/movies/presentation/pages/movie_detail_page.dart';
import '../../features/auth/presentation/blocs/auth_bloc.dart';
import '../../features/auth/presentation/blocs/auth_state.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // Get auth state from context
      final authState = context.read<AuthBloc>().state;

      // Check if user is on auth routes
      final isOnAuthRoute = state.uri.path == '/onboarding' ||
          state.uri.path == '/login' ||
          state.uri.path == '/signup';

      // If initial state, redirect to onboarding
      if (authState is AuthInitial && !isOnAuthRoute) {
        return '/onboarding';
      }

      // If on auth routes and authenticated, go to home
      if ((authState is Authenticated || authState is AuthGuest) &&
          isOnAuthRoute) {
        return '/';
      }

      return null; // No redirect
    },
    routes: [
      // ===== Authentication Routes =====
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),

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
                builder: (context, state) => const MovieHomePage(),
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
