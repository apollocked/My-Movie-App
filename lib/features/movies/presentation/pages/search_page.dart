import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/core/utils/locale_utils.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/i18n/strings.g.dart';

import 'package:my_movies_app/features/movies/presentation/logic/search_bloc/search_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/search_bloc/search_event.dart';
import 'package:my_movies_app/features/movies/presentation/logic/search_bloc/search_state.dart';
import 'package:my_movies_app/features/movies/presentation/pages/shimmer_pages/movie_shimmer_list.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/movie_poster_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locale = context.watch<SettingsCubit>().state.locale;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Text(t.search.explore,
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                onChanged: (query) {
                  if (query.trim().length > 2) {
                    context.read<SearchBloc>().add(ExecuteSearch(
                        query: query,
                        filter: _selectedFilter,
                        language: getTmdbLanguageCode(locale)));
                  } else if (query.trim().isEmpty) {
                    context.read<SearchBloc>().add(const ClearSearch());
                  }
                },
                decoration: InputDecoration(
                  hintText: t.search.hint,
                  hintStyle: theme.inputDecorationTheme.hintStyle,
                  prefixIcon: Icon(Icons.search_rounded,
                      color: theme.inputDecorationTheme.prefixIconColor),
                  filled: true,
                  fillColor: isDark
                      ? theme.colorScheme.surfaceContainer
                      : theme.cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: ['All', 'Movies', 'TV Shows', 'Actors'].map((filter) {
                  final isSelected = _selectedFilter == filter;
                  String label = filter;
                  if (filter == 'All') label = t.search.filters.all;
                  if (filter == 'Movies') label = t.search.filters.movies;
                  if (filter == 'TV Shows') label = t.search.filters.tv_shows;
                  if (filter == 'Actors') label = t.search.filters.actors;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Text(label),
                      selected: isSelected,
                      selectedColor: theme.primaryColor.withValues(alpha: 0.2),
                      checkmarkColor: theme.primaryColor,
                      backgroundColor: theme.cardColor,
                      labelStyle: TextStyle(
                          color:
                              isSelected ? theme.primaryColor : theme.hintColor,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal),
                      onSelected: (bool selected) {
                        setState(() => _selectedFilter = filter);
                        if (_searchController.text.trim().isNotEmpty) {
                          context.read<SearchBloc>().add(ExecuteSearch(
                              query: _searchController.text,
                              filter: filter,
                              language: getTmdbLanguageCode(locale)));
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const MovieShimmerList(cardHeight: 220);
                  } else if (state is SearchLoaded) {
                    if (state.results.isEmpty) {
                      return Center(
                          child: Text(t.search.no_results,
                              style: theme.textTheme.bodyMedium));
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final movie = state.results[index];
                        return InkWell(
                          onTap: () =>
                              context.push('/movie/${movie.id}', extra: movie),
                          borderRadius: BorderRadius.circular(20),
                          child: MoviePosterCard(movie: movie),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(
                      child: Text(state.message,
                          style: TextStyle(color: theme.colorScheme.error)),
                    );
                  }

                  return Center(
                    child: Icon(Icons.movie_filter_rounded,
                        size: 80, color: theme.dividerColor),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
