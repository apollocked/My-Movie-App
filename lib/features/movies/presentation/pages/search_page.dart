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
          language:
              getTmdbLanguageCode(context.read<SettingsCubit>().state.locale)));
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
              child:
                  Text(t.search.explore, style: theme.textTheme.displayMedium),
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
                children: ['All', 'Movies', 'TV Shows', 'Actors'].map((filter) {
                  final isSelected = _selectedFilter == filter;
                  String label = filter;
                  if (filter == 'All') {
                    label = t.search.filters.all;
                  }
                  if (filter == 'Movies') {
                    label = t.search.filters.movies;
                  }
                  if (filter == 'TV Shows') {
                    label = t.search.filters.tv_shows;
                  }
                  if (filter == 'Actors') {
                    label = t.search.filters.actors;
                  }

                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
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
                          color:
                              isSelected ? theme.primaryColor : theme.hintColor,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w500),
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
                          onTap: () =>
                              context.push('/movie/${movie.id}', extra: movie),
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

                  if (_showHistory) {
                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (_searchHistory.isNotEmpty)
                          _buildHistorySection(theme),
                        _buildCategoryBrowser(theme, isDark),
                      ],
                    );
                  }

                  return _buildCategoryBrowser(theme, isDark);
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
                child: const Text('Clear', style: TextStyle(fontSize: 13)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: (_searchHistory.length * 56.0).clamp(0, 224),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _searchHistory.length,
            itemBuilder: (context, index) {
              final query = _searchHistory[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.history_rounded,
                    color: AppColors.textTertiaryDark, size: 20),
                title: Text(query,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.textTheme.bodyLarge?.color)),
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
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBrowser(ThemeData theme, bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        child: GestureDetector(
          onTap: () => _showCategorySheet(theme, isDark),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppColors.glowShadow(AppColors.primaryRed, radius: 16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.explore_rounded, color: Colors.white, size: 22),
                SizedBox(width: 10),
                Text('Browse Categories',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCategorySheet(ThemeData theme, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        final bottomTheme = Theme.of(ctx);
        final bottomIsDark = bottomTheme.brightness == Brightness.dark;
        return Container(
          height: MediaQuery.of(ctx).size.height * 0.85,
          decoration: BoxDecoration(
            color: bottomTheme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Browse All',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20)),
                      GestureDetector(
                        onTap: () => Navigator.pop(ctx),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: bottomIsDark
                                ? AppColors.darkBorder.withValues(alpha: 0.5)
                                : AppColors.lightBorder,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.close_rounded, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: bottomIsDark
                          ? AppColors.darkSurface.withValues(alpha: 0.6)
                          : AppColors.lightSurface.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: bottomIsDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14),
                      unselectedLabelStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                      dividerColor: Colors.transparent,
                      tabs: const [
                        Tab(text: 'Movies'),
                        Tab(text: 'TV Shows'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildCategoryGrid(_movieCategories, bottomIsDark),
                      _buildCategoryGrid(_tvCategories, bottomIsDark),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<_CategoryData> get _movieCategories => [
        _CategoryData(t.home.top_rated, '/movie/top_rated',
            Icons.trending_up_rounded, 'Movies'),
        _CategoryData(t.home.now_playing, '/movie/now_playing',
            Icons.play_circle_outline_rounded, 'Movies'),
        _CategoryData(t.home.popular, '/movie/popular',
            Icons.whatshot_rounded, 'Movies'),
        _CategoryData(t.home.upcoming, '/movie/upcoming',
            Icons.calendar_month_rounded, 'Movies'),
        _CategoryData(t.home.action, '/discover/movie?with_genres=28',
            Icons.flash_on_rounded, 'Movies'),
        _CategoryData(t.home.sci_fi, '/discover/movie?with_genres=878',
            Icons.rocket_launch_rounded, 'Movies'),
        _CategoryData(t.home.horror, '/discover/movie?with_genres=27',
            Icons.dangerous_rounded, 'Movies'),
        _CategoryData(t.home.drama, '/discover/movie?with_genres=18',
            Icons.theater_comedy_rounded, 'Movies'),
        _CategoryData(t.home.comedy, '/discover/movie?with_genres=35',
            Icons.sentiment_satisfied_rounded, 'Movies'),
        _CategoryData(t.home.romance, '/discover/movie?with_genres=10749',
            Icons.favorite_rounded, 'Movies'),
        _CategoryData(t.home.thriller, '/discover/movie?with_genres=53',
            Icons.visibility_rounded, 'Movies'),
        _CategoryData(t.home.animation, '/discover/movie?with_genres=16',
            Icons.animation_rounded, 'Movies'),
        _CategoryData(t.home.mystery, '/discover/movie?with_genres=9648',
            Icons.search_outlined, 'Movies'),
      ];

  List<_CategoryData> get _tvCategories => [
        _CategoryData('Popular', '/tv/popular', Icons.whatshot_rounded,
            'TV Shows'),
        _CategoryData('Top Rated', '/tv/top_rated',
            Icons.trending_up_rounded, 'TV Shows'),
        _CategoryData('Airing Today', '/tv/airing_today',
            Icons.today_rounded, 'TV Shows'),
        _CategoryData('On The Air', '/tv/on_the_air',
            Icons.live_tv_rounded, 'TV Shows'),
        _CategoryData('Action', '/discover/tv?with_genres=10759',
            Icons.flash_on_rounded, 'TV Shows'),
        _CategoryData('Comedy', '/discover/tv?with_genres=35',
            Icons.sentiment_satisfied_rounded, 'TV Shows'),
        _CategoryData('Drama', '/discover/tv?with_genres=18',
            Icons.theater_comedy_rounded, 'TV Shows'),
        _CategoryData('Sci-Fi & Fantasy', '/discover/tv?with_genres=10765',
            Icons.rocket_launch_rounded, 'TV Shows'),
      ];

  final _categoryColors = [
    const Color(0xFFE8445A),
    const Color(0xFFFF6B35),
    const Color(0xFF7B61FF),
    const Color(0xFF2196F3),
    const Color(0xFF4CAF50),
    const Color(0xFFFF9800),
    const Color(0xFF9C27B0),
    const Color(0xFF00BCD4),
    const Color(0xFFFF5722),
    const Color(0xFFE91E63),
    const Color(0xFF3F51B5),
    const Color(0xFF009688),
    const Color(0xFF673AB7),
  ];

  Widget _buildCategoryGrid(List<_CategoryData> items, bool isDark) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) {
        final cat = items[i];
        final color = _categoryColors[i % _categoryColors.length];
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            final encoded = Uri.encodeComponent(cat.endpoint);
            context.push('/see-all/$encoded', extra: cat.title);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurface.withValues(alpha: 0.6)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark
                    ? AppColors.darkBorder.withValues(alpha: 0.3)
                    : AppColors.lightBorder.withValues(alpha: 0.6),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: isDark ? 0.2 : 0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(cat.icon, color: color, size: 24),
                ),
                const SizedBox(height: 10),
                Text(cat.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13)),
                const SizedBox(height: 2),
                Text(cat.subtitle,
                    style: TextStyle(
                        fontSize: 11,
                        color: isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryData {
  final String title;
  final String endpoint;
  final IconData icon;
  final String subtitle;

  const _CategoryData(this.title, this.endpoint, this.icon, this.subtitle);
}
