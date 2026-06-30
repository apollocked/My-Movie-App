import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import 'pill_tab.dart';

class ContentTypePill extends StatelessWidget {
  const ContentTypePill({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.watch<ContentTypeCubit>().state;
    final labels = context.t.search.filters;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          PillTab(
            label: labels.movies,
            isSelected: current == ContentType.movies,
            onTap: () =>
                context.read<ContentTypeCubit>().select(ContentType.movies),
          ),
          const SizedBox(width: 10),
          PillTab(
            label: labels.tv_shows,
            isSelected: current == ContentType.shows,
            onTap: () =>
                context.read<ContentTypeCubit>().select(ContentType.shows),
          ),
        ],
      ),
    );
  }
}
