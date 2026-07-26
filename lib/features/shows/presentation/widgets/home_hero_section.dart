import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_bloc.dart';
import 'package:my_movie/features/shows/presentation/blocs/show_bloc/show_state.dart';
import 'package:my_movie/features/movies/presentation/widgets/hero_slider.dart';
import 'package:my_movie/features/movies/presentation/pages/shimmer_pages/hero_shimmer.dart';
import 'package:my_movie/features/movies/presentation/widgets/empty_state_widget.dart';
import 'package:my_movie/core/localization/translations.dart';

class ShowHomeHeroSection extends StatelessWidget {
  const ShowHomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBloc, ShowState>(
      builder: (context, state) {
        if (state is ShowLoading) {
          return const HeroShimmer();
        }
        if (state is ShowError) {
          return EmptyStateWidget(
            icon: Icons.error_outline,
            title: t.common.error_title,
            subtitle: state.message,
          );
        }
        if (state is ShowLoaded && state.shows.isNotEmpty) {
          return HeroSlider(
            movies: state.shows,
            route: (m) => '/show/${m.id}',
            autoPlayRoute: (m) => '/show/${m.id}?autoPlay=true',
          );
        }
        return EmptyStateWidget(
          icon: Icons.tv_off_outlined,
          title: t.common.empty_list,
        );
      },
    );
  }
}
