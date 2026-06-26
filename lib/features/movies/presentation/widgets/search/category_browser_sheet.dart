import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/presentation/widgets/search/category_data.dart';
import 'package:my_movie/features/movies/presentation/widgets/search/category_grid.dart';

class CategoryBrowserSheet extends StatefulWidget {
  const CategoryBrowserSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const CategoryBrowserSheet(),
    );
  }

  @override
  State<CategoryBrowserSheet> createState() => _CategoryBrowserSheetState();
}

class _CategoryBrowserSheetState extends State<CategoryBrowserSheet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final bottomPad = MediaQuery.of(context).padding.bottom;

    final movieCats = [
      CategoryData(t.home.top_rated, '/movie/top_rated', Icons.trending_up_rounded, 'Movies'),
      CategoryData(t.home.now_playing, '/movie/now_playing', Icons.play_circle_outline_rounded, 'Movies'),
      CategoryData(t.home.popular, '/movie/popular', Icons.whatshot_rounded, 'Movies'),
      CategoryData(t.home.upcoming, '/movie/upcoming', Icons.calendar_month_rounded, 'Movies'),
      CategoryData(t.home.action, '/discover/movie?with_genres=28', Icons.flash_on_rounded, 'Movies'),
      CategoryData(t.home.sci_fi, '/discover/movie?with_genres=878', Icons.rocket_launch_rounded, 'Movies'),
      CategoryData(t.home.horror, '/discover/movie?with_genres=27', Icons.dangerous_rounded, 'Movies'),
      CategoryData(t.home.drama, '/discover/movie?with_genres=18', Icons.theater_comedy_rounded, 'Movies'),
      CategoryData(t.home.comedy, '/discover/movie?with_genres=35', Icons.sentiment_satisfied_rounded, 'Movies'),
      CategoryData(t.home.romance, '/discover/movie?with_genres=10749', Icons.favorite_rounded, 'Movies'),
      CategoryData(t.home.thriller, '/discover/movie?with_genres=53', Icons.visibility_rounded, 'Movies'),
      CategoryData(t.home.animation, '/discover/movie?with_genres=16', Icons.animation_rounded, 'Movies'),
      CategoryData(t.home.mystery, '/discover/movie?with_genres=9648', Icons.search_outlined, 'Movies'),
    ];

    final tvCats = [
      CategoryData('Popular', '/tv/popular', Icons.whatshot_rounded, 'TV Shows'),
      CategoryData('Top Rated', '/tv/top_rated', Icons.trending_up_rounded, 'TV Shows'),
      CategoryData('Airing Today', '/tv/airing_today', Icons.today_rounded, 'TV Shows'),
      CategoryData('On The Air', '/tv/on_the_air', Icons.live_tv_rounded, 'TV Shows'),
      CategoryData('Action', '/discover/tv?with_genres=10759', Icons.flash_on_rounded, 'TV Shows'),
      CategoryData('Comedy', '/discover/tv?with_genres=35', Icons.sentiment_satisfied_rounded, 'TV Shows'),
      CategoryData('Drama', '/discover/tv?with_genres=18', Icons.theater_comedy_rounded, 'TV Shows'),
      CategoryData('Sci-Fi & Fantasy', '/discover/tv?with_genres=10765', Icons.rocket_launch_rounded, 'TV Shows'),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Browse All', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32, height: 32,
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkBorder.withValues(alpha: 0.5) : AppColors.lightBorder,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.close_rounded, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface.withValues(alpha: 0.6) : AppColors.lightSurface.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TabBar(
                  indicator: BoxDecoration(gradient: AppColors.primaryGradient, borderRadius: BorderRadius.circular(14)),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  dividerColor: Colors.transparent,
                  tabs: const [Tab(text: 'Movies'), Tab(text: 'TV Shows')],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                children: [
                  CategoryGrid(items: movieCats, isDark: isDark, bottomPadding: bottomPad),
                  CategoryGrid(items: tvCats, isDark: isDark, bottomPadding: bottomPad),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
