import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: 38,
      child: ListView.builder(
        padding: const EdgeInsetsDirectional.only(start: 16),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.fastOutSlowIn,
              margin: const EdgeInsetsDirectional.only(end: 10),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFFD4AF37), Color(0xFFAA820A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: isSelected
                    ? null
                    : (isDark
                        ? theme.colorScheme.surfaceContainer
                        : theme.cardColor),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? Colors.transparent : theme.dividerColor,
                ),
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isSelected
                        ? Colors.black
                        : theme.textTheme.bodyMedium?.color
                            ?.withValues(alpha: 0.7),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
