import 'package:flutter/material.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class NoInternetRetrySection extends StatelessWidget {
  final bool isDarkMode;

  const NoInternetRetrySection({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedButton(
          text: t.connectivity.retry,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  t.connectivity.check_connection,
                  style: TextStyle(
                    color: isDarkMode
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                backgroundColor: isDarkMode
                    ? AppColors.darkSurfaceVariant
                    : AppColors.lightSurfaceVariant,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          icon: Icons.refresh_rounded,
          backgroundColor: AppColors.primaryRed,
          foregroundColor: AppColors.textPrimaryLight,
          borderRadius: 8,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primaryRed,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                t.connectivity.check_connection,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: isDarkMode
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
