import 'package:flutter/material.dart';

class NavCenterButton extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final Color activeColor;
  final Color iconColor;
  final bool isDark;
  final VoidCallback onTap;
  final Widget? imageChild;

  const NavCenterButton({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.activeColor,
    required this.iconColor,
    required this.isDark,
    required this.onTap,
    this.imageChild,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isSelected ? 65.0 : 60.0;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                activeColor.withValues(alpha: isSelected ? 0.4 : 0.15),
                activeColor.withValues(alpha: 0.0),
              ],
              radius: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: activeColor.withValues(alpha: isSelected ? 0.6 : 0.3),
                blurRadius: isSelected ? 16 : 10,
                spreadRadius: isSelected ? 2 : 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: isSelected ? 4.0 : 0.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withValues(alpha: 0.2),
                border: Border.all(
                  color: activeColor.withValues(alpha: isSelected ? 0.6 : 0.3),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: imageChild ??
                    Icon(
                      icon,
                      color: iconColor,
                      size: isSelected ? 26 : 22,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
