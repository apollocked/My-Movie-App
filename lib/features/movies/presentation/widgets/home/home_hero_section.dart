import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_state.dart';
import 'package:my_movie/features/movies/presentation/widgets/featured_movie_hero.dart';
import 'package:my_movie/features/movies/presentation/pages/shimmer_pages/hero_shimmer.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const HeroShimmer();
        }
        if (state is MovieLoaded && state.movies.isNotEmpty) {
          final m = state.movies.first;
          return FeaturedMovieHero(
              movie: m,
              onPlayPressed: () => context.push('/movie/${m.id}?autoPlay=true', extra: m),
              onInfoPressed: () => context.push('/movie/${m.id}', extra: m));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
