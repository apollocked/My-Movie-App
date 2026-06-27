import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/auth/presentation/widgets/feature_item.dart';

class GuestProfileView extends StatelessWidget {
  const GuestProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottom = MediaQuery.of(context).padding.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: bottom + 120),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildHeader(theme),
            const SizedBox(height: 48),
            _buildFeaturesList(theme),
            const SizedBox(height: 48),
            _buildAuthButtons(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.primaryColor.withValues(alpha: 0.1),
          ),
          child: Icon(Icons.account_circle_outlined,
              size: 80, color: theme.primaryColor),
        ),
        const SizedBox(height: 24),
        Text(
          t.auth.join_community,
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          t.auth.join_subtitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium
              ?.copyWith(color: theme.hintColor, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildFeaturesList(ThemeData theme) {
    return Column(
      children: [
        FeatureItem(
          icon: Icons.favorite_rounded,
          title: t.guest_features.favorites.title,
          description: t.guest_features.favorites.desc,
        ),
        const SizedBox(height: 20),
        FeatureItem(
          icon: Icons.star_rounded,
          title: t.guest_features.rate.title,
          description: t.guest_features.rate.desc,
        ),
        const SizedBox(height: 20),
        FeatureItem(
          icon: Icons.bookmark_rounded,
          title: t.guest_features.watch_later.title,
          description: t.guest_features.watch_later.desc,
        ),
        const SizedBox(height: 20),
        FeatureItem(
          icon: Icons.cloud_sync_rounded,
          title: t.guest_features.sync.title,
          description: t.guest_features.sync.desc,
        ),
      ],
    );
  }

  Widget _buildAuthButtons(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        AnimatedButton(
          text: t.auth.login,
          onPressed: () => context.go('/login'),
          height: 56,
        ),
        const SizedBox(height: 16),
        AnimatedButton(
          text: t.auth.create_account,
          onPressed: () => context.go('/signup'),
          foregroundColor: theme.primaryColor,
          borderColor: theme.primaryColor.withValues(alpha: 0.5),
          height: 56,
        ),
      ],
    );
  }
}
