import 'package:flutter/material.dart';

class NavCenterButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final Color activeColor;
  final Color iconColor;
  final bool isDark;
  final VoidCallback onTap;

  const NavCenterButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.activeColor,
    required this.iconColor,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
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
              icon,
              color: iconColor,
              size: isSelected ? 26 : 22,
            ),
          ),
        ),
      ),
    );
  }
}
