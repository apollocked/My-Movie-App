import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_state.dart';
import 'package:my_movies_app/features/movies/presentation/pages/shimmer_pages/movie_shimmer_list.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/movie_horizontal_list.dart';

import '../widgets/category_selector.dart';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  int _activeCategoryIndex = 0;
  final List<String> _homeCategories = [
    'Trending',
    'Action',
    'Sci-Fi',
    'Drama',
    'Horror'
  ];

  @override
  void initState() {
    super.initState();
    // Load initial category on startup
    context.read<MovieBloc>().add(LoadMoviesByCategory(_homeCategories[0]));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: theme.primaryColor,
          onRefresh: () async {
            context.read<MovieBloc>().add(
                LoadMoviesByCategory(_homeCategories[_activeCategoryIndex]));
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('CINEVAULT',
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontSize: 24, letterSpacing: 1.2)),
                  ),
                  const SizedBox(height: 24),
                  CategorySelector(
                    categories: _homeCategories,
                    selectedIndex: _activeCategoryIndex,
                    onCategorySelected: (index) {
                      setState(() => _activeCategoryIndex = index);
                      // Trigger API to fetch new category movies
                      context
                          .read<MovieBloc>()
                          .add(LoadMoviesByCategory(_homeCategories[index]));
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieLoading) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('Loading...',
                                  style: theme.textTheme.titleLarge
                                      ?.copyWith(fontSize: 18)),
                            ),
                            const MovieShimmerList(cardHeight: 280),
                          ],
                        );
                      } else if (state is MovieLoaded) {
                        return MovieHorizontalList(
                          title:
                              '${_homeCategories[_activeCategoryIndex]} Showcase',
                          movies: state.movies,
                          cardHeight: 280,
                        );
                      } else if (state is MovieError) {
                        return Center(
                            child: Text(state.message,
                                style:
                                    TextStyle(color: theme.colorScheme.error)));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
