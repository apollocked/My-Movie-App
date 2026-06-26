import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_card.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_section_header.dart';

class FilterSortCard extends StatelessWidget {
  final String sortBy;
  final ValueChanged<String> onChanged;

  const FilterSortCard({
    super.key,
    required this.sortBy,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sortOptions = [
      ('popularity.desc', Icons.trending_up, t.swipe.sort_options.most_popular),
      ('vote_average.desc', Icons.star_rounded, t.swipe.sort_options.highest_rated),
      ('primary_release_date.desc', Icons.new_releases_rounded, t.swipe.sort_options.newest_first),
      ('primary_release_date.asc', Icons.history_rounded, t.swipe.sort_options.oldest_first),
      ('revenue.desc', Icons.attach_money_rounded, t.swipe.sort_options.highest_revenue),
    ];

    return FilterCard(
      children: [
        FilterSectionHeader(
          icon: Icons.sort_rounded,
          text: t.swipe.sort_by,
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SegmentedButton<String>(
            segments: sortOptions
                .map((o) => ButtonSegment(
                      value: o.$1,
                      label: Text(o.$3, style: const TextStyle(fontSize: 12)),
                      icon: Icon(o.$2, size: 16),
                    ))
                .toList(),
            selected: {sortBy},
            onSelectionChanged: (s) => onChanged(s.first),
            showSelectedIcon: false,
          ),
        ),
      ],
    );
  }
}
