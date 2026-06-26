import 'package:flutter/material.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'movie_swipe_card.dart';

class SwipeCardStack extends StatefulWidget {
  final Movie movie;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;

  const SwipeCardStack({super.key, required this.movie, this.onSwipeLeft, this.onSwipeRight});

  @override
  State<SwipeCardStack> createState() => _SwipeCardStackState();
}

class _SwipeCardStackState extends State<SwipeCardStack> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scaleAnim;
  late Animation<double> _opacityAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_ctrl);
    _ctrl.value = 1.0;
  }

  @override
  void didUpdateWidget(SwipeCardStack old) {
    super.didUpdateWidget(old);
    if (old.movie.id != widget.movie.id) {
      _ctrl.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, child) {
        return Opacity(
          opacity: _opacityAnim.value,
          child: Transform.scale(scale: _scaleAnim.value, child: child),
        );
      },
      child: MovieSwipeCard(
        key: ValueKey(widget.movie.id),
        movie: widget.movie,
        onSwipeLeft: widget.onSwipeLeft,
        onSwipeRight: widget.onSwipeRight,
      ),
    );
  }
}
