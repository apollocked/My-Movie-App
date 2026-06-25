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
          height: 450,
          color: theme.cardColor,
          child: const Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
      height: 480,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: 'poster_${movie!.id}',
            child: CachedNetworkImage(
              imageUrl: movie!.fullPosterUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              placeholder: (_, __) => Container(color: theme.cardColor),
              errorWidget: (_, __, ___) => Container(color: theme.cardColor),
            ),
          ),
          _buildGradient(isDark, theme),
          _buildContent(context, theme, isDark),
        ],
      ),
    );
  }

  Widget _buildGradient(bool isDark, ThemeData theme) {
    final bg = isDark ? theme.scaffoldBackgroundColor : Colors.white;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              bg.withValues(alpha: 0.3),
              bg.withValues(alpha: 0.8),
              bg
            ],
            stops: const [
              0.4,
              0.7,
              0.9,
              1.0
            ]),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, ThemeData theme, bool isDark) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(movie!.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: isDark ? Colors.white : Colors.black87,
                    letterSpacing: 1.2)),
            const SizedBox(height: 8),
            _buildMetaRow(theme, isDark),
            const SizedBox(height: 16),
            _buildQuickActions(),
            const SizedBox(height: 16),
            _buildMainButtons(theme),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaRow(ThemeData theme, bool isDark) {
    final textStyle = TextStyle(
        color: isDark ? Colors.white70 : Colors.black54,
        fontWeight: FontWeight.bold);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star_rounded, color: theme.colorScheme.secondary, size: 18),
        const SizedBox(width: 4),
        Text(movie!.voteAverage.toStringAsFixed(1), style: textStyle),
        const SizedBox(width: 16),
        Text(movie!.releaseDate.split('-').first,
            style: textStyle.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeroActionChip(
            movie: movie!,
            uid: '',
            collection: 'favorites',
            label: 'Favorite',
            icon: Icons.favorite,
            inactiveIcon: Icons.favorite_border,
            activeColor: AppColors.favoriteRed),
        const SizedBox(width: 12),
        HeroActionChip(
            movie: movie!,
            uid: '',
            collection: 'watch_later',
            label: 'Watch Later',
            icon: Icons.bookmark,
            inactiveIcon: Icons.bookmark_add_outlined,
            activeColor: AppColors.watchLaterGreen),
      ],
    );
  }

  Widget _buildMainButtons(ThemeData theme) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton.icon(
                onPressed: onPlayPressed,
                icon: const Icon(Icons.play_arrow_rounded, size: 28),
                label: const Text('Play Trailer',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)))),
        const SizedBox(width: 16),
        Expanded(
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: onInfoPressed,
                icon: const Icon(Icons.info_outline_rounded),
                label: const Text('Details',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)))),
      ],
    );
  }
}
