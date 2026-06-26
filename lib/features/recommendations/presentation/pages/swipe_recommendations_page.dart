import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import '../blocs/recommendation_bloc.dart';
import '../blocs/recommendation_event.dart';
import '../blocs/recommendation_state.dart';
import '../widgets/swipe/swipe_card_stack.dart';
import '../widgets/swipe/swipe_action_button.dart';
import '../widgets/swipe/swipe_state_views.dart';

import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';

class SwipeRecommendationsPage extends StatefulWidget {
  final RecommendationFilter filter;
  final String language;

  const SwipeRecommendationsPage({super.key, required this.filter, required this.language});

  @override
  State<SwipeRecommendationsPage> createState() => _SwipeRecommendationsPageState();
}

class _SwipeRecommendationsPageState extends State<SwipeRecommendationsPage> {
  void _onSkip() {
    context.read<RecommendationBloc>().add(SwipeMovieLeft());
    _checkLoadMore();
  }

  void _onSave() {
    final s = context.read<RecommendationBloc>().state;
    if (s is RecommendationLoaded && s.currentMovie != null) {
      context.read<RecommendationBloc>().add(SwipeMovieRight(s.currentMovie!.id));
      _checkLoadMore();
    }
  }

  void _checkLoadMore() {
    final s = context.read<RecommendationBloc>().state;
    if (s is RecommendationLoaded && s.movies.length - s.currentIndex <= 3) {
      context.read<RecommendationBloc>().add(LoadMoreRecommendations(filter: widget.filter, language: widget.language));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<RecommendationBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(t.swipe.title),
        actions: [
          BlocBuilder<RecommendationBloc, RecommendationState>(
            builder: (_, state) {
              if (state is! RecommendationLoaded) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('${state.currentIndex + 1} / ${state.movies.length}',
                        style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w700, fontSize: 13)),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RecommendationBloc, RecommendationState>(
        builder: (_, state) {
          if (state is RecommendationLoading) return const Center(child: CircularProgressIndicator());
          if (state is RecommendationError) return ErrorSwipeView(message: state.message, onRetry: () => bloc.add(LoadRecommendations(filter: widget.filter, language: widget.language)));
          if (state is RecommendationEmpty) return EmptySwipeView(message: state.message.isNotEmpty ? state.message : t.swipe.empty_no_movies, onChangeFilters: () => Navigator.of(context).pop());
          if (state is AllSwiped) {
            return AllSwipedView(
              count: state.watchLaterIds.length,
              onRefine: () => Navigator.of(context).pop(),
              onViewWatchLater: () => context.go('/profile'),
            );
          }
          if (state is RecommendationLoaded) return _buildContent(state);
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(RecommendationLoaded state) {
    if (state.currentMovie == null) {
      return AllSwipedView(
        count: state.watchLaterIds.length,
        onRefine: () => Navigator.of(context).pop(),
        onViewWatchLater: () => context.go('/profile'),
      );
    }
    final mq = MediaQuery.of(context);
    final bottom = mq.padding.bottom;

    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(height: mq.size.height * 0.6, child: SwipeCardStack(movie: state.currentMovie!, onSwipeLeft: _onSkip, onSwipeRight: _onSave)),
              ),
            ],
          ),
        ),
        Positioned(
          left: 24, right: 24,
          bottom: bottom + 100,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: OutlinedButton.icon(
                    onPressed: _onSkip,
                    icon: const Icon(Icons.close_rounded, size: 20),
                    label: Text(t.swipe.skip),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 52,
                child: SwipeActionButton(icon: Icons.info_outline_rounded, color: AppColors.infoCyan, size: 52,
                  onTap: () { if (state.currentMovie != null) context.push('/movie/${state.currentMovie!.id}', extra: state.currentMovie); }),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: FilledButton.icon(
                    onPressed: _onSave,
                    icon: const Icon(Icons.bookmark_rounded, size: 20),
                    label: Text(t.swipe.save),
                    style: FilledButton.styleFrom(backgroundColor: AppColors.successGreen),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}