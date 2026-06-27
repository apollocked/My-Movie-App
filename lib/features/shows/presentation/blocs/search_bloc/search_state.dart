import 'package:my_movie/features/movies/domain/entities/movie.dart';

abstract class ShowSearchState {
  const ShowSearchState();
}

class ShowSearchInitial extends ShowSearchState {}

class ShowSearchLoading extends ShowSearchState {}

class ShowSearchLoaded extends ShowSearchState {
  final List<Movie> results;
  const ShowSearchLoaded(this.results);
}

class ShowSearchError extends ShowSearchState {
  final String message;
  const ShowSearchError(this.message);
}
