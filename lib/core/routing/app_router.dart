import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
import '../../features/movies/presentation/pages/collection_page.dart';
import '../../features/auth/presentation/blocs/auth_bloc.dart';
import '../../features/auth/presentation/blocs/auth_state.dart';
import 'not_found_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router(AuthBloc authBloc) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      debugLogDiagnostics: true,
      errorBuilder: (context, state) => const NotFoundPage(),
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;

        final isOnAuthRoute = state.uri.path == '/onboarding' ||
            state.uri.path == '/login' ||
            state.uri.path == '/signup';

        if (authState is AuthInitial) return null;

        if (authState is Unauthenticated && !isOnAuthRoute) {
          return '/onboarding';
        }

        if (authState is Authenticated && isOnAuthRoute) {
          return '/';
        }

        return null;
      },
      routes: [
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
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MainNavigationShell(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/',
                  name: 'home',
                  builder: (context, state) => const MovieHomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/search',
                  name: 'search',
                  builder: (context, state) => const SearchPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/profile',
                  name: 'profile',
                  builder: (context, state) => const ProfilePage(),
                ),
              ],
            ),
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
        GoRoute(
          path: '/movie/:id',
          name: 'movie_details',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            final movie = state.extra as Movie;
            return MovieDetailPage(movie: movie);
          },
        ),
        GoRoute(
          path: '/collection/:type',
          name: 'collection',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            final type = state.pathParameters['type']!;
            String title = 'Collection';
            if (type == 'watch_later') title = 'Watch Later';
            if (type == 'favorites') title = 'My Favorites';
            if (type == 'ratings') title = 'My Ratings';
            return CollectionPage(title: title, collectionPath: type);
          },
        ),
      ],
    );
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
