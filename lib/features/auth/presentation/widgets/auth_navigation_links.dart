import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';
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
          AnimatedButton(
            text: t.common.back_to_browse,
            onPressed: () {
              context.read<AuthBloc>().add(const ContinueAsGuestRequested());
              Future.microtask(() => context.go('/'));
            },
            foregroundColor: theme.primaryColor,
            borderColor: theme.dividerColor,
            icon: Icons.arrow_back,
          ),
        ],
      ],
    );
  }
}
