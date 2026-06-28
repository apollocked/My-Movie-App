import 'package:flutter/material.dart';

class HeroInfoChip extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const HeroInfoChip({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(text,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
