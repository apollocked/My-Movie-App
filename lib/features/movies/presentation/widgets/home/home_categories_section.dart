import 'package:flutter/material.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/features/movies/presentation/widgets/category_row.dart';

class HomeCategoriesSection extends StatelessWidget {
  final ApiClient apiClient;

  const HomeCategoriesSection({super.key, required this.apiClient});

  @override
  Widget build(BuildContext context) {
    final titles = [
      t.home.top_rated,
      t.home.now_playing,
      t.home.popular,
      t.home.upcoming,
      t.home.action,
      t.home.sci_fi,
      t.home.horror,
      t.home.drama,
      t.home.comedy,
      t.home.romance,
      t.home.thriller,
      t.home.animation,
      t.home.mystery,
    ];

    final endpoints = [
      '/movie/top_rated',
      '/movie/now_playing',
      '/movie/popular',
      '/movie/upcoming',
      '/discover/movie?with_genres=28',
      '/discover/movie?with_genres=878',
      '/discover/movie?with_genres=27',
      '/discover/movie?with_genres=18',
      '/discover/movie?with_genres=35',
      '/discover/movie?with_genres=10749',
      '/discover/movie?with_genres=53',
      '/discover/movie?with_genres=16',
      '/discover/movie?with_genres=9648',
    ];
    return Column(
      children: List.generate(
          titles.length,
          (i) => CategoryRow(
              apiClient: apiClient, title: titles[i], endpoint: endpoints[i])),
    );
  }
}
