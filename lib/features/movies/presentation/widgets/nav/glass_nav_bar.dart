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
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(AppSizing.wp(context, 4).clamp(12, 32), 0, AppSizing.wp(context, 4).clamp(12, 32), AppSizing.hp(context, 2).clamp(8, 24)),
          child: SizedBox(
            height: 76,
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
      ),
    );
  }

  Widget _buildGlassBackground(BuildContext context, bool isDark) {
    return Positioned(
      left: 0, right: 0, bottom: 0, height: 68,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.06),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
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
    final inactiveColor = isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
    final activeColor = theme.colorScheme.primary;
    final keys = [homeKey, searchKey, recommendKey, profileKey, settingsKey];

    return Positioned(
      left: 0, right: 0, bottom: 0, height: 68,
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
    );
  }
}
