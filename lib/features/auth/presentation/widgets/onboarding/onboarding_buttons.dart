import 'package:flutter/material.dart';
import 'package:my_movie/common/widgets/animated_button.dart';

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
          backgroundColor: isDark ? Colors.white : Colors.black,
          foregroundColor: isDark ? Colors.black : Colors.white,
          height: 56,
          borderRadius: 28,
          fontSize: 17,
        ),
        const SizedBox(height: 12),
        AnimatedButton.text(
          text: continueGuestText,
          onPressed: onContinueAsGuest,
          foregroundColor: isDark
              ? Colors.white.withValues(alpha: 0.55)
              : Colors.black.withValues(alpha: 0.55),
          height: 44,
          borderRadius: 22,
          fontSize: 15,
        ),
      ],
    );
  }
}
