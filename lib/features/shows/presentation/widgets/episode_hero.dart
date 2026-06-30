import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';

class EpisodeHero extends StatelessWidget {
  final String stillPath;

  const EpisodeHero({super.key, required this.stillPath});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SliverAppBar(
      expandedHeight: AppSizing.hp(context, 28).clamp(200, 350),
      pinned: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (stillPath.isNotEmpty)
              CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w780$stillPath',
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: isDark
                      ? AppColors.darkSurfaceVariant
                      : AppColors.lightSurfaceVariant,
                ),
                errorWidget: (_, __, ___) => Container(
                  color: isDark
                      ? AppColors.darkSurfaceVariant
                      : AppColors.lightSurfaceVariant,
                  child: Icon(Icons.tv_rounded,
                      size: 48, color: theme.hintColor),
                ),
              )
            else
              Container(
                color: isDark
                    ? AppColors.darkSurfaceVariant
                    : AppColors.lightSurfaceVariant,
                child: Icon(Icons.tv_rounded,
                    size: 64, color: theme.hintColor),
              ),
            IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      isDark
                          ? const Color(0xB007090F)
                          : Colors.white.withValues(alpha: 0.95),
                      isDark ? const Color(0xFF07090F) : Colors.white,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
