import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_event.dart';
import 'package:my_movie/features/movies/presentation/widgets/watch_later_row.dart';
import 'package:my_movie/features/movies/presentation/widgets/home/home_hero_section.dart';
import 'package:my_movie/features/movies/presentation/widgets/home/home_categories_section.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_event.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'package:my_movie/features/shows/presentation/widgets/home_hero_section.dart' as show_widgets;
import 'package:my_movie/features/shows/presentation/widgets/home_categories_section.dart' as show_widgets;

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({super.key});

  @override
  State<MovieHomePage> createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  final remoteConfig = FirebaseRemoteConfig.instance;
  bool isloading = false;

  StreamSubscription<RemoteConfigUpdate>? _configSubscription;

  @override
  void initState() {
    super.initState();
    final locale = context.read<SettingsCubit>().state.locale;
    context.read<MovieBloc>().add(LoadMoviesByCategory('Trending',
        language: getTmdbLanguageCode(locale)));
    context.read<ShowBloc>().add(LoadShowsByCategory('Trending',
        language: getTmdbLanguageCode(locale)));

    initRemoteConfig();
  }

  Future<void> initRemoteConfig() async {
    if (!mounted) return;
    setState(() => isloading = true);
    try {
      await remoteConfig.setDefaults({'name': 'My Movie'});
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10),
      ));
      await remoteConfig.fetchAndActivate();
      _configSubscription = remoteConfig.onConfigUpdated.listen((event) async {
        await remoteConfig.activate();
        if (mounted) setState(() {});
      });
    } catch (_) {
    } finally {
      if (mounted) setState(() => isloading = false);
    }
  }

  @override
  void dispose() {
    _configSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final movieBloc = context.read<MovieBloc>();
    final showBloc = context.read<ShowBloc>();
    final locale = context.watch<SettingsCubit>().state.locale;
    final contentType = context.watch<ContentTypeCubit>().state;
    final isMovies = contentType == ContentType.movies;
    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 28,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE8445A), Color(0xFFFF6B35)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                Text(remoteConfig.getString('name'),
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocListener<SettingsCubit, SettingsState>(
        listenWhen: (previous, current) => previous.locale != current.locale,
        listener: (context, state) {
          final lang = getTmdbLanguageCode(state.locale);
          movieBloc.add(LoadMoviesByCategory('Trending', language: lang));
          context.read<ShowBloc>().add(LoadShowsByCategory('Trending', language: lang));
        },
        child: Column(
          children: [
            _ContentTypePill(),
            Expanded(
              child: isloading
                  ? const Center(child: CircularProgressIndicator())
                  : SafeArea(
                      top: false,
                      child: RefreshIndicator(
                        color: theme.primaryColor,
                        onRefresh: () async {
                          final lang = getTmdbLanguageCode(locale);
                          movieBloc.add(LoadMoviesByCategory('Trending', language: lang));
                          showBloc.add(LoadShowsByCategory('Trending', language: lang));
                        },
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: isMovies
                              ? _buildMovieContent(theme, movieBloc, bottom)
                              : _buildShowContent(theme, showBloc, bottom),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieContent(ThemeData theme, MovieBloc movieBloc, double bottom) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeHeroSection(),
        const SizedBox(height: 16),
        const WatchLaterRow(),
        HomeCategoriesSection(apiClient: movieBloc.apiClient),
        SizedBox(height: bottom + 120),
      ],
    );
  }

  Widget _buildShowContent(ThemeData theme, ShowBloc showBloc, double bottom) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const show_widgets.ShowHomeHeroSection(),
        const SizedBox(height: 16),
        const WatchLaterRow(),
        show_widgets.ShowHomeCategoriesSection(apiClient: getIt<ApiClient>()),
        SizedBox(height: bottom + 120),
      ],
    );
  }
}

class _ContentTypePill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final current = context.watch<ContentTypeCubit>().state;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          _PillTab(
            label: 'Movies',
            isSelected: current == ContentType.movies,
            onTap: () => context.read<ContentTypeCubit>().select(ContentType.movies),
          ),
          const SizedBox(width: 10),
          _PillTab(
            label: 'TV Shows',
            isSelected: current == ContentType.shows,
            onTap: () => context.read<ContentTypeCubit>().select(ContentType.shows),
          ),
        ],
      ),
    );
  }
}

class _PillTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PillTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.dividerColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : theme.colorScheme.onSurface.withValues(alpha: 0.7),
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
