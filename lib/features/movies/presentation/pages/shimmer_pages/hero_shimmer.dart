import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:my_movies_app/core/theme/app_colors.dart';

class HeroShimmer extends StatelessWidget {
  const HeroShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final baseColor = isDark
        ? theme.colorScheme.surfaceContainer
        : AppColors.lightSurfaceVariant;
    final highlightColor = isDark ? theme.cardColor : AppColors.lightSurface;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        height: 480,
        width: double.infinity,
        color: baseColor,
        child: Stack(
          children: [
            Positioned(
              bottom: 40,
              left: 24,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 32,
                    decoration: BoxDecoration(
                      color: highlightColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: highlightColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: highlightColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
