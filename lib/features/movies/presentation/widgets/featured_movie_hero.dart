import 'package:flutter/material.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'hero_action_chip.dart';

class FeaturedMovieHero extends StatelessWidget {
  final Movie? movie;
  final VoidCallback? onPlayPressed, onInfoPressed;

  const FeaturedMovieHero(
      {super.key, required this.movie, this.onPlayPressed, this.onInfoPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (movie == null) {
      return Container(
          height: 480,
          color: theme.cardColor,
          child: const Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'featured_poster_${movie!.id}',
            child: CachedNetworkImage(
              imageUrl: movie!.fullPosterUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              placeholder: (_, __) => Container(color: theme.cardColor),
              errorWidget: (_, __, ___) => Container(color: theme.cardColor),
            ),
          ),
          _buildGradient(isDark),
          _buildContent(context, theme, isDark),
        ],
      ),
    );
  }

  Widget _buildGradient(bool isDark) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Color(0xB007090F),
              Color(0xFF07090F),
            ],
            stops: [0.0, 0.3, 0.75, 1.0]),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ThemeData theme, bool isDark) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingBadge(theme),
            const SizedBox(height: 12),
            Text(movie!.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.displayMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w900)),
            const SizedBox(height: 6),
            Row(
              children: [
                _buildInfoChip(Icons.star_rounded, theme.colorScheme.secondary,
                    movie!.voteAverage.toStringAsFixed(1)),
                const SizedBox(width: 12),
                _buildInfoChip(Icons.calendar_month_rounded,
                    AppColors.textTertiaryDark,
                    movie!.releaseDate.split('-').first),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                HeroActionChip(
                    movie: movie!,
                    collection: 'favorites',
                    label: 'Favorite',
                    icon: Icons.favorite_rounded,
                    inactiveIcon: Icons.favorite_border_rounded,
                    activeColor: AppColors.favoriteRed),
                const SizedBox(width: 10),
                HeroActionChip(
                    movie: movie!,
                    collection: 'watch_later',
                    label: 'Watch',
                    icon: Icons.bookmark_rounded,
                    inactiveIcon: Icons.bookmark_add_outlined,
                    activeColor: AppColors.watchLaterGreen),
                const Spacer(),
                _buildGradientPlayButton(theme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBadge(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: theme.colorScheme.secondary.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded,
              color: theme.colorScheme.secondary, size: 14),
          const SizedBox(width: 4),
          Text('TOP RATED',
              style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2)),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(text,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontWeight: FontWeight.w600,
                fontSize: 13)),
      ],
    );
  }

  Widget _buildGradientPlayButton(ThemeData theme) {
    return GestureDetector(
      onTap: onPlayPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(30),
          boxShadow: AppColors.glowShadow(AppColors.primaryRed, radius: 16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 22),
            const SizedBox(width: 6),
            const Text('Play Trailer',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
