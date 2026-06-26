// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class SearchFilterChips extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const SearchFilterChips(
      {super.key, required this.selectedFilter, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: ['All', 'Movies', 'TV Shows', 'Actors'].map((filter) {
          final isSelected = selectedFilter == filter;
          String label = filter;
          if (filter == 'All') {
            label = t.search.filters.all;
          } else if (filter == 'Movies')
            label = t.search.filters.movies;
          else if (filter == 'TV Shows')
            label = t.search.filters.tv_shows;
          else if (filter == 'Actors') label = t.search.filters.actors;
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: FilterChip(
              label: Text(label),
              selected: isSelected,
              selectedColor: AppColors.primaryRed.withValues(alpha: 0.15),
              checkmarkColor: theme.primaryColor,
              backgroundColor: Colors.transparent,
              side: BorderSide(
                  color: isSelected
                      ? AppColors.primaryRed.withValues(alpha: 0.5)
                      : (isDark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder)),
              labelStyle: TextStyle(
                  color: isSelected ? theme.primaryColor : theme.hintColor,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500),
              onSelected: (_) => onFilterChanged(filter),
            ),
          );
        }).toList(),
      ),
    );
  }
}
