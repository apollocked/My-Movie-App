import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular Vault Graphic Accent Ring
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.primaryColor.withValues(alpha: 0.1),
                ),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 64,
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Personal Vault',
                style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 8),
              Text(
                'Track your watchlist and sync items securely.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
