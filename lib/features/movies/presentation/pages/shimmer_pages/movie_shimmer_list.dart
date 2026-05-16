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
        padding: const EdgeInsetsDirectional.only(start: 16.0),
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: cardHeight * 0.68,
            margin: const EdgeInsetsDirectional.only(end: 16, bottom: 8),
            child: Shimmer.fromColors(
              baseColor: baseColor,
              highlightColor: highlightColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Title Shimmer
                  Container(
                    width: double.infinity,
                    height: 14,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Rating Shimmer
                  Container(
                    width: 40,
                    height: 10,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
