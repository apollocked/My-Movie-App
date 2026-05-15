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
