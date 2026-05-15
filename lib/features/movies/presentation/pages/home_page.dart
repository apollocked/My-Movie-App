import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Premium Minimal App Bar
            SliverAppBar(
              floating: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                'CINEMA',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      letterSpacing: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_rounded),
                  onPressed: () {},
                ),
              ],
            ),

            // Content Layout List
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, 'New Movies'),
                    _buildPlaceholderCarousel(height: 280),
                    const SizedBox(height: 24),
                    _buildSectionTitle(context, 'Categories'),
                    _buildCategoryChips(),
                    const SizedBox(height: 24),
                    _buildSectionTitle(context, 'Upcoming Releases'),
                    _buildPlaceholderCarousel(height: 180),
                    const SizedBox(height: 24),
                    _buildSectionTitle(context, 'Recommendations'),
                    _buildPlaceholderCarousel(height: 180),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
      ),
    );
  }

  Widget _buildPlaceholderCarousel({required double height}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: height * 0.7,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.movie_creation_outlined,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['Action', 'Sci-Fi', 'Drama', 'Comedy', 'Horror'];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: index == 0,
              onSelected: (_) {},
            ),
          );
        },
      ),
    );
  }
}
