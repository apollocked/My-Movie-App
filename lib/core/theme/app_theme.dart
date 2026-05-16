import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final baseDark = ThemeData.dark();
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.primaryGold,
      hintColor: AppColors.textSecondaryDark,
      cardColor: AppColors.darkSurfaceVariant,
      dividerColor: AppColors.darkBorder,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryGold,
        secondary: AppColors.secondaryAccent,
        surface: AppColors.darkSurface,
        surfaceContainer: AppColors.darkSurfaceVariant,
        error: AppColors.errorRed,
      ),
      textTheme:
          GoogleFonts.notoSansArabicTextTheme(baseDark.textTheme).copyWith(
        titleLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        titleMedium: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        bodyLarge: GoogleFonts.notoSansArabic(color: AppColors.textPrimaryDark),
        bodyMedium:
            GoogleFonts.notoSansArabic(color: AppColors.textSecondaryDark),
        labelLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        labelMedium:
            GoogleFonts.notoSansArabic(color: AppColors.textTertiaryDark),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.darkSurfaceVariant,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: AppColors.textSecondaryDark),
        prefixIconColor: AppColors.primaryGold,
        suffixIconColor: AppColors.textSecondaryDark,
      ),
    );
  }

  static ThemeData get lightTheme {
    final baseLight = ThemeData.light();
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.primaryGold,
      hintColor: AppColors.textSecondaryLight,
      cardColor: AppColors.lightSurface,
      dividerColor: AppColors.lightBorder,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryGold,
        secondary: AppColors.secondaryAccent,
        surface: AppColors.lightSurface,
        surfaceContainer: AppColors.lightSurfaceVariant,
        error: AppColors.errorRed,
      ),
      textTheme:
          GoogleFonts.notoSansArabicTextTheme(baseLight.textTheme).copyWith(
        titleLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        titleMedium: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge:
            GoogleFonts.notoSansArabic(color: AppColors.textPrimaryLight),
        bodyMedium:
            GoogleFonts.notoSansArabic(color: AppColors.textSecondaryLight),
        labelLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        labelMedium:
            GoogleFonts.notoSansArabic(color: AppColors.textTertiaryLight),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: AppColors.textSecondaryLight),
        prefixIconColor: AppColors.primaryGold,
        suffixIconColor: AppColors.textSecondaryLight,
      ),
    );
  }
}
