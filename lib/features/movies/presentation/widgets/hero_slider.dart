import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'featured_movie_hero.dart';

class HeroSlider extends StatefulWidget {
  final List<Movie> movies;
  final String Function(Movie movie) route;
  final String Function(Movie movie) autoPlayRoute;
  final Duration autoSwitchInterval;

  const HeroSlider({
    super.key,
    required this.movies,
    required this.route,
    required this.autoPlayRoute,
    this.autoSwitchInterval = const Duration(seconds: 5),
  });

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  late final PageController _pageController;
  final ValueNotifier<int> _currentPage = ValueNotifier(0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void didUpdateWidget(HeroSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.movies.length != widget.movies.length ||
        (widget.movies.isNotEmpty && oldWidget.movies.isNotEmpty &&
            oldWidget.movies.first.id != widget.movies.first.id)) {
      _currentPage.value = 0;
      _pageController.jumpToPage(0);
    }
  }

  void _startTimer() {
    _timer?.cancel();
    if (widget.movies.length <= 1) return;
    _timer = Timer.periodic(widget.autoSwitchInterval, (_) {
      if (!mounted || !_pageController.hasClients) return;
      final raw = _pageController.page;
      if (raw == null || (raw - raw.round()).abs() > 0.01) return;
      final next = (_currentPage.value + 1) % widget.movies.length;
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _currentPage.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: AppSizing.hp(context, 60).clamp(380, 600),
          child: ClipRect(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.movies.length,
              onPageChanged: (i) => _currentPage.value = i,
              itemBuilder: (context, index) {
                final m = widget.movies[index];
                return RepaintBoundary(
                  child: FeaturedMovieHero(
                    movie: m,
                    onPlayPressed: () =>
                        context.push(widget.autoPlayRoute(m), extra: m),
                    onInfoPressed: () =>
                        context.push(widget.route(m), extra: m),
                  ),
                );
              },
            ),
          ),
        ),
        if (widget.movies.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: _buildDots(context),
          ),
      ],
    );
  }

  Widget _buildDots(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (_, current, __) {
        final theme = Theme.of(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.movies.length, (i) {
            final isActive = i == current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? theme.colorScheme.primary
                    : AppColors.textTertiaryDark.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        );
      },
    );
  }
}