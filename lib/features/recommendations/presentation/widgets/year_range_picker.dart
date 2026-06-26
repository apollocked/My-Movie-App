import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
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

  static List<(int, String)> _yearOptions = [];
  static int _cachedYear = 0;

  List<(int, String)> get _yearList {
    final y = DateTime.now().year;
    if (_cachedYear != y) {
      _cachedYear = y;
      _yearOptions = List.generate(y - 1899, (i) => (1900 + i, '${1900 + i}'));
    }
    return _yearOptions;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final yearOptions = _yearList;

    return Row(
      children: [
        Expanded(child: _buildYearColumn(t.swipe.year_from, isDark,
            FilterDropdown<int>(
              value: yearFrom,
              options: yearOptions,
              onChanged: (v) => onYearFromChanged(v ?? 2000),
            ))),
        const SizedBox(width: 16),
        Expanded(child: _buildYearColumn(t.swipe.year_to, isDark,
            FilterDropdown<int?>(
              value: yearTo,
              hint: t.swipe.year_any,
              options: [
                (null, t.swipe.year_any),
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
