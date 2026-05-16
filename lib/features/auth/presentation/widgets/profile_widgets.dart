import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isDestructive
        ? theme.colorScheme.error
        : theme.textTheme.bodyLarge?.color;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon,
            color:
                isDestructive ? theme.colorScheme.error : theme.primaryColor),
        title: Text(
          title,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        trailing: Icon(Icons.chevron_right_rounded, color: theme.hintColor),
      ),
    );
  }
}

class ProfileSectionHeader extends StatelessWidget {
  final String title;

  const ProfileSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title.toUpperCase(),
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.hintColor,
        letterSpacing: 1.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
