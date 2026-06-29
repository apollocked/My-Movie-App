import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/config/firebase_options.dart';
import 'package:my_movie/core/routing/app_router.dart';
import 'package:my_movie/core/di/injection.dart';
import 'package:my_movie/core/theme/app_theme.dart';
import 'package:my_movie/core/localization/fallback_delegates.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movie/core/network/connectivity_cubit/connectivity_cubit.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movie/features/recommendations/presentation/blocs/recommendation_bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:my_movie/common/widgets/offline_wrapper.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/search_bloc/search_bloc.dart' as show_search;
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    TranslationProvider(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthBloc _authBloc;

  late final MovieBloc _movieBloc;

  late final SearchBloc _searchBloc;

  late final RecommendationBloc _recommendationBloc;

  late final SettingsCubit _settingsCubit;

  late final ConnectivityCubit _connectivityCubit;

  late final ShowBloc _showBloc;

  late final show_search.ShowSearchBloc _showSearchBloc;

  late final ContentTypeCubit _contentTypeCubit;

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _authBloc = getIt<AuthBloc>()..add(const AuthCheckRequested());
    _movieBloc = getIt<MovieBloc>();
    _searchBloc = getIt<SearchBloc>();
    _recommendationBloc = getIt<RecommendationBloc>();
    _settingsCubit = getIt<SettingsCubit>();
    _connectivityCubit = getIt<ConnectivityCubit>();
    _showBloc = getIt<ShowBloc>();
    _showSearchBloc = getIt<show_search.ShowSearchBloc>();
    _contentTypeCubit = getIt<ContentTypeCubit>();
    _router = AppRouter.router(_authBloc);
  }

  @override
  void dispose() {
    _authBloc.close();
    _movieBloc.close();
    _searchBloc.close();
    _recommendationBloc.close();
    _settingsCubit.close();
    _connectivityCubit.close();
    _showBloc.close();
    _showSearchBloc.close();
    _contentTypeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>.value(value: _movieBloc),
        BlocProvider<SearchBloc>.value(value: _searchBloc),
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<RecommendationBloc>.value(value: _recommendationBloc),
        BlocProvider<SettingsCubit>.value(value: _settingsCubit),
        BlocProvider<ConnectivityCubit>.value(value: _connectivityCubit),
        BlocProvider<ShowBloc>.value(value: _showBloc),
        BlocProvider<show_search.ShowSearchBloc>.value(value: _showSearchBloc),
        BlocProvider<ContentTypeCubit>.value(value: _contentTypeCubit),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (prev, curr) =>
            prev.themeMode != curr.themeMode || prev.locale != curr.locale,
        builder: (context, settingsState) {
          return MaterialApp.router(
            title: t.common.my_movie,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: settingsState.themeMode,
            locale: settingsState.locale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              FallbackMaterialLocalizationsDelegate(),
              FallbackCupertinoLocalizationsDelegate(),
              FallbackWidgetsLocalizationsDelegate(),
            ],
            supportedLocales: AppLocaleUtils.instance.supportedLocales,
            routerConfig: _router,
            builder: (context, child) => OfflineWrapper(child: child),
          );
        },
      ),
    );
  }
}
