import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:isar/isar.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/movie_bloc/movie_event.dart';
import 'package:my_movies_app/features/movies/presentation/logic/search_bloc/search_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'core/network/api_client.dart';
import 'core/routing/app_router.dart';
import 'features/movies/data/models/cached_movie.dart';
// Contains our updated SettingsCubit

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CachedMovieSchema],
    directory: dir.path,
  );

  final apiClient = ApiClient();

  runApp(
    MultiBlocProvider(
      providers: [
        // Settings acts as a lightweight Cubit
        BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
        // Movie and Search run as full, robust BLoCs
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(apiClient: apiClient, isar: isar)
            ..add(LoadTrendingMovies()),
        ),
        BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(apiClient: apiClient)),
      ],
      child: const MovieVaultApp(),
    ),
  );
}

class MovieVaultApp extends StatelessWidget {
  const MovieVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch our lean SettingsCubit state modifications directly
    final settings = context.watch<SettingsCubit>().state;

    return MaterialApp.router(
      title: 'MovieVault',
      debugShowCheckedModeBanner: false,
      themeMode: settings.themeMode,
      locale: settings.locale,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
