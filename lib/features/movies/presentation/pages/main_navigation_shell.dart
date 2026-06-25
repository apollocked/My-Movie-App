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
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: Container(
                height: 68,
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.6)
                      : Colors.white.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.black.withValues(alpha: 0.06),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: _buildNavItems(context, theme, isDark),
                ),
              ),
            ),
          ),
        ),
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

      return Expanded(
        child: GestureDetector(
          onTap: () => navigationShell.goBranch(index),
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            margin: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: index > 0 ? 2 : 8,
              right: index < items.length - 1 ? 2 : 8,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? activeColor.withValues(alpha: isDark ? 0.2 : 0.12)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    size: isSelected ? 24 : 21,
                  ),
                ),
                const SizedBox(height: 2),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: isSelected ? 10 : 9,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? activeColor : inactiveColor(isDark),
                    letterSpacing: 0.3,
                  ),
                  child: Text(item.label),
                ),
              ],
            ),
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
