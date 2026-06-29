import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_genre_section.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_rating_card.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_certification_card.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';

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
  String? _certification;
  var _isTv = false;

  void _startSwiping() {
    final contentType = _isTv ? ContentType.shows : ContentType.movies;
    final filter = RecommendationFilter(
      genreIds: _selectedGenreIds.toList(),
      minRating: _minRating,
      maxRating: _maxRating,
      yearFrom: _yearFrom.round(),
      yearTo: _yearTo.round(),
      certificationCountry: 'US',
      certificationMax: _certification,
      contentType: contentType,
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
    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 6,
              height: 24,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Text(t.swipe.title,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, bottom + 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _FilterTypePill(
                    label: t.search.filters.movies,
                    isSelected: !_isTv,
                    onTap: () => setState(() {
                      _isTv = false;
                      _selectedGenreIds.clear();
                      _certification = null;
                    }),
                  ),
                  const SizedBox(width: 15),
                  _FilterTypePill(
                    label: t.search.filters.tv_shows,
                    isSelected: _isTv,
                    onTap: () => setState(() {
                      _isTv = true;
                      _selectedGenreIds.clear();
                      _certification = null;
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FilterGenreSection(
              selectedGenreIds: _selectedGenreIds,
              onGenreToggled: (id) => setState(() =>
                  _selectedGenreIds.contains(id)
                      ? _selectedGenreIds.remove(id)
                      : _selectedGenreIds.add(id)),
              isTv: _isTv,
            ),
            const SizedBox(height: 15),
            FilterRatingCard(
              minRating: _minRating,
              maxRating: _maxRating,
              onChanged: (v) => setState(() {
                _minRating = v.start;
                _maxRating = v.end;
              }),
            ),
            const SizedBox(height: 15),
            FilterCertificationCard(
              selectedCert: _certification,
              onChanged: (v) => setState(() => _certification = v),
              isTv: _isTv,
            ),
            const SizedBox(height: 15),
            FilterYearCard(
              yearFrom: _yearFrom,
              yearTo: _yearTo,
              onChanged: (v) => setState(() {
                _yearFrom = v.start;
                _yearTo = v.end;
              }),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedButton(
                text: t.swipe.start_swiping,
                onPressed: _startSwiping,
                icon: Icons.swap_vert_rounded,
                height: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterTypePill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterTypePill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: isSelected
                ? Colors.white
                : theme.colorScheme.onSurface.withValues(alpha: 0.7),
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
