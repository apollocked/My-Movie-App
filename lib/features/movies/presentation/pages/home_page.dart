import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/core/utils/locale_utils.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movies_app/core/localization/app_strings.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_state.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_event.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_state.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/featured_movie_hero.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/category_row.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/watch_later_row.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  @override
  void initState() {
    super.initState();
    final locale = context.read<SettingsCubit>().state.locale;
    context.read<MovieBloc>().add(LoadMoviesByCategory('Trending', language: getTmdbLanguageCode(locale)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final movieBloc = context.read<MovieBloc>();
    final authState = context.watch<AuthBloc>().state;
    final locale = context.watch<SettingsCubit>().state.locale;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocListener<SettingsCubit, SettingsState>(
        listenWhen: (previous, current) => previous.locale != current.locale,
        listener: (context, state) => movieBloc.add(LoadMoviesByCategory('Trending', language: getTmdbLanguageCode(state.locale))),
        child: SafeArea(
          top: false,
          child: RefreshIndicator(
            color: theme.primaryColor,
            onRefresh: () async => movieBloc.add(LoadMoviesByCategory('Trending', language: getTmdbLanguageCode(locale))),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHero(),
                  const SizedBox(height: 24),
                  if (authState is Authenticated) const WatchLaterRow(),
                  _buildCategories(movieBloc.apiClient, locale),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) return const SizedBox(height: 480, child: Center(child: CircularProgressIndicator()));
        if (state is MovieLoaded && state.movies.isNotEmpty) {
          final m = state.movies.first;
          return FeaturedMovieHero(movie: m, onPlayPressed: () => context.push('/movie/${m.id}', extra: m), onInfoPressed: () => context.push('/movie/${m.id}', extra: m));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCategories(dynamic apiClient, Locale locale) {
    final titles = ['Trending Now', 'Top Rated Movies', 'Action Thrillers', 'Sci-Fi Explorations', 'Horror & Suspense'];
    final endpoints = ['/trending/movie/day', '/movie/top_rated', '/movie/now_playing', '/movie/popular', '/movie/upcoming'];
    return Column(
      children: List.generate(titles.length, (i) => CategoryRow(apiClient: apiClient, title: AppStrings.getTitle(titles[i], locale), endpoint: endpoints[i])),
    );
  }
}
