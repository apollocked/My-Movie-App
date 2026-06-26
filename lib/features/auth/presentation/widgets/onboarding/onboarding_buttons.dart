import 'package:flutter/material.dart';

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
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? Colors.white : Colors.black,
              foregroundColor: isDark ? Colors.black : Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            onPressed: onGetStarted,
            child: Text(
              getStartedText,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 44,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: isDark
                  ? Colors.white.withValues(alpha: 0.55)
                  : Colors.black.withValues(alpha: 0.55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            onPressed: onContinueAsGuest,
            child: Text(
              continueGuestText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
