import 'package:flutter/material.dart';
import 'movie_poster_card.dart';

class MovieHorizontalList extends StatelessWidget {
  final String title;
  final List<dynamic> movies;
  final double cardHeight;

  const MovieHorizontalList({
    super.key,
    required this.title,
    required this.movies,
    this.cardHeight = 260,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: cardHeight,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 5, // Temporary hardcoded length for display layout
            itemBuilder: (context, index) {
              return MoviePosterCard(height: cardHeight);
            },
          ),
        ),
      ],
    );
  }
}
