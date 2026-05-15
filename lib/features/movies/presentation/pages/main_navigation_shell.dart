import 'dart:ui';
import 'package:flutter/material.dart';

class MainNavigationShell extends StatelessWidget {
  final dynamic navigationShell; // Keeps GoRouter structure compatible

  const MainNavigationShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _buildNavItems(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    // Replaced with bulletproof standard material icons
    final icons = [
      Icons.movie_creation_rounded,
      Icons.search_rounded,
      Icons.person_pin_rounded,
      Icons.settings_suggest_rounded
    ];
    final labels = ['Cinema', 'Explore', 'Profile', 'Setup'];

    return List.generate(4, (index) {
      final isSelected = navigationShell.currentIndex == index;
      return GestureDetector(
        onTap: () => navigationShell.goBranch(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFD4AF37).withValues(alpha: 0.12)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icons[index],
                color: isSelected
                    ? const Color(0xFFD4AF37)
                    : Colors.white.withValues(alpha: 0.4),
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              labels[index],
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? const Color(0xFFD4AF37)
                    : Colors.white.withValues(alpha: 0.4),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      );
    });
  }
}
