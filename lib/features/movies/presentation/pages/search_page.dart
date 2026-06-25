import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/data/services/search_history_service.dart';

import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_event.dart';
import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_state.dart';
import 'package:my_movie/features/movies/presentation/pages/shimmer_pages/search_shimmer.dart';
import 'package:my_movie/features/movies/presentation/widgets/empty_state_widget.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_poster_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final SearchHistoryService _historyService = SearchHistoryService();
  String _selectedFilter = 'All';
  List<String> _searchHistory = [];
  bool _showHistory = true;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final history = await _historyService.getHistory();
    if (mounted) setState(() => _searchHistory = history);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() => _showHistory = query.trim().isEmpty);
    if (query.trim().length > 2) {
      context.read<SearchBloc>().add(ExecuteSearch(
          query: query,
          filter: _selectedFilter,
          language: getTmdbLanguageCode(
              context.read<SettingsCubit>().state.locale)));
    } else if (query.trim().isEmpty) {
      context.read<SearchBloc>().add(const ClearSearch());
    }
  }

  void _executeSearch(String query) {
    _searchController.text = query;
    _onSearchChanged(query);
    _historyService.addQuery(query);
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Text(t.search.explore,
                  style: theme.textTheme.displayMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: t.search.hint,
                      hintStyle: theme.inputDecorationTheme.hintStyle,
                      prefixIcon: Icon(Icons.search_rounded,
                          color: theme.primaryColor, size: 22),
                      filled: true,
                      fillColor: isDark
                          ? AppColors.darkSurface.withValues(alpha: 0.6)
                          : AppColors.lightSurface.withValues(alpha: 0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: isDark
                                ? AppColors.darkBorder.withValues(alpha: 0.3)
                                : AppColors.lightBorder.withValues(alpha: 0.5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: isDark
                                ? AppColors.darkBorder.withValues(alpha: 0.3)
                                : AppColors.lightBorder.withValues(alpha: 0.5)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: ['All', 'Movies', 'TV Shows', 'Actors']
                    .map((filter) {
                  final isSelected = _selectedFilter == filter;
                  String label = filter;
                  if (filter == 'All') { label = t.search.filters.all; }
                  if (filter == 'Movies') { label = t.search.filters.movies; }
                  if (filter == 'TV Shows') { label = t.search.filters.tv_shows; }
                  if (filter == 'Actors') { label = t.search.filters.actors; }

                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.only(end: 8.0),
                    child: FilterChip(
                      label: Text(label),
                      selected: isSelected,
                      selectedColor:
                          AppColors.primaryRed.withValues(alpha: 0.15),
                      checkmarkColor: theme.primaryColor,
                      backgroundColor: Colors.transparent,
                      side: BorderSide(
                        color: isSelected
                            ? AppColors.primaryRed.withValues(alpha: 0.5)
                            : (isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder),
                      ),
                      labelStyle: TextStyle(
                          color: isSelected
                              ? theme.primaryColor
                              : theme.hintColor,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w500),
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
                    return const SearchShimmer();
                  } else if (state is SearchLoaded) {
                    if (state.results.isEmpty) {
                      return EmptyStateWidget(
                        icon: Icons.search_off_rounded,
                        title: t.search.no_results,
                        subtitle: t.search.no_results_subtitle,
                      );
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(20),
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
                          onTap: () => context.push('/movie/${movie.id}',
                              extra: movie),
                          borderRadius: BorderRadius.circular(20),
                          child: MoviePosterCard(movie: movie),
                        );
                      },
                    );
                  } else if (state is SearchError) {
                    return EmptyStateWidget(
                      icon: Icons.error_outline_rounded,
                      title: t.common.error_title,
                      subtitle: state.message,
                      onAction: () {
                        if (_searchController.text.isNotEmpty) {
                          context.read<SearchBloc>().add(ExecuteSearch(
                              query: _searchController.text,
                              filter: _selectedFilter,
                              language: getTmdbLanguageCode(locale)));
                        }
                      },
                      actionLabel: t.common.retry,
                    );
                  }

                  if (_showHistory && _searchHistory.isNotEmpty) {
                    return _buildHistorySection(theme);
                  }

                  return EmptyStateWidget(
                    icon: Icons.movie_filter_rounded,
                    title: t.search.discover_title,
                    subtitle: t.search.discover_subtitle,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistorySection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('Recent Searches',
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
              TextButton(
                onPressed: () async {
                  await _historyService.clear();
                  setState(() => _searchHistory.clear());
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textTertiaryDark,
                ),
                child: const Text('Clear',
                    style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _searchHistory.length,
            itemBuilder: (context, index) {
              final query = _searchHistory[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.history_rounded,
                      color: AppColors.textTertiaryDark, size: 20),
                  title: Text(query,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyLarge?.color)),
                  trailing: IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    color: AppColors.textTertiaryDark,
                    onPressed: () async {
                      await _historyService.removeQuery(query);
                      _loadHistory();
                    },
                  ),
                  onTap: () => _executeSearch(query),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
