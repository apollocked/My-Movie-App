import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class ActorInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const ActorInfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 16, color: AppColors.textTertiaryDark),
        const SizedBox(width: 6),
        Flexible(child: Text(text, style: theme.textTheme.bodySmall)),
      ],
    );
  }
}
