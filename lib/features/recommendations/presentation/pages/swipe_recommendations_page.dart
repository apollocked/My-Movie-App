import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import '../blocs/recommendation_bloc.dart';
import '../blocs/recommendation_event.dart';
import '../blocs/recommendation_state.dart';
import '../widgets/swipe_card_stack.dart';
import '../widgets/swipe_action_button.dart';
import '../widgets/swipe_state_views.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bloc = context.read<RecommendationBloc>();

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Discover'),
        centerTitle: true,
        actions: [
          BlocBuilder<RecommendationBloc, RecommendationState>(
            builder: (_, state) {
              if (state is! RecommendationLoaded) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(child: Text('${state.currentIndex + 1} / ${state.movies.length}',
                    style: TextStyle(color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight, fontWeight: FontWeight.w600, fontSize: 14))),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RecommendationBloc, RecommendationState>(
        builder: (_, state) {
          if (state is RecommendationLoading) return const Center(child: CircularProgressIndicator());
          if (state is RecommendationError) return ErrorSwipeView(message: state.message, onRetry: () => bloc.add(LoadRecommendations(filter: widget.filter, language: widget.language)));
          if (state is RecommendationEmpty) return EmptySwipeView(message: state.message, onChangeFilters: () => Navigator.of(context).pop());
          if (state is AllSwiped) return AllSwipedView(count: state.watchLaterIds.length, onTryAgain: () { Navigator.of(context).pop(); bloc.add(ResetRecommendations()); });
          if (state is RecommendationLoaded) return _buildContent(state);
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(RecommendationLoaded state) {
    if (state.currentMovie == null) {
      return AllSwipedView(count: state.watchLaterIds.length, onTryAgain: () { Navigator.of(context).pop(); context.read<RecommendationBloc>().add(ResetRecommendations()); });
    }
    final mq = MediaQuery.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(height: mq.size.height * 0.6, child: SwipeCardStack(movie: state.currentMovie!)),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 24, mq.padding.bottom + 80),
          child: Row(
            children: [
              Expanded(child: OutlinedButton.icon(onPressed: _onSkip,
                icon: const Icon(Icons.close_rounded, size: 22),
                label: const Text('Skip', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                style: OutlinedButton.styleFrom(foregroundColor: AppColors.textSecondaryDark,
                  side: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                  padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
              )),
              const SizedBox(width: 16),
              SwipeActionButton(icon: Icons.info_outline_rounded, color: AppColors.infoCyan, size: 52,
                onTap: () { if (state.currentMovie != null) context.push('/movie/${state.currentMovie!.id}', extra: state.currentMovie); }),
              const SizedBox(width: 16),
              Expanded(child: ElevatedButton.icon(onPressed: _onSave,
                icon: const Icon(Icons.bookmark_rounded, size: 22),
                label: const Text('Save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.successGreen, foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 0),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
