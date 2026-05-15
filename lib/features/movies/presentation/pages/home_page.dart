import 'package:flutter/material.dart';
import '../widgets/movie_horizontal_list.dart';
import '../widgets/category_selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('CINEMA',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: const Color(0xFFD4AF37))),
              ),
              const CategorySelector(
                  categories: ['Action', 'Sci-Fi', 'Drama', 'Thriller']),
              const SizedBox(height: 16),
              // Passing dummy empty structures for layout verification before hooking up BLoC values
              const MovieHorizontalList(title: 'Trending Today', movies: []),
              const SizedBox(height: 16),
              const MovieHorizontalList(
                  title: 'Upcoming Releases', movies: [], cardHeight: 160),
            ],
          ),
        ),
      ),
    );
  }
}
