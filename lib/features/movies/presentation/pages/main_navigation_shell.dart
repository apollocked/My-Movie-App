import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationShell({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest
                  .withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => navigationShell.goBranch(index),
          indicatorColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.15),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.movie_filter_outlined),
              selectedIcon: Icon(Icons.movie_filter, color: Color(0xFFD4AF37)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded),
              selectedIcon:
                  Icon(Icons.search_rounded, color: Color(0xFFD4AF37)),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon:
                  Icon(Icons.person_rounded, color: Color(0xFFD4AF37)),
              label: 'Profile',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_suggest_outlined),
              selectedIcon:
                  Icon(Icons.settings_suggest, color: Color(0xFFD4AF37)),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
