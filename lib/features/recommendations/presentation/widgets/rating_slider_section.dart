import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class RatingSliderSection extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const RatingSliderSection({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Text('${value.toStringAsFixed(0)}+', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.ratingGold)),
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 10,
            divisions: 10,
            activeColor: AppColors.ratingGold,
            inactiveColor: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            label: value.toStringAsFixed(0),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
