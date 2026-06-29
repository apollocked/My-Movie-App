import 'package:flutter/material.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'hero_action_chip.dart';
import 'hero/hero_gradient_overlay.dart';
import 'hero/hero_rating_badge.dart';
import 'hero/hero_info_chip.dart';
import 'hero/hero_gradient_play_button.dart';
import 'release_countdown_badge.dart';

class FeaturedMovieHero extends StatelessWidget {
  final Movie? movie;
  final VoidCallback? onPlayPressed, onInfoPressed;

  const FeaturedMovieHero(
      {super.key, required this.movie, this.onPlayPressed, this.onInfoPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (movie == null) {
      return Container(
          color: theme.cardColor,
          child: const Center(child: CircularProgressIndicator()));
    }

    return Stack(
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
        const HeroGradientOverlay(),
        _buildContent(context, theme),
      ],
    );
  }


  Widget _buildContent(BuildContext context, ThemeData theme) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(AppSizing.safeHorizontal(context), 0, AppSizing.safeHorizontal(context), 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroRatingBadge(),
            const SizedBox(height: 12),
            Text(movie!.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.displayMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w900)),
            const SizedBox(height: 6),
            Row(
              children: [
                HeroInfoChip(
                    icon: Icons.star_rounded,
                    color: theme.colorScheme.secondary,
                    text: movie!.voteAverage.toStringAsFixed(1)),
                const SizedBox(width: 12),
                HeroInfoChip(
                    icon: Icons.calendar_month_rounded,
                    color: AppColors.textTertiaryDark,
                    text: movie!.releaseDate.split('-').first),
              ],
            ),
            if (ReleaseCountdownBadge.isUpcoming(movie!)) ...[
              const SizedBox(height: 10),
              ReleaseCountdownBadge(movie: movie!),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                HeroActionChip(
                    movie: movie!,
                    collection: 'favorites',
                    label: t.movie_detail.favorite,
                    
                    icon: Icons.favorite_rounded,
                    inactiveIcon: Icons.favorite_border_rounded,
                    activeColor: AppColors.favoriteRed),
                const SizedBox(width: 10),
                HeroActionChip(
                    movie: movie!,
                    collection: 'watch_later',
                    label: t.movie_detail.watch,
                    icon: Icons.bookmark_rounded,
                    inactiveIcon: Icons.bookmark_add_outlined,
                    activeColor: AppColors.watchLaterGreen),
                const Spacer(),
                HeroGradientPlayButton(onTap: onPlayPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
