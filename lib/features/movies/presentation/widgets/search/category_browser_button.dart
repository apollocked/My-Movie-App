import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.explore_rounded, color: Colors.white, size: 22),
                const SizedBox(width: 10),
                Text(t.search.browse_categories, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                const SizedBox(width: 8),
                const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 20),
              ],
            ),
            
          ),
        ),
      ),
    );

  }
}
