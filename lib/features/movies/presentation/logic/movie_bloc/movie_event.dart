import 'package:my_movies_app/features/movies/domain/entities/movie.dart';

abstract class MovieEvent {
  const MovieEvent();
}

class LoadTrendingMovies extends MovieEvent {
  const LoadTrendingMovies();
}

class LoadMoviesByCategory extends MovieEvent {
  final String category;
  const LoadMoviesByCategory(this.category);
}

class ToggleWatchLater extends MovieEvent {
  final Movie movie;
  const ToggleWatchLater(this.movie);
}

class ToggleFavorite extends MovieEvent {
  final Movie movie;
  const ToggleFavorite(this.movie);
}

class RateMovie extends MovieEvent {
  final Movie movie;
  final double rating;
  const RateMovie(this.movie, this.rating);
}
