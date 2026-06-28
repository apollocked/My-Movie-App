import 'package:flutter/material.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class WhatToWatchDialog extends StatelessWidget {
  const WhatToWatchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor:
          isDark ? const Color(0xFF1A1A2E) : const Color(0xFFF8F9FA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lightbulb_rounded,
                size: 48, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text(t.what_to_watch_dialog.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 24),
            _StepIndicator(
                number: '1',
                title: t.what_to_watch_dialog.step1_title,
                desc: t.what_to_watch_dialog.step1_desc),
            const SizedBox(height: 16),
            _StepIndicator(
                number: '2',
                title: t.what_to_watch_dialog.step2_title,
                desc: t.what_to_watch_dialog.step2_desc),
            const SizedBox(height: 16),
            _StepIndicator(
                number: '3',
                title: t.what_to_watch_dialog.step3_title,
                desc: t.what_to_watch_dialog.step3_desc),
            const SizedBox(height: 28),
            AnimatedButton(
              text: t.what_to_watch_dialog.got_it,
              onPressed: () => Navigator.of(context).pop(),
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final String number;
  final String title;
  final String desc;

  const _StepIndicator(
      {required this.number, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [theme.primaryColor, theme.colorScheme.secondary]),
          ),
          child: Center(
            child: Text(number,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800)),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(desc,
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
