import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_card.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_section_header.dart';

class FilterYearCard extends StatelessWidget {
  final double yearFrom;
  final double yearTo;
  final ValueChanged<RangeValues> onChanged;

  const FilterYearCard({
    super.key,
    required this.yearFrom,
    required this.yearTo,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final currentYear = DateTime.now().year.toDouble();

    return FilterCard(
      children: [
        FilterSectionHeader(
          icon: Icons.calendar_month_rounded,
          text: t.swipe.release_year,
        ),
        const SizedBox(height: 2),
        RangeSlider(
          values: RangeValues(yearFrom, yearTo),
          min: 1900,
          max: currentYear,
          divisions: (currentYear - 1900).toInt(),
          activeColor: theme.colorScheme.primary,
          inactiveColor: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          labels: RangeLabels('${yearFrom.round()}', '${yearTo.round()}'),
          onChanged: onChanged,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1900',
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight)),
              Text('${yearFrom.round()} - ${yearTo.round()}',
                  style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary)),
              Text('${currentYear.round()}',
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight)),
            ],
          ),
        ),
      ],
    );
  }
}
