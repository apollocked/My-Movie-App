import 'package:my_movie/features/movies/domain/entities/movie.dart';

abstract class ShowState {
  const ShowState();
}

class ShowInitialState extends ShowState {
  const ShowInitialState();
}

class ShowLoading extends ShowState {
  const ShowLoading();
}

class ShowLoaded extends ShowState {
  final List<Movie> shows;
  const ShowLoaded(this.shows);
}

class ShowError extends ShowState {
  final String message;
  const ShowError(this.message);
}
