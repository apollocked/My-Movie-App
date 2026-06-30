import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_event.dart';
import 'package:my_movie/features/movies/presentation/widgets/watch_later_row.dart';
import 'package:my_movie/features/movies/presentation/widgets/home/home_hero_section.dart';
import 'package:my_movie/features/movies/presentation/widgets/home/home_categories_section.dart';
import 'package:my_movie/features/movies/presentation/widgets/home/content_type_pill.dart';
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
    } catch (e) {
      debugPrint('HomePage.initRemoteConfig error: $e');
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
                  width: 6, height: 24,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(3),
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
            const ContentTypePill(),
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
                              ? _buildMovieContent(bottom)
                              : _buildShowContent(bottom),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieContent(double bottom) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeHeroSection(),
        const SizedBox(height: 16),
        const WatchLaterRow(),
        HomeCategoriesSection(apiClient: context.read<MovieBloc>().apiClient),
        SizedBox(height: bottom + 120),
      ],
    );
  }

  Widget _buildShowContent(double bottom) {
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

