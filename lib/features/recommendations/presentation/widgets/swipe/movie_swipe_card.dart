import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import '../movie_network_image.dart';
import 'swipe_card_info_panel.dart';


class MovieSwipeCard extends StatefulWidget {
  final Movie movie;
  final VoidCallback? onSwipeLeft;
  final VoidCallback? onSwipeRight;

  const MovieSwipeCard({super.key, required this.movie, this.onSwipeLeft, this.onSwipeRight});

  @override
  State<MovieSwipeCard> createState() => _MovieSwipeCardState();
}

class _MovieSwipeCardState extends State<MovieSwipeCard> with SingleTickerProviderStateMixin {
  Offset _drag = Offset.zero;
  bool _isDragging = false;
  late AnimationController _snapCtrl;

  static const _threshold = 120.0;

  @override
  void initState() {
    super.initState();
    _snapCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    _snapCtrl.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails d) {
    if (_snapCtrl.isAnimating) return;
    setState(() { _drag += d.delta; _isDragging = true; });
  }

  void _onPanEnd(DragEndDetails _) {
    if (_drag.dx > _threshold) { widget.onSwipeRight?.call(); _reset(); return; }
    if (_drag.dx < -_threshold) { widget.onSwipeLeft?.call(); _reset(); return; }
    _animateBack();
  }

  void _animateBack() {
    final begin = _drag;
    void listener() {
      if (mounted) setState(() => _drag = Offset.lerp(begin, Offset.zero, _snapCtrl.value)!);
    }
    _snapCtrl.addListener(listener);
    _snapCtrl.forward(from: 0);
    _snapCtrl.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        _snapCtrl.removeListener(listener);
        setState(() { _drag = Offset.zero; _isDragging = false; });
      }
    });
  }

  void _reset() {
    setState(() { _drag = Offset.zero; _isDragging = false; });
  }

  double get _rotation => _isDragging ? _drag.dx / 500 : 0;
  double get _dragRatio => _isDragging ? (_drag.dx / _threshold).clamp(-1.0, 1.0) : 0.0;

  Color get _borderColor {
    if (!_isDragging || _dragRatio.abs() < 0.3) return Colors.transparent;
    return _dragRatio > 0 ? AppColors.successGreen : AppColors.errorRed;
  }

  double get _borderWidth {
    if (!_isDragging || _dragRatio.abs() < 0.3) return 0;
    return (_dragRatio.abs() * 4).clamp(1.0, 4.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: _isDragging ? _drag : Offset.zero,
        child: Opacity(
          opacity: _isDragging ? 1.0 - (_dragRatio.abs() * 0.25) : 1.0,
          child: Transform.rotate(angle: _rotation, child: _card()),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor, width: _borderWidth),
        boxShadow: [
          BoxShadow(color: _borderColor.withValues(alpha: _borderWidth / 6), blurRadius: 24, spreadRadius: 2),
          BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 20, offset: const Offset(0, 8)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 3, child: MovieNetworkImage(
                  backdropUrl: widget.movie.fullBackdropUrl, posterUrl: widget.movie.fullPosterUrl, title: widget.movie.title,
                )),
                Expanded(flex: 2, child: SwipeCardInfoPanel(movie: widget.movie)),
              ],
            ),
            if (_isDragging && _dragRatio.abs() > 0.3) ...[
              Positioned.fill(
                child: Container(
                  color: (_dragRatio > 0 ? AppColors.successGreen : AppColors.errorRed).withValues(alpha: _dragRatio.abs() * 0.1),
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: _dragRatio > 0 ? -0.15 : 0.15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: _dragRatio > 0 ? AppColors.successGreen : AppColors.errorRed, width: 4),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black54,
                    ),
                    child: Text(
                      _dragRatio > 0 ? t.swipe.save_label : t.swipe.skip_label,
                      style: TextStyle(
                        color: _dragRatio > 0 ? AppColors.successGreen : AppColors.errorRed,
                        fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
