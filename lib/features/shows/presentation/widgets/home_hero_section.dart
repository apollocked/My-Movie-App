import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_state.dart';
import 'package:my_movie/features/movies/presentation/widgets/featured_movie_hero.dart';
import 'package:my_movie/features/movies/presentation/pages/shimmer_pages/hero_shimmer.dart';

class ShowHomeHeroSection extends StatelessWidget {
  const ShowHomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBloc, ShowState>(
      builder: (context, state) {
        if (state is ShowLoading) {
          return const HeroShimmer();
        }
        if (state is ShowLoaded && state.shows.isNotEmpty) {
          final m = state.shows.first;
          return FeaturedMovieHero(
              movie: m,
              onPlayPressed: () => context.push('/show/${m.id}?autoPlay=true', extra: m),
              onInfoPressed: () => context.push('/show/${m.id}', extra: m));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
