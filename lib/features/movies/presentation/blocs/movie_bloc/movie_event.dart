import 'package:my_movie/features/movies/domain/entities/movie.dart';

abstract class MovieEvent {
  const MovieEvent();
}

class LoadTrendingMovies extends MovieEvent {
  final String language;
  const LoadTrendingMovies({this.language = 'en-US'});
}

class LoadMoviesByCategory extends MovieEvent {
  final String category;
  final String language;
  const LoadMoviesByCategory(this.category, {this.language = 'en-US'});
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
