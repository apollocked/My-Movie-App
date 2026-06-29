import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_bloc.dart';
import 'package:my_movie/features/movies/presentation/blocs/movie_bloc/movie_state.dart';
import 'package:my_movie/features/movies/presentation/widgets/hero_slider.dart';
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
          return HeroSlider(
            movies: state.movies,
            route: (m) => '/movie/${m.id}',
            autoPlayRoute: (m) => '/movie/${m.id}?autoPlay=true',
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
