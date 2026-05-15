import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/movie_horizontal_list.dart';
import '../widgets/category_selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildAmbientBackground(),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const CategorySelector(
                      categories: ['Trending', 'Sci-Fi', 'Action', 'Drama']),
                  const SizedBox(height: 24),
                  const MovieHorizontalList(
                      title: 'Spotlight Screenings', movies: []),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmbientBackground() {
    return Positioned(
      top: -100,
      right: -50,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
        child: Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFD4AF37).withValues(alpha: 0.06),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('EXPLORE',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                  color: Colors.grey)),
          SizedBox(height: 4),
          Text('World of Cinema',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
