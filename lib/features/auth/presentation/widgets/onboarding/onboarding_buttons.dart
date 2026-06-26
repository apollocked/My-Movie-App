import 'package:flutter/material.dart';

class OnboardingButtons extends StatelessWidget {
  final VoidCallback? onGetStarted;
  final VoidCallback? onContinueAsGuest;
  final String getStartedText;
  final String continueGuestText;

  const OnboardingButtons({
    super.key,
    this.onGetStarted,
    this.onContinueAsGuest,
    required this.getStartedText,
    required this.continueGuestText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(60),
            backgroundColor: theme.primaryColor,
            foregroundColor: theme.colorScheme.onPrimary,
            elevation: 8,
            shadowColor: theme.primaryColor.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          onPressed: onGetStarted,
          child: Text(
            getStartedText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.1),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(60),
            side: const BorderSide(color: Colors.white, width: 1.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          onPressed: onContinueAsGuest,
          child: Text(
            continueGuestText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
