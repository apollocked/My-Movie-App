import 'package:flutter/material.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class OnboardingButtons extends StatelessWidget {
  final VoidCallback? onGetStarted;
  final VoidCallback? onContinueAsGuest;
  final String getStartedText;
  final String continueGuestText;
  final bool isDark;

  const OnboardingButtons({
    super.key,
    this.onGetStarted,
    this.onContinueAsGuest,
    required this.getStartedText,
    required this.continueGuestText,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedButton(
          text: getStartedText,
          onPressed: onGetStarted,
          backgroundColor: AppColors.primaryRed,
          foregroundColor: Colors.white,
          height: 56,
          borderRadius: 28,
          fontSize: 17,
        ),
        const SizedBox(height: 12),
        AnimatedButton.text(
          text: continueGuestText,
          onPressed: onContinueAsGuest,
          foregroundColor: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
          height: 44,
          borderRadius: 22,
          fontSize: 15,
        ),
      ],
    );
  }
}
