import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import '../../domain/entities/movie.dart';
import 'card_quick_actions.dart';
import 'card_rating_badge.dart';

class MoviePosterCard extends StatelessWidget {
  final double height;
  final Movie? movie;

  const MoviePosterCard({super.key, this.height = 260, this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final width = height * 0.68;

    return Container(
      width: width,
      margin: const EdgeInsetsDirectional.only(end: 16, bottom: 8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor),
        boxShadow: [
          BoxShadow(
              color: isDark ? Colors.black54 : Colors.black12,
              blurRadius: 12,
              offset: const Offset(0, 6))
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(child: _buildImage(isDark, theme)),
          if (movie != null) ...[
            _buildBottomTitle(),
            if (uid != null) CardQuickActions(movie: movie!, uid: uid),
          ],
          CardRatingBadge(
              movie: movie!,
              uid: uid,
              rating: movie?.voteAverage.toStringAsFixed(1) ?? '8.4'),
        ],
      ),
    );
  }

  Widget _buildImage(bool isDark, ThemeData theme) {
    final posterUrl =
        movie?.fullPosterUrl ??
        'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500';
    return Hero(
      tag: 'poster_${movie?.id ?? 0}',
      child: CachedNetworkImage(
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
      ),
    );
  }

  Widget _buildBottomTitle() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87, Colors.black]),
        ),
        child: Text(movie!.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
