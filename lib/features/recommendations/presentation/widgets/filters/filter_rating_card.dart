import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_card.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_section_header.dart';

class FilterRatingCard extends StatelessWidget {
  final double minRating;
  final double maxRating;
  final ValueChanged<RangeValues> onChanged;

  const FilterRatingCard({
    super.key,
    required this.minRating,
    required this.maxRating,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return FilterCard(
      children: [
        FilterSectionHeader(
          icon: Icons.star_rounded,
          text: t.swipe.minimum_rating,
          trailing: '${minRating.toStringAsFixed(0)} - ${maxRating.toStringAsFixed(0)}',
        ),
        const SizedBox(height: 2),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
          ),
          child: RangeSlider(
            values: RangeValues(minRating, maxRating),
            min: 0,
            max: 10,
            divisions: 10,
            activeColor: AppColors.ratingGold,
            inactiveColor: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            labels: RangeLabels(
              minRating.toStringAsFixed(0),
              maxRating.toStringAsFixed(0),
            ),
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0',
                  style: TextStyle(
                      fontSize: 11,
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight)),
              Text('${minRating.toStringAsFixed(0)} - ${maxRating.toStringAsFixed(0)}',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary)),
              Text('10',
                  style: TextStyle(
                      fontSize: 11,
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
