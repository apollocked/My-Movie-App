import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_state.dart';

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
    context.read<MovieBloc>().add(const LoadMoviesByCategory('Trending'));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final apiClient = context.read<MovieBloc>().apiClient;
    final authState = context.watch<AuthBloc>().state;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          color: theme.primaryColor,
          onRefresh: () async {
            context.read<MovieBloc>().add(const LoadMoviesByCategory('Trending'));
            setState(() {});
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is MovieLoading) {
                      return const SizedBox(
                          height: 480,
                          child: Center(child: CircularProgressIndicator()));
                    } else if (state is MovieLoaded) {
                      final featured =
                          state.movies.isNotEmpty ? state.movies.first : null;
                      return featured != null
                          ? FeaturedMovieHero(
                              movie: featured,
                              onPlayPressed: () => context.push(
                                  '/movie/${featured.id}',
                                  extra: featured),
                              onInfoPressed: () => context.push(
                                  '/movie/${featured.id}',
                                  extra: featured),
                            )
                          : const SizedBox.shrink();
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 24),
                if (authState is Authenticated) const WatchLaterRow(),
                CategoryRow(
                    apiClient: apiClient,
                    title: 'Trending Now',
                    endpoint: '/trending/movie/day'),
                CategoryRow(
                    apiClient: apiClient,
                    title: 'Top Rated Movies',
                    endpoint: '/movie/top_rated'),
                CategoryRow(
                    apiClient: apiClient,
                    title: 'Action Thrillers',
                    endpoint: '/movie/now_playing'),
                CategoryRow(
                    apiClient: apiClient,
                    title: 'Sci-Fi Explorations',
                    endpoint: '/movie/popular'),
                CategoryRow(
                    apiClient: apiClient,
                    title: 'Horror & Suspense',
                    endpoint: '/movie/upcoming'),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
