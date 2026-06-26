import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/routing/movie_codec.dart';
import '../../features/auth/presentation/blocs/auth_bloc.dart';
import '../../features/auth/presentation/blocs/auth_state.dart';
import 'app_router_refresh_stream.dart';
import 'app_route_definitions.dart';
import 'not_found_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router(AuthBloc authBloc) {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      extraCodec: MovieCodec(),
      initialLocation: '/',
      debugLogDiagnostics: !kReleaseMode,
      errorBuilder: (context, state) => const NotFoundPage(),
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;

        final isOnAuthRoute = state.uri.path == '/onboarding' ||
            state.uri.path == '/login' ||
            state.uri.path == '/signup' ||
            state.uri.path == '/forgot-password';

        if (authState is AuthInitial) return null;

        if (authState is Unauthenticated && !isOnAuthRoute) {
          return '/onboarding';
        }

        if (authState is Authenticated && isOnAuthRoute) {
          return '/';
        }

        return null;
      },
      routes: getAppRoutes(_rootNavigatorKey),
    );
  }
}
