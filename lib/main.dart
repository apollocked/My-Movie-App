import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/firebase_options.dart';
import 'package:my_movies_app/core/routing/app_router.dart';
import 'package:my_movies_app/core/network/api_client.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/search_bloc/search_bloc.dart';
import 'package:my_movies_app/features/movies/data/models/cached_movie.dart';
import 'package:my_movies_app/core/theme/app_theme.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_state.dart';
import 'package:my_movies_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movies_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_movies_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_movies_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:my_movies_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:my_movies_app/features/auth/domain/usecases/logout_usecase.dart';

import 'package:my_movies_app/core/localization/fallback_delegates.dart';
import 'package:my_movies_app/i18n/strings.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final apiClient = ApiClient();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CachedMovieSchema],
    directory: dir.path,
  );

  final remoteDataSource = AuthRemoteDataSourceImpl();
  final AuthRepository authRepository = AuthRepositoryImpl(remoteDataSource);

  final LoginUseCase loginUseCase = LoginUseCase(authRepository);
  final SignupUseCase signupUseCase = SignupUseCase(authRepository);
  final LogoutUseCase logoutUseCase = LogoutUseCase(authRepository);

  runApp(
    TranslationProvider(
      child: MyApp(
        apiClient: apiClient,
        isar: isar,
        authRepository: authRepository,
        loginUseCase: loginUseCase,
        signupUseCase: signupUseCase,
        logoutUseCase: logoutUseCase,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final ApiClient apiClient;
  final Isar isar;
  final AuthRepository authRepository;
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final LogoutUseCase logoutUseCase;

  const MyApp({
    super.key,
    required this.apiClient,
    required this.isar,
    required this.authRepository,
    required this.loginUseCase,
    required this.signupUseCase,
    required this.logoutUseCase,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthBloc _authBloc;
  late final MovieBloc _movieBloc;
  late final SearchBloc _searchBloc;
  late final SettingsCubit _settingsCubit;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(
      loginUseCase: widget.loginUseCase,
      signupUseCase: widget.signupUseCase,
      logoutUseCase: widget.logoutUseCase,
      authRepository: widget.authRepository,
    )..add(const AuthCheckRequested());

    _movieBloc = MovieBloc(apiClient: widget.apiClient, isar: widget.isar);
    _searchBloc = SearchBloc(apiClient: widget.apiClient);
    _settingsCubit = SettingsCubit();
    _router = AppRouter.router(_authBloc);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>.value(value: _movieBloc),
        BlocProvider<SearchBloc>.value(value: _searchBloc),
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<SettingsCubit>.value(value: _settingsCubit),
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
          );
        },
      ),
    );
  }
}
