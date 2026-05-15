import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_event.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_state.dart';
import '../widgets/movie_horizontal_list.dart';
import '../widgets/category_selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          _buildAmbientBackground(theme),
          SafeArea(
            bottom: false,
            child: RefreshIndicator(
              color: theme.primaryColor,
              onRefresh: () async =>
                  context.read<MovieBloc>().add(LoadTrendingMovies()),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 110),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(theme),
                    const CategorySelector(
                        categories: ['Trending', 'Sci-Fi', 'Action', 'Drama']),
                    const SizedBox(height: 24),
                    BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is MovieLoading) {
                          return SizedBox(
                              height: 260,
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: theme.primaryColor)));
                        } else if (state is MovieLoaded) {
                          return MovieHorizontalList(
                              title: 'Spotlight Screenings',
                              movies: state.movies);
                        } else if (state is MovieError) {
                          return SizedBox(
                              height: 200,
                              child: Center(child: Text(state.message)));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmbientBackground(ThemeData theme) {
    return Positioned(
      top: -100,
      right: -50,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
        child: Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor.withValues(
                  alpha: theme.brightness == Brightness.dark ? 0.06 : 0.12)),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('EXPLORE',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                  color: theme.hintColor)),
          const SizedBox(height: 4),
          Text('World of Cinema',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: theme.textTheme.displayLarge?.color)),
        ],
      ),
    );
  }
}
