import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_event.dart';

class AuthNavigationLinks extends StatelessWidget {
  final String primaryText;
  final String linkText;
  final String linkRoute;
  final bool showBackButton;

  const AuthNavigationLinks({
    super.key,
    required this.primaryText,
    required this.linkText,
    required this.linkRoute,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(primaryText, style: theme.textTheme.bodyMedium),
            GestureDetector(
              onTap: () => context.go(linkRoute),
              child: Text(
                linkText,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        if (showBackButton) ...[
          const SizedBox(height: 24),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(54),
              side: BorderSide(
                color: theme.dividerColor,
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: Icon(Icons.arrow_back, color: theme.primaryColor),
            label: Text(
              'Back to Browse',
              style: TextStyle(color: theme.primaryColor),
            ),
            onPressed: () {
              context.read<AuthBloc>().add(const ContinueAsGuestRequested());
              context.go('/');
            },
          ),
        ],
      ],
    );
  }
}
