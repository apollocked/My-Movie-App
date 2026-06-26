import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/services/first_open_service.dart';
import 'package:my_movie/common/widgets/showcase_handler.dart';
import 'package:my_movie/features/movies/presentation/widgets/nav/glass_nav_bar.dart';

class MainNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationShell({super.key, required this.navigationShell});

  static final _homeKey = GlobalKey();
  static final _searchKey = GlobalKey();
  static final _recommendKey = GlobalKey();
  static final _profileKey = GlobalKey();
  static final _settingsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ShowcaseHandler(
      showcaseKeys: [_homeKey, _searchKey, _recommendKey, _profileKey, _settingsKey],
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            navigationShell,
            GlassNavBar(
              currentIndex: navigationShell.currentIndex,
              onItemTapped: (index) {
                if (index == 2) {
                  FirstOpenService.showWhatToWatchDialog(context);
                }
                navigationShell.goBranch(index);
              },
              homeKey: _homeKey,
              searchKey: _searchKey,
              recommendKey: _recommendKey,
              profileKey: _profileKey,
              settingsKey: _settingsKey,
            ),
          ],
        ),
      ),
    );
  }
}
