import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/translations.dart';
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
import '../../features/movies/presentation/pages/actor_detail_page.dart';
import '../../features/movies/presentation/pages/director_detail_page.dart';
import '../../features/movies/presentation/pages/see_all_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../common/ui/no_internet_page.dart';
import '../../features/recommendations/presentation/pages/filter_setup_page.dart';
import '../../features/shows/presentation/pages/show_detail_page.dart';
import '../../features/shows/presentation/pages/episode_detail_page.dart';
import '../../features/shows/presentation/pages/see_all_page.dart' as show_see_all;

List<RouteBase> getAppRoutes(GlobalKey<NavigatorState> rootNavigatorKey) {
  return [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/no-internet',
      name: 'no-internet',
      builder: (context, state) => NoInternetPage(),
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
              builder: (context, state) => MovieHomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              name: 'search',
              builder: (context, state) => SearchPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/discover',
              name: 'discover',
              builder: (context, state) => FilterSetupPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => ProfilePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) => SettingsPage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/movie/:id',
      name: 'movie_details',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final idString = state.pathParameters['id'] ?? '';
        final movieId = int.tryParse(idString) ?? 0;
        final movie = state.extra is Movie ? state.extra as Movie : null;
        final autoPlay = state.uri.queryParameters['autoPlay'] == 'true';
        return MovieDetailPage(movieId: movieId, movie: movie, autoPlayTrailer: autoPlay);
      },
    ),
    GoRoute(
      path: '/see-all/:encodedEndpoint',
      name: 'see_all',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final endpoint = state.pathParameters['encodedEndpoint'] ?? '';
        final decoded = Uri.decodeComponent(endpoint);
        final validPrefixes = ['/trending', '/movie', '/tv', '/discover', '/search', '/person'];
        final isValid = validPrefixes.any((p) => decoded.startsWith(p));
        final safeEndpoint = isValid ? decoded : '/trending/movie/week';
        final title = state.extra is String ? state.extra as String : t.search.browse;
        return SeeAllPage(title: title, endpoint: safeEndpoint);
      },
    ),
    GoRoute(
      path: '/person/:id',
      name: 'actor_details',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final idString = state.pathParameters['id'] ?? '';
        final personId = int.tryParse(idString) ?? 0;
        final data = state.extra is Map ? state.extra as Map<String, dynamic> : null;
        return ActorDetailPage(personId: personId, data: data);
      },
    ),
    GoRoute(
      path: '/director/:id',
      name: 'director_details',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final idString = state.pathParameters['id'] ?? '';
        final personId = int.tryParse(idString) ?? 0;
        final data = state.extra is Map ? state.extra as Map<String, dynamic> : null;
        return DirectorDetailPage(personId: personId, data: data);
      },
    ),
    GoRoute(
      path: '/forgot-password',
      name: 'forgot_password',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/show/:id',
      name: 'show_details',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final idString = state.pathParameters['id'] ?? '';
        final showId = int.tryParse(idString) ?? 0;
        final show = state.extra is Movie ? state.extra as Movie : null;
        final autoPlay = state.uri.queryParameters['autoPlay'] == 'true';
        return ShowDetailPage(showId: showId, show: show, autoPlayTrailer: autoPlay);
      },
    ),
    GoRoute(
      path: '/show/:showId/season/:seasonNumber/episode/:episodeNumber',
      name: 'episode_details',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final showId = int.tryParse(state.pathParameters['showId'] ?? '') ?? 0;
        final seasonNumber = int.tryParse(state.pathParameters['seasonNumber'] ?? '') ?? 0;
        final episodeNumber = int.tryParse(state.pathParameters['episodeNumber'] ?? '') ?? 0;
        return EpisodeDetailPage(
          showId: showId,
          seasonNumber: seasonNumber,
          episodeNumber: episodeNumber,
          episodeData: state.extra is Map ? state.extra as Map<String, dynamic> : null,
        );
      },
    ),
    GoRoute(
      path: '/see-all-shows/:encodedEndpoint',
      name: 'see_all_shows',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final endpoint = state.pathParameters['encodedEndpoint'] ?? '';
        final decoded = Uri.decodeComponent(endpoint);
        final validPrefixes = ['/trending', '/tv', '/discover', '/search'];
        final isValid = validPrefixes.any((p) => decoded.startsWith(p));
        final safeEndpoint = isValid ? decoded : '/trending/tv/week';
        final title = state.extra is String ? state.extra as String : t.search.browse;
        return show_see_all.ShowSeeAllPage(title: title, endpoint: safeEndpoint);
      },
    ),
  
  ];
}
