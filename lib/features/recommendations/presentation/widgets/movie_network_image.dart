import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class MovieNetworkImage extends StatelessWidget {
  final String backdropUrl;
  final String posterUrl;
  final String title;

  const MovieNetworkImage({
    super.key,
    required this.backdropUrl,
    required this.posterUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fallback = Container(
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_outlined, size: 48,
                color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(title, textAlign: TextAlign.center,
                  style: TextStyle(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            ),
          ],
        ),
      ),
    );

    return CachedNetworkImage(
      imageUrl: backdropUrl,
      fit: BoxFit.cover,
      placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
      errorWidget: (_, __, ___) => CachedNetworkImage(
        imageUrl: posterUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
        errorWidget: (_, __, ___) => fallback,
      ),
    );
  }
}
