import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieShimmerList extends StatelessWidget {
  final double cardHeight;
  const MovieShimmerList({super.key, this.cardHeight = 260});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final baseColor =
        isDark ? theme.colorScheme.surfaceContainer : Colors.grey[300]!;
    final highlightColor = isDark ? theme.cardColor : Colors.grey[100]!;

    return SizedBox(
      height: cardHeight,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16.0),
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Container(
              width: cardHeight * 0.68,
              margin: const EdgeInsets.only(right: 16, bottom: 8),
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
