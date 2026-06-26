import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class MainNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // 1. Main app content layer
          navigationShell,

          // 2. The floating navigation bar sitting on top
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: SizedBox(
                  height: 68,
                  child: Stack(
                    clipBehavior: Clip
                        .none, // Allows the center button to pop out slightly if needed
                    children: [
                      // Glassmorphic Background
                      ClipRRect(
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
                                  color: Colors.black
                                      .withValues(alpha: isDark ? 0.3 : 0.08),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Navigation Items
                      Row(
                        children: _buildNavItems(context, theme, isDark),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(
      BuildContext context, ThemeData theme, bool isDark) {
    final items = [
      _NavItemData(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: t.common.cinema,
      ),
      _NavItemData(
        icon: Icons.search_outlined,
        activeIcon: Icons.search_rounded,
        label: t.search.explore,
      ),
      // Center Main Feature Button (Label omitted here as it becomes a standalone action FAB)
      _NavItemData(
        icon: Icons.swipe_rounded,
        activeIcon: Icons.swipe_rounded,
        label: '',
      ),
      _NavItemData(
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
        label: t.profile.title,
      ),
      _NavItemData(
        icon: Icons.tune_rounded,
        activeIcon: Icons.tune_rounded,
        label: t.settings.title,
      ),
    ];

    return List.generate(items.length, (index) {
      final isSelected = navigationShell.currentIndex == index;
      final item = items[index];
      final activeColor = theme.colorScheme.primary;

      // --- SPECIAL STYLE FOR THE CENTER MAIN FEATURE BUTTON ---
      if (index == 2) {
        return Expanded(
          child: GestureDetector(
            onTap: () => navigationShell.goBranch(index),
            behavior: HitTestBehavior.opaque,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutCubic,
                // Scales up slightly when selected for a premium feel
                height: isSelected ? 52 : 46,
                width: isSelected ? 52 : 46,
                decoration: BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: activeColor.withValues(alpha: isDark ? 0.4 : 0.3),
                      blurRadius: isSelected ? 14 : 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  item.icon,
                  color: theme.colorScheme.onPrimary,
                  size: isSelected ? 26 : 22,
                ),
              ),
            ),
          ),
        );
      }

      // --- STANDARD STYLE FOR THE OTHER 4 BUTTONS ---
      return Expanded(
        child: GestureDetector(
          onTap: () => navigationShell.goBranch(index),
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 36,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutCubic,
                      width: isSelected ? 48 : 0,
                      height: isSelected ? 36 : 0,
                      decoration: BoxDecoration(
                        color:
                            activeColor.withValues(alpha: isDark ? 0.2 : 0.12),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: Icon(
                        isSelected ? item.activeIcon : item.icon,
                        key: ValueKey('${isSelected}_$index'),
                        color: isSelected ? activeColor : inactiveColor(isDark),
                        size: isSelected ? 24 : 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? activeColor : inactiveColor(isDark),
                    letterSpacing: 0.1,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      item.label,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Color inactiveColor(bool isDark) =>
      isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
}

class _NavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const _NavItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
