import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
import 'package:my_movie/features/movies/presentation/widgets/search/search_field.dart';
import 'package:my_movie/features/movies/presentation/widgets/search/search_filter_chips.dart';
import 'package:my_movie/features/movies/presentation/widgets/search/search_history_section.dart';
import 'package:my_movie/features/movies/presentation/widgets/search/category_browser_button.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/blocs/search_bloc/search_bloc.dart' as show_search;
import 'package:my_movie/features/shows/presentation/blocs/search_bloc/search_event.dart' as show_event;
import 'package:my_movie/features/shows/presentation/blocs/search_bloc/search_state.dart' as show_state;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final _historyService = SearchHistoryService();
  final _searchHistory = <String>[];
  var _selectedFilter = 'All';
  var _showHistory = true;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final h = await _historyService.getHistory();
    if (mounted) {
      setState(() => _searchHistory
        ..clear()
        ..addAll(h));
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() => _showHistory = query.trim().isEmpty);
    final isMovies = context.read<ContentTypeCubit>().state == ContentType.movies;
    if (query.trim().length > 2) {
      if (isMovies) {
        context.read<SearchBloc>().add(ExecuteSearch(
            query: query,
            filter: _selectedFilter,
            language: getTmdbLanguageCode(context.read<SettingsCubit>().state.locale)));
      } else {
        context.read<show_search.ShowSearchBloc>().add(show_event.ExecuteShowSearch(
            query: query,
            language: getTmdbLanguageCode(context.read<SettingsCubit>().state.locale)));
      }
    } else if (query.trim().isEmpty) {
      if (isMovies) {
        context.read<SearchBloc>().add(const ClearSearch());
      } else {
        context.read<show_search.ShowSearchBloc>().add(const show_event.ClearShowSearch());
      }
    }
  }

  void _executeSearch(String query) {
    _searchController.text = query;
    _onSearchChanged(query);
    _historyService.addQuery(query);
  }

  void _onFilterChanged(String filter) {
    setState(() => _selectedFilter = filter);
    if (_searchController.text.trim().isNotEmpty) {
      final isMovies = context.read<ContentTypeCubit>().state == ContentType.movies;
      if (isMovies) {
        context.read<SearchBloc>().add(ExecuteSearch(
            query: _searchController.text,
            filter: filter,
            language: getTmdbLanguageCode(context.read<SettingsCubit>().state.locale)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottom = MediaQuery.of(context).padding.bottom;
    final isMovies = context.watch<ContentTypeCubit>().state == ContentType.movies;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child:
                  Text(t.search.explore, style: theme.textTheme.displayMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchField(
                  controller: _searchController, onChanged: _onSearchChanged),
            ),
            const SizedBox(height: 16),
            if (isMovies)
              SearchFilterChips(
                  selectedFilter: _selectedFilter,
                  onFilterChanged: _onFilterChanged),
            const SizedBox(height: 16),
            Expanded(child: isMovies
                ? _buildMovieSearch(bottom)
                : _buildShowSearch(bottom)),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieSearch(double bottom) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchLoading) return const SearchShimmer();
      if (state is SearchLoaded) {
        if (state.results.isEmpty) {
          return EmptyStateWidget(
              icon: Icons.search_off_rounded,
              title: t.search.no_results,
              subtitle: t.search.no_results_subtitle);
        }
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(20, 20, 20, bottom + 120),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: state.results.length,
          itemBuilder: (context, index) {
            final movie = state.results[index];
            return InkWell(
                onTap: () =>
                    context.push('/movie/${movie.id}', extra: movie),
                borderRadius: BorderRadius.circular(20),
                child: MoviePosterCard(movie: movie));
          },
        );
      }
      if (state is SearchError) {
        return EmptyStateWidget(
            icon: Icons.error_outline_rounded,
            title: t.common.error_title,
            subtitle: state.message,
            onAction: () {
              if (_searchController.text.isNotEmpty) {
                context.read<SearchBloc>().add(ExecuteSearch(
                    query: _searchController.text,
                    filter: _selectedFilter,
                    language: getTmdbLanguageCode(
                        context.read<SettingsCubit>().state.locale)));
              }
            },
            actionLabel: t.common.retry);
      }
      if (_showHistory) {
        return ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, bottom + 120),
          children: [
            if (_searchHistory.isNotEmpty)
              SearchHistorySection(
                history: _searchHistory,
                onClear: () async {
                  await _historyService.clear();
                  _searchHistory.clear();
                  if (mounted) setState(() {});
                },
                onRemove: (q) async {
                  await _historyService.removeQuery(q);
                  _loadHistory();
                },
                onTap: _executeSearch,
              ),
            const CategoryBrowserButton(),
          ],
        );
      }
      return const CategoryBrowserButton();
    });
  }

  Widget _buildShowSearch(double bottom) {
    return BlocBuilder<show_search.ShowSearchBloc, show_state.ShowSearchState>(builder: (context, state) {
      if (state is show_state.ShowSearchLoading) return const SearchShimmer();
      if (state is show_state.ShowSearchLoaded) {
        if (state.results.isEmpty) {
          return EmptyStateWidget(
              icon: Icons.search_off_rounded,
              title: t.search.no_results,
              subtitle: t.search.no_results_subtitle);
        }
        return GridView.builder(
          padding: EdgeInsets.fromLTRB(20, 20, 20, bottom + 120),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: state.results.length,
          itemBuilder: (context, index) {
            final show = state.results[index];
            return InkWell(
                onTap: () =>
                    context.push('/show/${show.id}', extra: show),
                borderRadius: BorderRadius.circular(20),
                child: MoviePosterCard(movie: show));
          },
        );
      }
      if (state is show_state.ShowSearchError) {
        return EmptyStateWidget(
            icon: Icons.error_outline_rounded,
            title: t.common.error_title,
            subtitle: state.message,
            onAction: () {
              if (_searchController.text.isNotEmpty) {
                context.read<show_search.ShowSearchBloc>().add(show_event.ExecuteShowSearch(
                    query: _searchController.text,
                    language: getTmdbLanguageCode(
                        context.read<SettingsCubit>().state.locale)));
              }
            },
            actionLabel: t.common.retry);
      }
      if (_showHistory) {
        return ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, bottom + 120),
          children: [
            if (_searchHistory.isNotEmpty)
              SearchHistorySection(
                history: _searchHistory,
                onClear: () async {
                  await _historyService.clear();
                  _searchHistory.clear();
                  if (mounted) setState(() {});
                },
                onRemove: (q) async {
                  await _historyService.removeQuery(q);
                  _loadHistory();
                },
                onTap: _executeSearch,
              ),
          ],
        );
      }
      return const SizedBox.shrink();
    });
  }
}
