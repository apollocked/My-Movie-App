import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'pill_tab.dart';

class ContentTypePill extends StatelessWidget {
  const ContentTypePill({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.watch<ContentTypeCubit>().state;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          PillTab(
            label: t.search.filters.movies,
            isSelected: current == ContentType.movies,
            onTap: () =>
                context.read<ContentTypeCubit>().select(ContentType.movies),
          ),
          const SizedBox(width: 10),
          PillTab(
            label: t.search.filters.tv_shows,
            isSelected: current == ContentType.shows,
            onTap: () =>
                context.read<ContentTypeCubit>().select(ContentType.shows),
          ),
        ],
      ),
    );
  }
}
