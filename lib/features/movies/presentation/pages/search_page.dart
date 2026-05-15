import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SEARCH',
                style: theme.textTheme.titleLarge?.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 16),

              // Polished Material 3 Embedded Input Field Container
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.brightness == Brightness.dark
                      ? theme.colorScheme.surfaceContainer
                      : theme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.dividerColor),
                  boxShadow: theme.brightness == Brightness.dark
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ],
                ),
                child: TextField(
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                  decoration: InputDecoration(
                    hintText: 'Search movies...',
                    hintStyle: theme.inputDecorationTheme.hintStyle,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: theme.inputDecorationTheme.prefixIconColor,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
