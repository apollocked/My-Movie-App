import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';

abstract class RecommendationEvent {}

class LoadRecommendations extends RecommendationEvent {
  final RecommendationFilter filter;
  final String language;
  LoadRecommendations({required this.filter, required this.language});
}

class LoadMoreRecommendations extends RecommendationEvent {
  final RecommendationFilter filter;
  final String language;
  LoadMoreRecommendations({required this.filter, required this.language});
}

class SwipeMovieLeft extends RecommendationEvent {}

class SwipeMovieRight extends RecommendationEvent {
  final int movieId;
  SwipeMovieRight(this.movieId);
}

class ResetRecommendations extends RecommendationEvent {}
