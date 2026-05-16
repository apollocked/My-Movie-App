import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

abstract class MovieState {
  const MovieState();
}

class MovieInitialState extends MovieState {
  const MovieInitialState();
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  // Const constructor added for consistency
  const MovieLoaded(this.movies);
}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);
}
