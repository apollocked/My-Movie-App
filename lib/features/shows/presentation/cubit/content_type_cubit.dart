import 'package:flutter_bloc/flutter_bloc.dart';

enum ContentType { movies, shows }

class ContentTypeCubit extends Cubit<ContentType> {
  ContentTypeCubit() : super(ContentType.movies);

  void select(ContentType type) => emit(type);
  void toggle() => emit(state == ContentType.movies ? ContentType.shows : ContentType.movies);

  bool get isMovies => state == ContentType.movies;
  bool get isShows => state == ContentType.shows;
}
