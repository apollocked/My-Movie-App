import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';
import 'nav_item_data.dart';
import 'showcase_nav_item.dart';

class GlassNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  final GlobalKey? homeKey;
  final GlobalKey? searchKey;
  final GlobalKey? recommendKey;
  final GlobalKey? profileKey;
  final GlobalKey? settingsKey;

  const GlassNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
    this.homeKey,
    this.searchKey,
    this.recommendKey,
    this.profileKey,
    this.settingsKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            AppSizing.wp(context, 5).clamp(20, 40),
            0,
            AppSizing.wp(context, 5).clamp(20, 40),
            AppSizing.hp(context, 2).clamp(16, 32)),
        child: SizedBox(
          height: 70, // Compact height matching the video
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              _buildGlassBackground(context, isDark),
              _buildNavItemsRow(context, theme, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassBackground(BuildContext context, bool isDark) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40), // Fully rounded pill shape
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 16, sigmaY: 16), // Pronounced glass blur
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: isDark
                    ? Colors.white
                        .withValues(alpha: 0.15) // Bright, crisp glass edge
                    : Colors.black.withValues(alpha: 0.1),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItemsRow(BuildContext context, ThemeData theme, bool isDark) {
    final inactiveColor =
        isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final activeColor = theme.colorScheme.primary;
    final keys = [homeKey, searchKey, recommendKey, profileKey, settingsKey];

    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(5, (index) {
            return ShowcaseNavItem(
              index: index,
              currentIndex: currentIndex,
              item: NavItemData.forIndex(index),
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              isDark: isDark,
              showcaseKey: keys[index],
              onTap: onItemTapped,
            );
          }),
        ),
      ),
    );
  }
}
