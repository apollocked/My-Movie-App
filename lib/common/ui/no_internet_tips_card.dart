import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class NoInternetTipsCard extends StatelessWidget {
  final bool isDarkMode;

  const NoInternetTipsCard({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final tips = [
      t.connectivity.tips.airplane_mode,
      t.connectivity.tips.check_data,
      t.connectivity.tips.move_closer,
      t.connectivity.tips.restart_device,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.getInfoBgColor(isDarkMode),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.getInfoBorderColor(isDarkMode),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.connectivity.troubleshooting_title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
          ),
          const SizedBox(height: 12),
          for (final tip in tips) ...[
            if (tip != tips.first) const SizedBox(height: 8),
            Text(
              tip,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDarkMode
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
