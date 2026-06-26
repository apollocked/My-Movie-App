import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';

abstract class RecommendationEvent {
  const RecommendationEvent();
}

class LoadRecommendations extends RecommendationEvent {
  final RecommendationFilter filter;
  final String language;
  const LoadRecommendations({required this.filter, required this.language});
}

class LoadMoreRecommendations extends RecommendationEvent {
  final RecommendationFilter filter;
  final String language;
  const LoadMoreRecommendations({required this.filter, required this.language});
}

class SwipeMovieLeft extends RecommendationEvent {
  const SwipeMovieLeft();
}

class SwipeMovieRight extends RecommendationEvent {
  final int movieId;
  const SwipeMovieRight(this.movieId);
}

class ResetRecommendations extends RecommendationEvent {
  const ResetRecommendations();
}
