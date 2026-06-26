import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/presentation/widgets/nav/nav_center_button.dart';
import 'package:my_movie/features/movies/presentation/widgets/nav/nav_item_data.dart';
import 'package:my_movie/features/movies/presentation/widgets/nav/nav_standard_item.dart';
import 'package:showcaseview/showcaseview.dart';

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

  Color _inactiveColor(bool isDark) =>
      isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final items = _navItems();

    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SizedBox(
            height: 68,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
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
                Row(
                  children: _buildNavItems(context, theme, isDark, items),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<NavItemData> _navItems() {
    return [
      NavItemData(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: t.common.cinema,
      ),
      NavItemData(
        icon: Icons.search_outlined,
        activeIcon: Icons.search_rounded,
        label: t.search.explore,
      ),
      NavItemData(
        icon: Icons.lightbulb_outline_rounded,
        activeIcon: Icons.lightbulb_rounded,
        label: '',
      ),
      NavItemData(
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
        label: t.profile.title,
      ),
      NavItemData(
        icon: Icons.tune_rounded,
        activeIcon: Icons.tune_rounded,
        label: t.settings.title,
      ),
    ];
  }

  List<Widget> _buildNavItems(
    BuildContext context,
    ThemeData theme,
    bool isDark,
    List<NavItemData> items,
  ) {
    return List.generate(items.length, (index) {
      final isSelected = currentIndex == index;
      final item = items[index];
      final activeColor = theme.colorScheme.primary;
      void onTap() => onItemTapped(index);

      Widget navItem;
      if (index == 2) {
        navItem = NavCenterButton(
          isSelected: isSelected,
          icon: item.icon,
          activeColor: activeColor,
          iconColor: theme.colorScheme.onPrimary,
          isDark: isDark,
          onTap: onTap,
        );
      } else {
        navItem = NavStandardItem(
          isSelected: isSelected,
          icon: item.icon,
          activeIcon: item.activeIcon,
          label: item.label,
          activeColor: activeColor,
          inactiveColor: _inactiveColor(isDark),
          index: index,
          onTap: onTap,
        );
      }

      if (index == 0 && homeKey != null) {
        return Showcase(
          key: homeKey!,
          title: t.onboarding.tooltips.browse.title,
          description: t.onboarding.tooltips.browse.desc,
          child: navItem,
        );
      }
      if (index == 1 && searchKey != null) {
        return Showcase(
          key: searchKey!,
          title: t.onboarding.tooltips.search.title,
          description: t.onboarding.tooltips.search.desc,
          child: navItem,
        );
      }
      if (index == 2 && recommendKey != null) {
        return Showcase(
          key: recommendKey!,
          title: t.onboarding.tooltips.recommend.title,
          description: t.onboarding.tooltips.recommend.desc,
          child: navItem,
        );
      }
      if (index == 3 && profileKey != null) {
        return Showcase(
          key: profileKey!,
          title: t.onboarding.tooltips.profile.title,
          description: t.onboarding.tooltips.profile.desc,
          child: navItem,
        );
      }
      if (index == 4 && settingsKey != null) {
        return Showcase(
          key: settingsKey!,
          title: t.onboarding.tooltips.settings.title,
          description: t.onboarding.tooltips.settings.desc,
          child: navItem,
        );
      }
      return navItem;
    });
  }
}
