import 'package:flutter/material.dart';
import 'package:my_movie/core/network/api_client.dart';
import 'package:my_movie/features/movies/presentation/widgets/category_row.dart';

class ShowHomeCategoriesSection extends StatelessWidget {
  final ApiClient apiClient;

  const ShowHomeCategoriesSection({super.key, required this.apiClient});

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Top Rated',
      'Popular',
      'Airing Today',
      'On The Air',
      'Action',
      'Sci-Fi',
      'Drama',
      'Comedy',
      'Mystery',
      'Animation',
      'Reality',
    ];

    final endpoints = [
      '/tv/top_rated',
      '/tv/popular',
      '/tv/airing_today',
      '/tv/on_the_air',
      '/discover/tv?with_genres=10759',
      '/discover/tv?with_genres=10765',
      '/discover/tv?with_genres=18',
      '/discover/tv?with_genres=35',
      '/discover/tv?with_genres=9648',
      '/discover/tv?with_genres=16',
      '/discover/tv?with_genres=10764',
    ];
    return Column(
      children: List.generate(
          titles.length,
          (i) => CategoryRow(
              apiClient: apiClient, title: titles[i], endpoint: endpoints[i])),
    );
  }
}
