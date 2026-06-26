import 'package:my_movie/features/movies/domain/entities/movie.dart';

abstract class RecommendationState {}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoading extends RecommendationState {}

class RecommendationLoaded extends RecommendationState {
  final List<Movie> movies;
  final int currentIndex;
  final Set<int> watchLaterIds;

  RecommendationLoaded({
    required this.movies,
    this.currentIndex = 0,
    this.watchLaterIds = const {},
  });

  bool get hasMore => currentIndex < movies.length - 1;
  Movie? get currentMovie => currentIndex < movies.length ? movies[currentIndex] : null;

  RecommendationLoaded copyWith({
    List<Movie>? movies,
    int? currentIndex,
    Set<int>? watchLaterIds,
  }) {
    return RecommendationLoaded(
      movies: movies ?? this.movies,
      currentIndex: currentIndex ?? this.currentIndex,
      watchLaterIds: watchLaterIds ?? this.watchLaterIds,
    );
  }
}

class RecommendationEmpty extends RecommendationState {
  final String message;
  RecommendationEmpty({this.message = 'No movies found. Try different filters.'});
}

class RecommendationError extends RecommendationState {
  final String message;
  RecommendationError(this.message);
}

class AllSwiped extends RecommendationState {
  final Set<int> watchLaterIds;
  AllSwiped({required this.watchLaterIds});
}
