import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'category_browser_sheet.dart';

class CategoryBrowserButton extends StatelessWidget {
  const CategoryBrowserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        child: GestureDetector(
          onTap: () => CategoryBrowserSheet.show(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppColors.glowShadow(AppColors.primaryRed, radius: 16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.explore_rounded, color: Colors.white, size: 22),
                SizedBox(width: 10),
                Text('Browse Categories', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
