import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import '../../domain/entities/movie.dart';
import 'card_quick_actions.dart';
import 'card_rating_badge.dart';
import 'release_countdown_badge.dart';

class MoviePosterCard extends StatelessWidget {
  final double height;
  final Movie? movie;
  final bool fillWidth;

  const MoviePosterCard({super.key, this.height = 260, this.movie, this.fillWidth = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: fillWidth ? null : height * 0.68,
      margin: fillWidth ? EdgeInsets.zero : const EdgeInsetsDirectional.only(end: 16, bottom: 8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isDark
                ? AppColors.darkBorder.withValues(alpha: 0.6)
                : AppColors.lightBorder),
        boxShadow: [
          BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 8)),
          BoxShadow(
              color: isDark
                  ? AppColors.primaryRed.withValues(alpha: 0.05)
                  : Colors.transparent,
              blurRadius: 24,
              offset: const Offset(0, 0)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(child: _buildImage(isDark, theme)),
          if (movie != null) ...[
            ReleaseCountdownBadge(movie: movie!),
            _buildGlassTitleOverlay(context),
            CardQuickActions(movie: movie!),
            CardRatingBadge(
                movie: movie!, rating: movie!.voteAverage.toStringAsFixed(1)),
          ],
        ],
      ),
    );
  }

  Widget _buildImage(bool isDark, ThemeData theme) {
    final posterUrl = movie?.fullPosterUrl ??
        'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500';
    return CachedNetworkImage(
      imageUrl: posterUrl,
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(
        color: isDark
            ? AppColors.darkSurfaceVariant
            : AppColors.lightSurfaceVariant,
      ),
      errorWidget: (_, __, ___) => Container(
        color: isDark
            ? AppColors.darkSurfaceVariant
            : AppColors.lightSurfaceVariant,
        child: Icon(Icons.movie_rounded, color: theme.hintColor, size: 32),
      ),
    );
  }

  Widget _buildGlassTitleOverlay(BuildContext ctx) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 32, 10, 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.5),
                Colors.black.withValues(alpha: 0.85),
              ]),
        ),
        child: Text(movie!.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(ctx).textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3)),
      ),
    );
  }
}
