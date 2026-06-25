import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_event.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_state.dart';
import 'package:my_movie/features/movies/presentation/widgets/featured_movie_hero.dart';
import 'package:my_movie/features/movies/presentation/widgets/category_row.dart';
import 'package:my_movie/features/movies/presentation/widgets/watch_later_row.dart';
import 'package:my_movie/features/movies/presentation/pages/shimmer_pages/hero_shimmer.dart';

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
    if (!mounted) return; // Guard clause

    setState(() {
      isloading = true;
    });

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

    if (mounted) {
      setState(() {
        isloading = false;
      });
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
        title: Text(remoteConfig.getString('name')),
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
                        _buildHero(),
                        const SizedBox(height: 24),
                        // testing the crashlytics
//                   ElevatedButton(
//   onPressed: () {
//     FirebaseCrashlytics.instance.crash();
//   },
//   child: const Text("Crash Test"),
// ),
                        const WatchLaterRow(),
                        _buildCategories(movieBloc.apiClient),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildHero() {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const HeroShimmer();
        }
        if (state is MovieLoaded && state.movies.isNotEmpty) {
          final m = state.movies.first;
          return FeaturedMovieHero(
              movie: m,
              onPlayPressed: () => context.push('/movie/${m.id}?autoPlay=true', extra: m),
              onInfoPressed: () => context.push('/movie/${m.id}', extra: m));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildCategories(dynamic apiClient) {
    final titles = [
      t.home.trending,
      t.home.top_rated,
      t.home.now_playing,
      t.home.popular,
      t.home.upcoming,
      t.home.action,
      t.home.sci_fi,
      t.home.horror,
      t.home.drama,
      t.home.comedy,
      t.home.romance,
      t.home.thriller,
      t.home.animation,
      t.home.mystery,
    ];

    final endpoints = [
      '/trending/movie/day',
      '/movie/top_rated',
      '/movie/now_playing',
      '/movie/popular',
      '/movie/upcoming',
      '/discover/movie?with_genres=28',
      '/discover/movie?with_genres=878',
      '/discover/movie?with_genres=27',
      '/discover/movie?with_genres=18',
      '/discover/movie?with_genres=35',
      '/discover/movie?with_genres=10749',
      '/discover/movie?with_genres=53',
      '/discover/movie?with_genres=16',
      '/discover/movie?with_genres=9648',
    ];
    return Column(
      children: List.generate(
          titles.length,
          (i) => CategoryRow(
              apiClient: apiClient, title: titles[i], endpoint: endpoints[i])),
    );
  }
}
