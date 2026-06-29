import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_card.dart';
import 'package:my_movie/features/recommendations/presentation/widgets/filters/filter_section_header.dart';

class FilterCertificationCard extends StatelessWidget {
  final String? selectedCert;
  final ValueChanged<String?> onChanged;
  final bool isTv;

  const FilterCertificationCard({
    super.key,
    required this.selectedCert,
    required this.onChanged,
    this.isTv = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final entries = isTv ? _tvCerts(context) : _movieCerts(context);

    final selected = entries.firstWhere(
      (e) => e.value == selectedCert,
      orElse: () => entries.first,
    );

    return FilterCard(
      children: [
        FilterSectionHeader(
          icon: Icons.people_rounded,
          text: t.swipe.age_rating,
          trailing: selectedCert != null ? selected.label : null,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: entries.map((entry) {
            final isSelected = selectedCert == entry.value;
            return GestureDetector(
              onTap: () => onChanged(isSelected ? null : entry.value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : isDark ? AppColors.darkSurface : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.dividerColor,
                  ),
                ),
                child: Text(
                  entry.label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isSelected
                        ? Colors.white
                        : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  static List<({String? value, String label})> _movieCerts(BuildContext context) => [
    (value: null, label: t.swipe.age_any),
    (value: 'G', label: t.swipe.age_g),
    (value: 'PG', label: t.swipe.age_pg),
    (value: 'PG-13', label: t.swipe.age_pg13),
    (value: 'R', label: t.swipe.age_r),
    (value: 'NC-17', label: t.swipe.age_nc17),
  ];

  static List<({String? value, String label})> _tvCerts(BuildContext context) => [
    (value: null, label: t.swipe.age_any),
    (value: 'TV-Y', label: 'TV-Y'),
    (value: 'TV-Y7', label: 'TV-Y7'),
    (value: 'TV-G', label: 'TV-G'),
    (value: 'TV-PG', label: 'TV-PG'),
    (value: 'TV-14', label: 'TV-14'),
    (value: 'TV-MA', label: 'TV-MA'),
  ];
}
