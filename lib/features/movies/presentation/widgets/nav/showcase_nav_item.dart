import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:showcaseview/showcaseview.dart';
import 'nav_center_button.dart';
import 'nav_item_data.dart';
import 'nav_standard_item.dart';

class ShowcaseNavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final NavItemData item;
  final Color activeColor;
  final Color inactiveColor;
  final bool isDark;
  final GlobalKey? showcaseKey;
  final ValueChanged<int> onTap;

  const ShowcaseNavItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.item,
    required this.activeColor,
    required this.inactiveColor,
    required this.isDark,
    this.showcaseKey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    final isCenter = index == 2;

    final navItem = isCenter
        ? NavCenterButton(
            isSelected: isSelected,
            icon: Icons.lightbulb_outline_rounded,
            activeColor: activeColor,
            iconColor: Theme.of(context).colorScheme.onPrimary,
            isDark: isDark,
            onTap: () => onTap(index),
            imageChild: ClipOval(
              child: Image.asset('assets/icon.png', fit: BoxFit.cover),
            ),
          )
        : NavStandardItem(
            isSelected: isSelected,
            icon: item.icon,
            activeIcon: item.activeIcon,
            label: item.label,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            index: index,
            onTap: () => onTap(index),
          );

    if (showcaseKey != null) {
      final (title, desc) = _showcaseContent();
      return Showcase(
        key: showcaseKey!,
        title: title,
        description: desc,
        child: navItem,
      );
    }

    return navItem;
  }

  (String, String) _showcaseContent() {
    return switch (index) {
      0 => (t.onboarding.tooltips.browse.title, t.onboarding.tooltips.browse.desc),
      1 => (t.onboarding.tooltips.search.title, t.onboarding.tooltips.search.desc),
      2 => (t.onboarding.tooltips.recommend.title, t.onboarding.tooltips.recommend.desc),
      3 => (t.onboarding.tooltips.profile.title, t.onboarding.tooltips.profile.desc),
      4 => (t.onboarding.tooltips.settings.title, t.onboarding.tooltips.settings.desc),
      _ => ('', ''),
    };
  }
}
