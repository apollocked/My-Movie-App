import 'package:flutter/material.dart';

class AppStrings {
  static String getTitle(String key, Locale locale) {
    final isAr = locale.languageCode == 'ar';
    switch (key) {
      case 'Trending Now':
        return isAr ? 'الأكثر تداولاً' : 'Trending Now';
      case 'Top Rated Movies':
        return isAr ? 'الأعلى تقييماً' : 'Top Rated Movies';
      case 'Action Thrillers':
        return isAr ? 'أفلام حركة وإثارة' : 'Action Thrillers';
      case 'Sci-Fi Explorations':
        return isAr ? 'استكشافات الخيال العلمي' : 'Sci-Fi Explorations';
      case 'Horror & Suspense':
        return isAr ? 'رعب وتشويق' : 'Horror & Suspense';
      case 'EXPLORE':
        return isAr ? 'استكشف' : 'EXPLORE';
      case 'Search movies...':
        return isAr ? 'ابحث عن أفلام...' : 'Search movies...';
      case 'Your Watch Later':
        return isAr ? 'قائمة المشاهدة لاحقاً' : 'Your Watch Later';
      case 'My Activity':
        return isAr ? 'نشاطي' : 'My Activity';
      case 'Watch Later':
        return isAr ? 'شاهد لاحقاً' : 'Watch Later';
      case 'My Favorites':
        return isAr ? 'مفضلاتي' : 'My Favorites';
      case 'My Ratings':
        return isAr ? 'تقييماتي' : 'My Ratings';
      case 'Account':
        return isAr ? 'الحساب' : 'Account';
      case 'Log Out':
        return isAr ? 'تسجيل الخروج' : 'Log Out';
      case 'Setup':
        return isAr ? 'الإعدادات' : 'Setup';
      case 'Profile':
        return isAr ? 'الملف الشخصي' : 'Profile';
      case 'Cinema':
        return isAr ? 'السينما' : 'Cinema';
      case 'Language':
        return isAr ? 'اللغة' : 'Language';
      case 'Dark Mode':
        return isAr ? 'الوضع الليلي' : 'Dark Mode';
      default:
        return key;
    }
  }
}
