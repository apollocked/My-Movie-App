import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/widgets/press_scale.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';
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

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final _historyService = getIt<SearchHistoryService>();
  final _searchHistory = <String>[];
  var _selectedFilter = 'All';
  String? _selectedLanguage;
  var _showHistory = true;
  Timer? _debounce;

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
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() => _showHistory = query.trim().isEmpty);
    _debounce?.cancel();
    if (query.trim().isNotEmpty) {
      _debounce = Timer(const Duration(milliseconds: 350), () {
        if (!mounted) return;
        context.read<SearchBloc>().add(ExecuteSearch(
            query: query,
            filter: _selectedFilter,
            language:
                getTmdbLanguageCode(context.read<SettingsCubit>().state.locale),
            originalLanguage: _selectedLanguage));
      });
    } else {
      context.read<SearchBloc>().add(const ClearSearch());
    }
  }

  void _executeSearch(String query) {
    _debounce?.cancel();
    _searchController.text = query;
    _onSearchChanged(query);
    _historyService.addQuery(query);
    _searchHistory.insert(0, query);
  }

  void _onFilterChanged(String filter) {
    setState(() => _selectedFilter = filter);
    _debounce?.cancel();
    if (_searchController.text.trim().isNotEmpty) {
      _debounce = Timer(const Duration(milliseconds: 350), () {
        if (!mounted) return;
        context.read<SearchBloc>().add(ExecuteSearch(
            query: _searchController.text,
            filter: filter,
            language:
                getTmdbLanguageCode(context.read<SettingsCubit>().state.locale),
            originalLanguage: _selectedLanguage));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 6, height: 24,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Text(t.search.explore, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: SearchField(
                  controller: _searchController, onChanged: _onSearchChanged),
            ),
            const SizedBox(height: 16),
            SearchFilterChips(
                selectedFilter: _selectedFilter,
                onFilterChanged: _onFilterChanged),
            const SizedBox(height: 12),
            _LanguageFilterChip(
              selected: _selectedLanguage,
              onChanged: (v) {
                setState(() => _selectedLanguage = v);
                if (_searchController.text.trim().isNotEmpty) {
                  context.read<SearchBloc>().add(ExecuteSearch(
                      query: _searchController.text,
                      filter: _selectedFilter,
                      language: getTmdbLanguageCode(
                          context.read<SettingsCubit>().state.locale),
                      originalLanguage: v));
                }
              },
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildMovieSearch(bottom)),
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: AppSizing.gridColumns(context, mobile: 2, tablet: 3, desktop: 4).toInt(),
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: state.results.length,
          itemBuilder: (context, index) {
            final movie = state.results[index];
            return PressScale(
              child: InkWell(
                  key: ValueKey('search_${movie.id}'),
                  onTap: () => context.push('/movie/${movie.id}', extra: movie),
                  borderRadius: BorderRadius.circular(20),
                  child: MoviePosterCard(movie: movie)));
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
                        context.read<SettingsCubit>().state.locale),
                    originalLanguage: _selectedLanguage));
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
}

class _LanguageFilterChip extends StatelessWidget {
  final String? selected;
  final ValueChanged<String?> onChanged;

  const _LanguageFilterChip({required this.selected, required this.onChanged});

  static const _items = [
    (null, 'All'),
    ('en', 'English'),
    ('ko', '한국어'),
    ('ja', '日本語'),
    ('fr', 'Français'),
    ('es', 'Español'),
    ('de', 'Deutsch'),
    ('hi', 'हिन्दी'),
    ('zh', '中文'),
    ('ar', 'العربية'),
    ('tr', 'Türkçe'),
    ('it', 'Italiano'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: _items.map((lang) {
          final isSelected = selected == lang.$1;
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 6),
            child: FilterChip(
              label: Text(lang.$2,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? theme.primaryColor
                        : theme.textTheme.bodySmall?.color,
                  )),
              selected: isSelected,
              selectedColor: AppColors.primaryRed.withValues(alpha: 0.15),
              checkmarkColor: theme.primaryColor,
              backgroundColor: Colors.transparent,
              side: BorderSide(
                  color: isSelected
                      ? AppColors.primaryRed.withValues(alpha: 0.5)
                      : (theme.brightness == Brightness.dark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder)),
              onSelected: (_) => onChanged(isSelected ? null : lang.$1),
            ),
          );
        }).toList(),
      ),
    );
  }
}
