import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'filter_dropdown.dart';

class YearRangePicker extends StatelessWidget {
  final int yearFrom;
  final int? yearTo;
  final ValueChanged<int> onYearFromChanged;
  final ValueChanged<int?> onYearToChanged;

  const YearRangePicker({
    super.key,
    required this.yearFrom,
    required this.yearTo,
    required this.onYearFromChanged,
    required this.onYearToChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final currentYear = DateTime.now().year;
    final yearOptions = List.generate(currentYear - 1899, (i) => (1900 + i, '${1900 + i}'));

    return Row(
      children: [
        Expanded(child: _buildYearColumn('From', isDark,
            FilterDropdown<int>(
              value: yearFrom,
              options: yearOptions,
              onChanged: (v) => onYearFromChanged(v ?? 2000),
            ))),
        const SizedBox(width: 16),
        Expanded(child: _buildYearColumn('To', isDark,
            FilterDropdown<int?>(
              value: yearTo,
              hint: 'Any',
              options: [
                (null, 'Any'),
                ...yearOptions,
              ],
              onChanged: (v) => onYearToChanged(v),
            ))),
      ],
    );
  }

  Widget _buildYearColumn(String label, bool isDark, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight)),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
