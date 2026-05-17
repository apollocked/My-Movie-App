import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class GuestProfileView extends StatelessWidget {
  const GuestProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
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
        _FeatureItem(
          icon: Icons.favorite_rounded,
          title: t.guest_features.favorites.title,
          description: t.guest_features.favorites.desc,
        ),
        const SizedBox(height: 20),
        _FeatureItem(
          icon: Icons.star_rounded,
          title: t.guest_features.rate.title,
          description: t.guest_features.rate.desc,
        ),
        const SizedBox(height: 20),
        _FeatureItem(
          icon: Icons.bookmark_rounded,
          title: t.guest_features.watch_later.title,
          description: t.guest_features.watch_later.desc,
        ),
        const SizedBox(height: 20),
        _FeatureItem(
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
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primaryColor,
                theme.primaryColor.withValues(alpha: 0.8),
                theme.colorScheme.secondary
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: theme.primaryColor.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            onPressed: () => context.go('/login'),
            child: Text(t.auth.login,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            side: BorderSide(
                color: theme.primaryColor.withValues(alpha: 0.5), width: 1.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            foregroundColor: theme.primaryColor,
          ),
          onPressed: () => context.go('/signup'),
          child: Text(t.auth.create_account,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: theme.primaryColor, size: 24),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style:
                    theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
