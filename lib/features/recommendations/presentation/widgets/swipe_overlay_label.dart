import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class SwipeOverlayLabel extends StatelessWidget {
  final bool showLike;
  final bool showNope;

  const SwipeOverlayLabel({super.key, required this.showLike, required this.showNope});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showLike)
          Positioned(
            top: 40, right: 30,
            child: Transform.rotate(
              angle: -0.3,
              child: _stamp('WATCH LATER', AppColors.successGreen),
            ),
          ),
        if (showNope)
          Positioned(
            top: 40, left: 30,
            child: Transform.rotate(
              angle: 0.3,
              child: _stamp('NOPE', AppColors.errorRed),
            ),
          ),
      ],
    );
  }

  Widget _stamp(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(12),
        color: Colors.black45,
      ),
      child: Text(text, style: TextStyle(
        color: color, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 2,
      )),
    );
  }
}
