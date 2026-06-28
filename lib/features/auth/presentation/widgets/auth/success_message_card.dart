import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class SuccessMessageCard extends StatelessWidget {
  const SuccessMessageCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.successGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.successGreen.withValues(alpha: 0.3)),
      ),
      child: Row(children: [
        const Icon(Icons.check_circle_rounded, color: AppColors.successGreen),
        const SizedBox(width: 14),
        Expanded(
          child: Text(t.auth.reset_sent,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.successGreen, fontWeight: FontWeight.w600)),
        ),
      ]),
    );
  }
}
