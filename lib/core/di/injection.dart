import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Core & Network Imports
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/network/connectivity_cubit/connectivity_cubit.dart';

// Features - Auth Imports
import 'package:my_movie/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:my_movie/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:my_movie/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_movie/features/auth/domain/usecases/login_usecase.dart';
import 'package:my_movie/features/auth/domain/usecases/signup_usecase.dart';
import 'package:my_movie/features/auth/domain/usecases/logout_usecase.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';

// Features - Movies & Settings Imports
import 'package:my_movie/features/movies/data/models/cached_movie.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';

// Features - Shows Imports
import 'package:my_movie/features/shows/data/datasources/show_remote_data_source.dart';
import 'package:my_movie/features/shows/data/repositories/show_repository_impl.dart';
import 'package:my_movie/features/shows/domain/repositories/show_repository.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/search_bloc/search_bloc.dart' as show_search;
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';

// Features - Recommendations Imports
import 'package:my_movie/features/recommendations/data/datasources/recommendation_remote_data_source.dart';
import 'package:my_movie/features/recommendations/data/repositories/recommendation_repository_impl.dart';
import 'package:my_movie/features/recommendations/domain/repositories/recommendation_repository.dart';
import 'package:my_movie/features/recommendations/presentation/blocs/recommendation_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  //  Core Network & Storage Dependencies
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // Resolve system paths and open Isar asynchronously before allowing app rendering
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CachedMovieSchema],
    directory: dir.path,
  );
  getIt.registerSingleton<Isar>(isar);

  //  Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<RecommendationRemoteDataSource>(
    () => RecommendationRemoteDataSource(apiClient: getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ShowRemoteDataSource>(
    () => ShowRemoteDataSourceImpl(apiClient: getIt<ApiClient>()),
  );

  //  Repositories (Injects the Data Source via GetIt)
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton<RecommendationRepository>(
    () => RecommendationRepositoryImpl(remoteDataSource: getIt<RecommendationRemoteDataSource>()),
  );
  getIt.registerLazySingleton<ShowRepository>(
    () => ShowRepositoryImpl(remoteDataSource: getIt<ShowRemoteDataSource>()),
  );

  //  Domain Use Cases (Inject the Repository via GetIt)
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(getIt<AuthRepository>()));

  //  Cubits (Singletons to manage app-wide structural states)
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
  getIt.registerLazySingleton<ConnectivityCubit>(() => ConnectivityCubit());
  getIt.registerLazySingleton<ContentTypeCubit>(() => ContentTypeCubit());

  //  Blocs (Registered as Factories to generate fresh lifecycle instances per view mount)
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: getIt<LoginUseCase>(),
      signupUseCase: getIt<SignupUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      authRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<MovieBloc>(
    () => MovieBloc(
      apiClient: getIt<ApiClient>(),
      isar: getIt<Isar>(),
    ),
  );

  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(
      apiClient: getIt<ApiClient>(),
    ),
  );

  getIt.registerFactory<RecommendationBloc>(
    () => RecommendationBloc(repository: getIt<RecommendationRepository>()),
  );

  getIt.registerFactory<ShowBloc>(
    () => ShowBloc(
      repository: getIt<ShowRepository>(),
    ),
  );

  getIt.registerFactory<show_search.ShowSearchBloc>(
    () => show_search.ShowSearchBloc(
      repository: getIt<ShowRepository>(),
    ),
  );
}
