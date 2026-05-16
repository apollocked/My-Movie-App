class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get fullBackdropUrl => 'https://image.tmdb.org/t/p/w780$backdropPath';
}
