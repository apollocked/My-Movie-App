import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/widgets/press_scale.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';
import 'package:my_movie/features/movies/domain/entities/movie.dart';
import 'package:my_movie/features/movies/presentation/widgets/movie_poster_card.dart';

class RecommendationsSection extends StatelessWidget {
  final List<Movie> movies;

  const RecommendationsSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) return const SizedBox.shrink();
    final cardH = AppSizing.hp(context, 28).clamp(160.0, 260.0);
    final cardW = AppSizing.scale(context, 130).clamp(90.0, 170.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(Theme.of(context)),
        const SizedBox(height: 16),
        SizedBox(
          height: cardH,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: 20),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return PressScale(
                child: GestureDetector(
                  onTap: () =>
                      context.push('/movie/${movie.id}', extra: movie),
                  child: SizedBox(
                    width: cardW,
                    child: MoviePosterCard(height: cardH, movie: movie),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(ThemeData theme) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(t.movie_detail.you_might_also_like,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700))),
      ],
    );
  }
}
