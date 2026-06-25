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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                    color: isDark
                        ? Colors.black.withValues(alpha: 0.55)
                        : Colors.white.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                        color: isDark
                            ? AppColors.darkBorder.withValues(alpha: 0.5)
                            : AppColors.lightBorder.withValues(alpha: 0.8),
                        width: 1),
                    boxShadow: [
                      BoxShadow(
                          color: isDark
                              ? Colors.black.withValues(alpha: 0.3)
                              : Colors.black.withValues(alpha: 0.06),
                          blurRadius: 24,
                          offset: const Offset(0, 8)),
                      if (!isDark)
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2)),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    final icons = [
      Icons.movie_creation_rounded,
      Icons.search_rounded,
      Icons.person_pin_rounded,
      Icons.settings_suggest_rounded
    ];
    final activeIcons = [
      Icons.movie_rounded,
      Icons.search_rounded,
      Icons.person_pin_rounded,
      Icons.settings_rounded,
    ];
    final labels = [
      t.common.cinema,
      t.search.explore,
      t.profile.title,
      t.settings.title
    ];

    return List.generate(4, (index) {
      final isSelected = navigationShell.currentIndex == index;
      final activeColor = theme.primaryColor;
      final inactiveColor = isDark
          ? Colors.white.withValues(alpha: 0.3)
          : Colors.black.withValues(alpha: 0.35);

      return GestureDetector(
        onTap: () => navigationShell.goBranch(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? activeColor.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isSelected
                ? AppColors.glowShadow(activeColor, radius: 8)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isSelected ? activeIcons[index] : icons[index],
                  key: ValueKey('${isSelected}_$index'),
                  color: isSelected ? activeColor : inactiveColor,
                  size: 22,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? activeColor : inactiveColor,
                  letterSpacing: 0.3,
                ),
                child: Text(labels[index]),
              ),
            ],
          ),
        ),
      );
    });
  }
}
