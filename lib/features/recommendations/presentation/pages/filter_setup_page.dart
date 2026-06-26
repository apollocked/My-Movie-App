import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_genre_section.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_rating_card.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_sort_card.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_year_card.dart';
import '../blocs/recommendation_bloc.dart';
import '../blocs/recommendation_event.dart';
import 'swipe_recommendations_page.dart';

class FilterSetupPage extends StatefulWidget {
  const FilterSetupPage({super.key});

  @override
  State<FilterSetupPage> createState() => _FilterSetupPageState();
}

class _FilterSetupPageState extends State<FilterSetupPage> {
  final Set<int> _selectedGenreIds = {};
  double _minRating = 3.0;
  double _maxRating = 10.0;
  double _yearFrom = 2000;
  double _yearTo = DateTime.now().year.toDouble();
  String _sortBy = 'popularity.desc';

  void _startSwiping() {
    final filter = RecommendationFilter(
      genreIds: _selectedGenreIds.toList(),
      minRating: _minRating,
      maxRating: _maxRating,
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
    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(t.swipe.title), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, bottom + 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterRatingCard(
              minRating: _minRating,
              maxRating: _maxRating,
              onChanged: (v) => setState(() {
                _minRating = v.start;
                _maxRating = v.end;
              }),
            ),
            const SizedBox(height: 12),
            FilterGenreSection(
              selectedGenreIds: _selectedGenreIds,
              onGenreToggled: (id) => setState(() =>
                  _selectedGenreIds.contains(id)
                      ? _selectedGenreIds.remove(id)
                      : _selectedGenreIds.add(id)),
            ),
            const SizedBox(height: 12),
            FilterYearCard(
              yearFrom: _yearFrom,
              yearTo: _yearTo,
              onChanged: (v) => setState(() {
                _yearFrom = v.start;
                _yearTo = v.end;
              }),
            ),
            const SizedBox(height: 12),
            FilterSortCard(
              sortBy: _sortBy,
              onChanged: (s) => setState(() => _sortBy = s),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
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
}
