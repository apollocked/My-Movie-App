import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Import our active search logic layers
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

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Text('EXPLORE',
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 28)),
            ),

            // Search Text Field Group
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                onChanged: (query) {
                  if (query.trim().length > 2) {
                    context.read<SearchBloc>().add(ExecuteSearch(query: query, filter: _selectedFilter));
                  } else if (query.trim().isEmpty) {
                    context.read<SearchBloc>().add(const ClearSearch());
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search movies, actors, directors...',
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

            // Quick Category Chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: ['All', 'Movies', 'TV Shows', 'Actors'].map((filter) {
                  final isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Text(filter),
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
                          // Trigger new search query using your filters if needed
                          context.read<SearchBloc>().add(
                              ExecuteSearch(query: _searchController.text, filter: filter));
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Dynamic Search Result Area
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const MovieShimmerList(cardHeight: 220);
                  } else if (state is SearchLoaded) {
                    if (state.results.isEmpty) {
                      return Center(
                          child: Text('No results found.',
                              style: theme.textTheme.bodyMedium));
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final movie = state.results[index];
                        return InkWell(
                          onTap: () => context.push('/movie/${movie.id}', extra: movie),
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

                  // Default/SearchInitial idle state visual indicator
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
