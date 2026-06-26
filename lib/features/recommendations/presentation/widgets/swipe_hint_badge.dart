import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class SwipeHintBadge extends StatelessWidget {
  final bool visible;

  const SwipeHintBadge({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();

    return Positioned(
      top: 12, left: 0, right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.swipe_rounded, size: 14, color: Colors.white.withValues(alpha: 0.7)),
              const SizedBox(width: 4),
              Text(t.swipe.hint, style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7), fontSize: 11, fontWeight: FontWeight.w500,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
