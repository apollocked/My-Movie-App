import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

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

            // Search Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                onChanged: (query) {
                  if (query.length > 2) {
                    // Fire search event when user types
                    context
                        .read<MovieSearchBloc>()
                        .add(SearchMoviesEvent(query, filter: _selectedFilter));
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

            // Quick Filters
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
                        if (_searchController.text.isNotEmpty) {
                          context.read<MovieSearchBloc>().add(SearchMoviesEvent(
                              _searchController.text,
                              filter: filter));
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Results Stream
            Expanded(
              child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
                builder: (context, state) {
                  if (state is MovieSearchLoading) {
                    return const MovieShimmerList(cardHeight: 220);
                  } else if (state is MovieSearchLoaded) {
                    if (state.results.isEmpty) {
                      return Center(
                          child: Text('No results found.',
                              style: theme.textTheme.bodyMedium));
                    }
                    return MovieHorizontalList(
                      title: 'Results',
                      movies: state.results,
                      cardHeight: 260,
                    );
                  }
                  // Default state
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
