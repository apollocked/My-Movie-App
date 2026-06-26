import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class ProfileUserHeader extends StatelessWidget {
  final ThemeData theme;
  final String email;

  const ProfileUserHeader({super.key, required this.theme, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [theme.primaryColor, AppColors.ratingGold]),
              boxShadow: [
                BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10))
              ],
            ),
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(email,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        ],
      ),
    );
  }
}