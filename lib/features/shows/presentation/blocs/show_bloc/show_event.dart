import 'package:my_movie/features/movies/domain/entities/movie.dart';

abstract class ShowEvent {
  const ShowEvent();
}

class LoadTrendingShows extends ShowEvent {
  final String language;
  const LoadTrendingShows({this.language = 'en-US'});
}

class LoadShowsByCategory extends ShowEvent {
  final String category;
  final String language;
  const LoadShowsByCategory(this.category, {this.language = 'en-US'});
}

class ToggleShowWatchLater extends ShowEvent {
  final Movie movie;
  const ToggleShowWatchLater(this.movie);
}

class ToggleShowFavorite extends ShowEvent {
  final Movie movie;
  const ToggleShowFavorite(this.movie);
}

class RateShow extends ShowEvent {
  final Movie movie;
  final double rating;
  const RateShow(this.movie, this.rating);
}
