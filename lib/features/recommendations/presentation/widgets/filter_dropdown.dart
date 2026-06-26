import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class FilterDropdown<T> extends StatelessWidget {
  final T value;
  final List<(T, String)> options;
  final ValueChanged<T?> onChanged;
  final String? hint;

  const FilterDropdown({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          hint: hint != null ? Text(hint!, style: TextStyle(color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight)) : null,
          dropdownColor: isDark ? AppColors.darkElevated : Colors.white,
          items: options.map((o) => DropdownMenuItem(value: o.$1, child: Text(o.$2))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
