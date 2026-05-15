import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  const CategorySelector({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? const LinearGradient(
                      colors: [Color(0xFFD4AF37), Color(0xFFAA820A)])
                  : null,
              color: isSelected ? null : Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : Colors.white.withValues(alpha: 0.06)),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                    color: isSelected
                        ? Colors.black
                        : Colors.white.withValues(alpha: 0.7),
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}
