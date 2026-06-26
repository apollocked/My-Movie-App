import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_event.dart';
import 'package:my_movie/features/movies/presentation/widgets/watch_later_row.dart';
import 'package:my_movie/features/movies/presentation/widgets/home/home_hero_section.dart';
import 'package:my_movie/features/movies/presentation/widgets/home/home_categories_section.dart';

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
      // Remote Config failure is non-critical; fall back to defaults.
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
    final locale = context.watch<SettingsCubit>().state.locale;

    return Scaffold(
      appBar: AppBar(
        title: Row(
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
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocListener<SettingsCubit, SettingsState>(
        listenWhen: (previous, current) => previous.locale != current.locale,
        listener: (context, state) => movieBloc.add(LoadMoviesByCategory(
            'Trending',
            language: getTmdbLanguageCode(state.locale))),
        child: isloading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                top: false,
                child: RefreshIndicator(
                  color: theme.primaryColor,
                  onRefresh: () async => movieBloc.add(LoadMoviesByCategory(
                      'Trending',
                      language: getTmdbLanguageCode(locale))),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeHeroSection(),
                        const SizedBox(height: 16),
                        const WatchLaterRow(),
                        HomeCategoriesSection(apiClient: movieBloc.apiClient),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
