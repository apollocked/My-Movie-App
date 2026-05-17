import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/core/config/firebase_options.dart';
import 'package:my_movies_app/core/routing/app_router.dart';
import 'package:my_movies_app/core/di/injection.dart';
import 'package:my_movies_app/core/theme/app_theme.dart';
import 'package:my_movies_app/core/localization/fallback_delegates.dart';
import 'package:my_movies_app/core/localization/strings.g.dart';
import 'package:my_movies_app/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'package:my_movies_app/core/network/connectivity_cubit/connectivity_cubit.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
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
  late final SettingsCubit _settingsCubit;
  late final ConnectivityCubit _connectivityCubit;
  late final GoRouter _router;
  @override
  void initState() {
    super.initState();
    _authBloc = getIt<AuthBloc>()..add(const AuthCheckRequested());
    _movieBloc = getIt<MovieBloc>();
    _searchBloc = getIt<SearchBloc>();
    _settingsCubit = getIt<SettingsCubit>();
    _connectivityCubit = getIt<ConnectivityCubit>();
    _router = AppRouter.router(_authBloc);
  }

  @override
  void dispose() {
    _authBloc.close();
    _movieBloc.close();
    _searchBloc.close();
    _settingsCubit.close();
    _connectivityCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>.value(value: _movieBloc),
        BlocProvider<SearchBloc>.value(value: _searchBloc),
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<SettingsCubit>.value(value: _settingsCubit),
        BlocProvider<ConnectivityCubit>.value(value: _connectivityCubit),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settingsState) {
          return MaterialApp.router(
            title: 'My Movies App',
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
            builder: (context, child) =>
                _buildConnectivityOverlay(context, child),
          );
        },
      ),
    );
  }

  Widget _buildConnectivityOverlay(BuildContext context, Widget? child) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state is ConnectivityOffline) {
          _router.push('/no-internet');
        }
      },
      child: child ?? const SizedBox.shrink(),
    );
  }
}
