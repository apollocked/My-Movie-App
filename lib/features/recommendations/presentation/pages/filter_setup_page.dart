import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';
import '../blocs/recommendation_bloc.dart';
import '../blocs/recommendation_event.dart';
import '../widgets/genre_chip.dart';
import '../widgets/year_range_picker.dart';
import '../widgets/rating_slider_section.dart';
import '../widgets/filter_dropdown.dart';
import 'swipe_recommendations_page.dart';

class FilterSetupPage extends StatefulWidget {
  const FilterSetupPage({super.key});

  @override
  State<FilterSetupPage> createState() => _FilterSetupPageState();
}

class _FilterSetupPageState extends State<FilterSetupPage> {
  final Set<int> _selectedGenreIds = {};
  double _minRating = 5.0;
  int _yearFrom = 2000;
  int? _yearTo;
  String _sortBy = 'popularity.desc';

  List<(String, String)> get _sortOptionsLocalized {
    final so = t.swipe.sort_options;
    final labels = {
      'popularity.desc': so.most_popular,
      'vote_average.desc': so.highest_rated,
      'primary_release_date.desc': so.newest_first,
      'primary_release_date.asc': so.oldest_first,
      'revenue.desc': so.highest_revenue,
    };
    return _sortKeys.map((k) => (k, labels[k]!)).toList();
  }

  static const _genres = [
    (28, 'Action', Icons.flash_on_rounded), (12, 'Adventure', Icons.explore_rounded),
    (16, 'Animation', Icons.animation_rounded), (35, 'Comedy', Icons.sentiment_satisfied_rounded),
    (80, 'Crime', Icons.local_police_rounded), (99, 'Documentary', Icons.description_rounded),
    (18, 'Drama', Icons.theater_comedy_rounded), (14, 'Fantasy', Icons.auto_fix_high_rounded),
    (36, 'History', Icons.history_rounded), (27, 'Horror', Icons.dangerous_rounded),
    (10402, 'Music', Icons.music_note_rounded), (9648, 'Mystery', Icons.search_rounded),
    (10749, 'Romance', Icons.favorite_rounded), (878, 'Sci-Fi', Icons.rocket_launch_rounded),
    (53, 'Thriller', Icons.visibility_rounded), (10752, 'War', Icons.shield_rounded),
    (37, 'Western', Icons.landscape_rounded),
  ];

  static const _sortKeys = [
    'popularity.desc', 'vote_average.desc',
    'primary_release_date.desc', 'primary_release_date.asc',
    'revenue.desc',
  ];

  void _startSwiping() {
    final filter = RecommendationFilter(
      genreIds: _selectedGenreIds.toList(), minRating: _minRating,
      yearFrom: _yearFrom, yearTo: _yearTo, sortBy: _sortBy,
    );
    final locale = context.read<SettingsCubit>().state.locale;
    final lang = locale.languageCode == 'en' ? 'en-US' : '${locale.languageCode}-${locale.languageCode.toUpperCase()}';

    context.read<RecommendationBloc>().add(LoadRecommendations(filter: filter, language: lang));
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

    return Scaffold(
      appBar: AppBar(title: Text(t.swipe.title), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(theme, t.swipe.select_genres),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: _genres.map((g) => GenreChip(
                label: g.$2, icon: g.$3,
                isSelected: _selectedGenreIds.contains(g.$1),
                onTap: () => setState(() => _selectedGenreIds.contains(g.$1) ? _selectedGenreIds.remove(g.$1) : _selectedGenreIds.add(g.$1)),
              )).toList(),
            ),
            const SizedBox(height: 28),
            _sectionTitle(theme, t.swipe.minimum_rating),
            const SizedBox(height: 8),
            RatingSliderSection(value: _minRating, onChanged: (v) => setState(() => _minRating = v)),
            const SizedBox(height: 20),
            _sectionTitle(theme, t.swipe.release_year),
            const SizedBox(height: 8),
            YearRangePicker(
              yearFrom: _yearFrom, yearTo: _yearTo,
              onYearFromChanged: (v) => setState(() => _yearFrom = v),
              onYearToChanged: (v) => setState(() => _yearTo = v),
            ),
            const SizedBox(height: 28),
            _sectionTitle(theme, t.swipe.sort_by),
            const SizedBox(height: 8),
            FilterDropdown<String>(
              value: _sortBy, options: _sortOptionsLocalized,
              onChanged: (v) => setState(() => _sortBy = v ?? 'popularity.desc'),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity, height: 56,
              child: ElevatedButton(
                onPressed: _startSwiping,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary, foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.swap_vert_rounded, size: 24),
                    const SizedBox(width: 8),
                    Text(t.swipe.start_swiping, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(ThemeData t, String text) {
    return Text(text, style: t.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700));
  }
}
