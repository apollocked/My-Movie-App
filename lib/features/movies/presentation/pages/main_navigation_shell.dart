import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/services/first_open_service.dart';
import 'package:my_movie/common/widgets/showcase_handler.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movie/features/movies/presentation/widgets/nav/glass_nav_bar.dart';

class MainNavigationShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavigationShell({super.key, required this.navigationShell});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  static final _homeKey = GlobalKey();
  static final _searchKey = GlobalKey();
  static final _recommendKey = GlobalKey();
  static final _profileKey = GlobalKey();
  static final _settingsKey = GlobalKey();
  final _showcaseKey = GlobalKey<ShowcaseHandlerState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryShowcaseAfterAuth();
    });
  }

  void _tryShowcaseAfterAuth() {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated || authState is AuthGuest) {
      _showcaseKey.currentState?.tryShowcase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (prev, cur) =>
          (prev is AuthInitial || prev is Unauthenticated) &&
          (cur is Authenticated || cur is AuthGuest),
      listener: (context, state) {
        _showcaseKey.currentState?.tryShowcase();
      },
      child: ShowcaseHandler(
        key: _showcaseKey,
        showcaseKeys: [
          _homeKey,
          _searchKey,
          _recommendKey,
          _profileKey,
          _settingsKey
        ],
        child: Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              widget.navigationShell,
              // Wrapped in Positioned to float and resize the whole nav bar
              Positioned(
                bottom: 24.0,
                left: 20.0,
                right: 20.0,
                child: GlassNavBar(
                  currentIndex: widget.navigationShell.currentIndex,
                  onItemTapped: (index) {
                    if (index == 2) {
                      FirstOpenService.showWhatToWatchDialog(context);
                    }
                    widget.navigationShell.goBranch(index);
                  },
                  homeKey: _homeKey,
                  searchKey: _searchKey,
                  recommendKey: _recommendKey,
                  profileKey: _profileKey,
                  settingsKey: _settingsKey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
