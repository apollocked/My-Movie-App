import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
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
import 'package:my_movie/features/auth/domain/usecases/google_login_usecase.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';

// Features - Movies & Settings Imports
import 'package:my_movie/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:my_movie/features/movies/data/datasources/movie_local_data_source.dart';
import 'package:my_movie/features/movies/data/datasources/movie_firestore_data_source.dart';
import 'package:my_movie/features/movies/data/datasources/guest_local_data_source.dart';
import 'package:my_movie/features/movies/data/services/search_history_service.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/movies/data/models/cached_movie.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';

// Features - Shows Imports
import 'package:my_movie/features/shows/data/datasources/show_remote_data_source.dart';
import 'package:my_movie/features/shows/data/datasources/show_local_data_source.dart';
import 'package:my_movie/features/shows/data/datasources/show_firestore_data_source.dart';
import 'package:my_movie/features/shows/data/datasources/guest_local_data_source.dart' as show_guest;
import 'package:my_movie/features/shows/data/services/search_history_service.dart' as show_history;
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
  getIt.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(dio: Dio()),
  );
  getIt.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSource(apiClient: getIt<ApiClient>(), isar: getIt<Isar>()),
  );
  getIt.registerLazySingleton<MovieFirestoreDataSourceImpl>(
    () => MovieFirestoreDataSourceImpl(),
  );
  getIt.registerLazySingleton<GuestLocalDataSource>(
    () => GuestLocalDataSource(),
  );
  getIt.registerLazySingleton<ShowLocalDataSource>(
    () => ShowLocalDataSource(apiClient: getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<show_guest.ShowGuestLocalDataSource>(
    () => show_guest.ShowGuestLocalDataSource(),
  );
  getIt.registerLazySingleton<ShowFirestoreDataSourceImpl>(
    () => ShowFirestoreDataSourceImpl(),
  );

  //  Services
  getIt.registerLazySingleton<SearchHistoryService>(
    () => SearchHistoryService(),
  );
  getIt.registerLazySingleton<show_history.ShowSearchHistoryService>(
    () => show_history.ShowSearchHistoryService(),
  );
  getIt.registerLazySingleton<CollectionService>(
    () => CollectionService(local: getIt<GuestLocalDataSource>()),
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
  getIt.registerLazySingleton<GoogleLoginUseCase>(
      () => GoogleLoginUseCase(getIt<AuthRepository>()));

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
      googleLoginUseCase: getIt<GoogleLoginUseCase>(),
      authRepository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<MovieBloc>(
    () => MovieBloc(
      apiClient: getIt<ApiClient>(),
      isar: getIt<Isar>(),
      collectionService: getIt<CollectionService>(),
    ),
  );

  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(
      apiClient: getIt<ApiClient>(),
    ),
  );

  getIt.registerFactory<RecommendationBloc>(
    () => RecommendationBloc(
      repository: getIt<RecommendationRepository>(),
      collectionService: getIt<CollectionService>(),
    ),
  );

  getIt.registerFactory<ShowBloc>(
    () => ShowBloc(
      repository: getIt<ShowRepository>(),
      collectionService: getIt<CollectionService>(),
    ),
  );

  getIt.registerFactory<show_search.ShowSearchBloc>(
    () => show_search.ShowSearchBloc(
      repository: getIt<ShowRepository>(),
    ),
  );
}
