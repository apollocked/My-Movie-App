import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/movies/data/services/collection_service.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/recommendations/domain/repositories/recommendation_repository.dart';
import 'recommendation_event.dart';
import 'recommendation_state.dart';

class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  final RecommendationRepository repository;
  final CollectionService _collectionService = CollectionService();

  List<Movie> _allMovies = [];
  int _currentPage = 1;
  bool _hasReachedEnd = false;

  RecommendationBloc({required this.repository})
      : super(RecommendationInitial()) {
    on<LoadRecommendations>(_onLoadRecommendations);
    on<LoadMoreRecommendations>(_onLoadMoreRecommendations);
    on<SwipeMovieLeft>(_onSwipeLeft);
    on<SwipeMovieRight>(_onSwipeRight);
    on<ResetRecommendations>(_onReset);
  }

  Future<void> _onLoadRecommendations(
    LoadRecommendations event,
    Emitter<RecommendationState> emit,
  ) async {
    emit(RecommendationLoading());
    _currentPage = 1;
    _hasReachedEnd = false;

    try {
      final movies = await repository.getRecommendations(
        event.filter,
        event.language,
        page: _currentPage,
      );

      if (movies.isEmpty) {
        emit(RecommendationEmpty());
        return;
      }

      _allMovies = List.from(movies);
      if (event.filter.isShuffled) {
        _allMovies.shuffle(Random());
      }
      emit(RecommendationLoaded(movies: _allMovies));
    } catch (e) {
      emit(RecommendationError(e.toString()));
    }
  }

  Future<void> _onLoadMoreRecommendations(
    LoadMoreRecommendations event,
    Emitter<RecommendationState> emit,
  ) async {
    if (_hasReachedEnd) return;

    try {
      _currentPage++;
      final movies = await repository.getRecommendations(
        event.filter,
        event.language,
        page: _currentPage,
      );

      if (movies.isEmpty) {
        _hasReachedEnd = true;
        return;
      }

      _allMovies.addAll(movies);

      if (state is RecommendationLoaded) {
        final current = state as RecommendationLoaded;
        emit(current.copyWith(movies: _allMovies));
      } else if (state is AllSwiped) {
        final current = state as AllSwiped;
        emit(RecommendationLoaded(
          movies: _allMovies,
          currentIndex: 0,
          watchLaterIds: current.watchLaterIds,
        ));
      }
    } catch (e) {
      debugPrint('RecommendationBloc loadMore error: $e');
      _hasReachedEnd = true;
    }
  }

  Future<void> _onSwipeLeft(
    SwipeMovieLeft event,
    Emitter<RecommendationState> emit,
  ) async {
    if (state is RecommendationLoaded) {
      final current = state as RecommendationLoaded;
      final nextIndex = current.currentIndex + 1;

      if (nextIndex >= _allMovies.length) {
        emit(AllSwiped(watchLaterIds: current.watchLaterIds));
        return;
      }

      emit(current.copyWith(currentIndex: nextIndex));
    }
  }

  Future<void> _onSwipeRight(
    SwipeMovieRight event,
    Emitter<RecommendationState> emit,
  ) async {
    if (state is RecommendationLoaded) {
      final current = state as RecommendationLoaded;

      final movie = _allMovies.firstWhere(
        (m) => m.id == event.movieId,
        orElse: () => _allMovies[current.currentIndex],
      );

      await _collectionService.toggleCollection(movie, 'watch_later');

      final updatedWatchLater = Set<int>.from(current.watchLaterIds)
        ..add(event.movieId);
      final nextIndex = current.currentIndex + 1;

      if (nextIndex >= _allMovies.length) {
        emit(AllSwiped(watchLaterIds: updatedWatchLater));
        return;
      }

      emit(current.copyWith(
        currentIndex: nextIndex,
        watchLaterIds: updatedWatchLater,
      ));
    }
  }

  void _onReset(ResetRecommendations event, Emitter<RecommendationState> emit) {
    _allMovies = [];
    _currentPage = 1;
    _hasReachedEnd = false;
    emit(RecommendationInitial());
  }
}
