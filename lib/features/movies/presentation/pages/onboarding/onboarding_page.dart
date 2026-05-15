import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Your Personal Cinema',
      'body':
          'Discover thousands of movies and TV shows in stunning high fidelity.',
      'icon': 'movie_creation_rounded'
    },
    {
      'title': 'Curate Your Vault',
      'body':
          'Save your favorites, track your watchlist, and build your ultimate collection.',
      'icon': 'bookmark_added_rounded'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          index == 0
                              ? Icons.movie_creation_rounded
                              : Icons.bookmark_added_rounded,
                          size: 120,
                          color: theme.primaryColor,
                        ),
                        const SizedBox(height: 48),
                        Text(
                          _pages[index]['title']!,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge
                              ?.copyWith(fontSize: 28),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _pages[index]['body']!,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Navigation Row
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dot Indicators
                  Row(
                    children: List.generate(
                        _pages.length,
                        (index) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 8,
                              width: _currentPage == index ? 24 : 8,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? theme.primaryColor
                                    : theme.dividerColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            )),
                  ),

                  // Action Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.black, // Dark text on Gold button
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        context.go('/signup'); // Route to your Auth page
                      } else {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      }
                    },
                    child: Text(
                        _currentPage == _pages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
