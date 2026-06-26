import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';
import '../blocs/recommendation_bloc.dart';
import '../blocs/recommendation_event.dart';
import '../widgets/genre_chip.dart';
import 'swipe_recommendations_page.dart';

class FilterSetupPage extends StatefulWidget {
  const FilterSetupPage({super.key});

  @override
  State<FilterSetupPage> createState() => _FilterSetupPageState();
}

class _FilterSetupPageState extends State<FilterSetupPage> {
  final Set<int> _selectedGenreIds = {};
  double _minRating = 5.0;
  double _yearFrom = 2000;
  double _yearTo = DateTime.now().year.toDouble();
  String _sortBy = 'popularity.desc';

  static const _genres = [
    (28, 'Action', Icons.flash_on_rounded),
    (12, 'Adventure', Icons.explore_rounded),
    (16, 'Animation', Icons.animation_rounded),
    (35, 'Comedy', Icons.sentiment_satisfied_rounded),
    (80, 'Crime', Icons.local_police_rounded),
    (99, 'Documentary', Icons.description_rounded),
    (18, 'Drama', Icons.theater_comedy_rounded),
    (14, 'Fantasy', Icons.auto_fix_high_rounded),
    (36, 'History', Icons.history_rounded),
    (27, 'Horror', Icons.dangerous_rounded),
    (10402, 'Music', Icons.music_note_rounded),
    (9648, 'Mystery', Icons.search_rounded),
    (10749, 'Romance', Icons.favorite_rounded),
    (878, 'Sci-Fi', Icons.rocket_launch_rounded),
    (53, 'Thriller', Icons.visibility_rounded),
    (10752, 'War', Icons.shield_rounded),
    (37, 'Western', Icons.landscape_rounded),
  ];

  static const _sortOptions = [
    ('popularity.desc', Icons.trending_up, 'Popular'),
    ('vote_average.desc', Icons.star_rounded, 'Top Rated'),
    ('primary_release_date.desc', Icons.new_releases_rounded, 'Newest'),
    ('primary_release_date.asc', Icons.history_rounded, 'Oldest'),
    ('revenue.desc', Icons.attach_money_rounded, 'Revenue'),
  ];

  void _startSwiping() {
    final filter = RecommendationFilter(
      genreIds: _selectedGenreIds.toList(),
      minRating: _minRating,
      yearFrom: _yearFrom.round(),
      yearTo: _yearTo.round(),
      sortBy: _sortBy,
    );
    final locale = context.read<SettingsCubit>().state.locale;
    final lang = locale.languageCode == 'en'
        ? 'en-US'
        : '${locale.languageCode}-${locale.languageCode.toUpperCase()}';

    context
        .read<RecommendationBloc>()
        .add(LoadRecommendations(filter: filter, language: lang));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: context.read<RecommendationBloc>(),
        child: SwipeRecommendationsPage(filter: filter, language: lang),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(t.swipe.title), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, bottom + 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _genreSection(theme),
            const SizedBox(height: 20),
            _ratingCard(theme, isDark),
            const SizedBox(height: 16),
            _yearCard(theme, isDark),
            const SizedBox(height: 16),
            _sortCard(theme),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton.icon(
                  onPressed: _startSwiping,
                  icon: const Icon(Icons.swap_vert_rounded, size: 20),
                  label: Text(t.swipe.start_swiping),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _genreSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
          child: Row(
            children: [
              Icon(Icons.category_rounded,
                  size: 16, color: theme.colorScheme.primary),
              const SizedBox(width: 6),
              Text(t.swipe.genres,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              const Spacer(),
              Text('${_selectedGenreIds.length} ${t.swipe.selected}',
                  style: TextStyle(
                      fontSize: 12, color: theme.colorScheme.primary)),
            ],
          ),
        ),
        SizedBox(
          height: 88,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: _genres
                  .map((g) => GenreChip(
                        label: g.$2,
                        icon: g.$3,
                        isSelected: _selectedGenreIds.contains(g.$1),
                        onTap: () => setState(() =>
                            _selectedGenreIds.contains(g.$1)
                                ? _selectedGenreIds.remove(g.$1)
                                : _selectedGenreIds.add(g.$1)),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _ratingCard(ThemeData theme, bool isDark) {
    return _card(theme, [
      _sectionHeader(theme, Icons.star_rounded, t.swipe.minimum_rating,
          '${_minRating.toStringAsFixed(0)}+'),
      const SizedBox(height: 4),
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          trackHeight: 4,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
        ),
        child: Slider(
          value: _minRating,
          min: 0,
          max: 10,
          divisions: 10,
          activeColor: AppColors.ratingGold,
          inactiveColor: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          label: _minRating.toStringAsFixed(0),
          onChanged: (v) => setState(() => _minRating = v),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('0',
              style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight)),
          Text('10',
              style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight)),
        ]),
      ),
    ]);
  }

  Widget _yearCard(ThemeData theme, bool isDark) {
    final currentYear = DateTime.now().year.toDouble();
    return _card(theme, [
      _sectionHeader(theme, Icons.calendar_month_rounded, t.swipe.release_year),
      const SizedBox(height: 4),
      RangeSlider(
        values: RangeValues(_yearFrom, _yearTo),
        min: 1900,
        max: currentYear,
        divisions: (currentYear - 1900).toInt(),
        activeColor: theme.colorScheme.primary,
        inactiveColor: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        labels: RangeLabels('${_yearFrom.round()}', '${_yearTo.round()}'),
        onChanged: (v) => setState(() {
          _yearFrom = v.start;
          _yearTo = v.end;
        }),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('1900',
              style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight)),
          Text('${_yearFrom.round()} - ${_yearTo.round()}',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary)),
          Text('${currentYear.round()}',
              style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight)),
        ]),
      ),
    ]);
  }

  Widget _sortCard(ThemeData theme) {
    return _card(theme, [
      _sectionHeader(theme, Icons.sort_rounded, t.swipe.sort_by),
      const SizedBox(height: 8),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SegmentedButton<String>(
          segments: _sortOptions
              .map((o) => ButtonSegment(
                    value: o.$1,
                    label: Text(o.$3, style: const TextStyle(fontSize: 12)),
                    icon: Icon(o.$2, size: 16),
                  ))
              .toList(),
          selected: {_sortBy},
          onSelectionChanged: (s) => setState(() => _sortBy = s.first),
          showSelectedIcon: false,
        ),
      ),
    ]);
  }

  Widget _card(ThemeData theme, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
                color: theme.colorScheme.outlineVariant, width: 0.5)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        ),
      ),
    );
  }

  Widget _sectionHeader(ThemeData theme, IconData icon, String text,
      [String? trailing]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 15, color: theme.colorScheme.primary),
          const SizedBox(width: 5),
          Text(text,
              style: theme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700)),
          if (trailing != null) ...[
            const Spacer(),
            Text(trailing,
                style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600)),
          ],
        ],
      ),
    );
  }
}
