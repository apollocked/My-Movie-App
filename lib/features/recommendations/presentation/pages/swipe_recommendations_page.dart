import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/locale_utils.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import '../blocs/recommendation_bloc.dart';
import '../blocs/recommendation_event.dart';
import '../blocs/recommendation_state.dart';
import '../widgets/swipe/swipe_card_stack.dart';
import '../widgets/swipe/swipe_progress_badge.dart';
import '../widgets/swipe/swipe_bottom_actions.dart';
import '../widgets/swipe/swipe_state_views.dart';

import 'package:my_movie/features/recommendations/domain/entities/recommendation_filter.dart';

class SwipeRecommendationsPage extends StatefulWidget {
  final RecommendationFilter filter;
  final String language;

  const SwipeRecommendationsPage(
      {super.key, required this.filter, required this.language});

  @override
  State<SwipeRecommendationsPage> createState() =>
      _SwipeRecommendationsPageState();
}

class _SwipeRecommendationsPageState extends State<SwipeRecommendationsPage> {
  final ApiClient _apiClient = ApiClient();
  String _fullOverview = '';
  int? _lastFetchedMovieId;

  void _fetchFullOverview(int movieId, bool isTv) async {
    if (_lastFetchedMovieId == movieId) return;
    _lastFetchedMovieId = movieId;
    try {
      final lang =
          getTmdbLanguageCode(context.read<SettingsCubit>().state.locale);
      final endpoint = isTv ? '/tv/$movieId' : '/movie/$movieId';
      final data = await _apiClient.get(endpoint, params: {'language': lang});
      if (!mounted) return;
      setState(() {
        _fullOverview = (data['overview'] as String?) ?? '';
      });
    } catch (_) {
      if (!mounted) return;
      setState(() { _fullOverview = ''; });
    }
  }

  void _onSkip() {
    context.read<RecommendationBloc>().add(SwipeMovieLeft());
    _checkLoadMore();
  }

  void _onSave() {
    final s = context.read<RecommendationBloc>().state;
    if (s is RecommendationLoaded && s.currentMovie != null) {
      context
          .read<RecommendationBloc>()
          .add(SwipeMovieRight(s.currentMovie!.id));
      _checkLoadMore();
    }
  }

  void _checkLoadMore() {
    final s = context.read<RecommendationBloc>().state;
    if (s is RecommendationLoaded && s.movies.length - s.currentIndex <= 3) {
      context.read<RecommendationBloc>().add(LoadMoreRecommendations(
          filter: widget.filter, language: widget.language));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final s = context.read<RecommendationBloc>().state;
    if (s is RecommendationLoaded && s.currentMovie != null) {
      _fetchFullOverview(s.currentMovie!.id, widget.filter.isForShows);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<RecommendationBloc>();
    final isTv = widget.filter.isForShows;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 6,
              height: 24,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Text(t.swipe.title,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
        actions: [
          BlocBuilder<RecommendationBloc, RecommendationState>(
              builder: (_, state) {
            if (state is! RecommendationLoaded) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: SwipeProgressBadge(
                  current: state.currentIndex + 1, total: state.movies.length),
            );
          })
        ],
      ),
      body: BlocListener<RecommendationBloc, RecommendationState>(
        listenWhen: (prev, curr) =>
            curr is RecommendationLoaded && prev is RecommendationLoaded
                ? curr.currentMovie?.id != prev.currentMovie?.id
                : curr is RecommendationLoaded,
        listener: (_, state) {
          if (state is RecommendationLoaded && state.currentMovie != null) {
            setState(() { _fullOverview = ''; });
            _fetchFullOverview(state.currentMovie!.id, widget.filter.isForShows);
          }
        },
        child: BlocBuilder<RecommendationBloc, RecommendationState>(
          builder: (_, state) {
            if (state is RecommendationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is RecommendationError) {
              return ErrorSwipeView(
                  message: state.message,
                  onRetry: () => bloc.add(LoadRecommendations(
                      filter: widget.filter, language: widget.language)));
            }
            if (state is RecommendationEmpty) {
              return EmptySwipeView(
                  message: state.message.isNotEmpty
                      ? state.message
                      : t.swipe.empty_no_movies,
                  onChangeFilters: () => Navigator.of(context).pop());
            }
            if (state is AllSwiped) {
              return AllSwipedView(
                count: state.watchLaterIds.length,
                onRefine: () => Navigator.of(context).pop(),
                onViewWatchLater: () => context.go('/profile'),
              );
            }
            if (state is RecommendationLoaded) return _buildContent(state, isTv);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(RecommendationLoaded state, bool isTv) {
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
                child: SizedBox(
                    height: mq.size.height * 0.6,
                    child: SwipeCardStack(
                        movie: state.currentMovie!,
                        fullOverview: _fullOverview,
                        onSwipeLeft: _onSkip,
                        onSwipeRight: _onSave)),
              ),
            ],
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          bottom: bottom + 175,
          child: SwipeBottomActions(
            isTv: isTv,
            currentMovieId: state.currentMovie!.id,
            currentMovie: state.currentMovie,
            onSkip: _onSkip,
            onSave: _onSave,
          ),
        ),
      ],
    );
  }
}
