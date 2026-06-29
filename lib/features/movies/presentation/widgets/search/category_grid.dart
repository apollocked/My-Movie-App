import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/utils/responsive.dart';
import 'package:my_movie/features/movies/presentation/widgets/search/category_data.dart';

class CategoryGrid extends StatelessWidget {
  final List<CategoryData> items;
  final bool isDark;
  final double bottomPadding;

  const CategoryGrid(
      {super.key,
      required this.items,
      required this.isDark,
      this.bottomPadding = 0});

  static const _colors = [
    Color(0xFFE8445A),
    Color(0xFFFF6B35),
    Color(0xFF7B61FF),
    Color(0xFF2196F3),
    Color(0xFF4CAF50),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFF00BCD4),
    Color(0xFFFF5722),
    Color(0xFFE91E63),
    Color(0xFF3F51B5),
    Color(0xFF009688),
    Color(0xFF673AB7),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 100),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppSizing.gridColumns(context, mobile: 3, tablet: 4, desktop: 5).toInt(),
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, i) {
        final cat = items[i];
        final color = _colors[i % _colors.length];
        return GestureDetector(
          onTap: () {
            final encoded = Uri.encodeComponent(cat.endpoint);
            context.push('/see-all/$encoded', extra: cat.title);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurface.withValues(alpha: 0.6)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: isDark
                      ? AppColors.darkBorder.withValues(alpha: 0.3)
                      : AppColors.lightBorder.withValues(alpha: 0.6)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: color.withValues(alpha: isDark ? 0.2 : 0.12),
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(cat.icon, color: color, size: 20),
                ),
                const SizedBox(height: 6),
                Flexible(
                  child: Text(cat.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700)),
                ),
                Text(cat.subtitle,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight)),
              ],
            ),
          ),
        );
      },
    );
  }
}
