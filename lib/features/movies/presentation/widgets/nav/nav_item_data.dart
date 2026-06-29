import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/translations.dart';

class NavItemData {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const NavItemData({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  static NavItemData forIndex(int index) {
    return switch (index) {
      0 => NavItemData(icon: Icons.home_outlined, activeIcon: Icons.home_rounded, label: t.common.cinema),
      1 => NavItemData(icon: Icons.search_outlined, activeIcon: Icons.search_rounded, label: t.search.explore),
      2 => NavItemData(icon: Icons.lightbulb_outline_rounded, activeIcon: Icons.lightbulb_rounded, label: ''),
      3 => NavItemData(icon: Icons.person_outline_rounded, activeIcon: Icons.person_rounded, label: t.profile.title),
      4 => NavItemData(icon: Icons.tune_rounded, activeIcon: Icons.tune_rounded, label: t.settings.title),
      _ => throw ArgumentError('Invalid nav index: $index'),
    };
  }
}
