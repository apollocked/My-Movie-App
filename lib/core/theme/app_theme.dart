import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.primaryRed,
      hintColor: AppColors.textSecondaryDark,
      cardColor: AppColors.darkSurfaceVariant,
      dividerColor: AppColors.darkBorder,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryRed,
        secondary: AppColors.ratingGold,
        tertiary: AppColors.infoCyan,
        surface: AppColors.darkSurface,
        surfaceContainer: AppColors.darkSurfaceVariant,
        onSurface: AppColors.textPrimaryDark,
        onSurfaceVariant: AppColors.textSecondaryDark,
        outline: AppColors.darkBorder,
        error: AppColors.errorRed,
      ),
      textTheme: GoogleFonts.notoSansArabicTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.5,
        ),
        titleLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.2,
        ),
        titleMedium: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        bodyLarge: GoogleFonts.notoSansArabic(
          color: AppColors.textPrimaryDark,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.notoSansArabic(
          color: AppColors.textSecondaryDark,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        labelMedium: GoogleFonts.notoSansArabic(
          color: AppColors.textTertiaryDark,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.darkSurfaceVariant,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        hintStyle: const TextStyle(color: AppColors.textTertiaryDark),
        prefixIconColor: AppColors.primaryRed,
        suffixIconColor: AppColors.textSecondaryDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondaryDark),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryDark,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.primaryRed,
        unselectedItemColor: AppColors.textTertiaryDark,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurfaceVariant,
        labelStyle: const TextStyle(color: AppColors.textSecondaryDark),
        side: const BorderSide(color: AppColors.darkBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.primaryRed,
      hintColor: AppColors.textSecondaryLight,
      cardColor: AppColors.lightSurface,
      dividerColor: AppColors.lightBorder,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryRed,
        secondary: AppColors.ratingGold,
        tertiary: AppColors.infoCyan,
        surface: AppColors.lightSurface,
        surfaceContainer: AppColors.lightSurfaceVariant,
        onSurface: AppColors.textPrimaryLight,
        onSurfaceVariant: AppColors.textSecondaryLight,
        outline: AppColors.lightBorder,
        error: AppColors.errorRed,
      ),
      textTheme: GoogleFonts.notoSansArabicTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
          letterSpacing: -0.5,
        ),
        titleLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
          letterSpacing: -0.2,
        ),
        titleMedium: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: GoogleFonts.notoSansArabic(
          color: AppColors.textPrimaryLight,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.notoSansArabic(
          color: AppColors.textSecondaryLight,
          height: 1.5,
        ),
        labelLarge: GoogleFonts.notoSansArabic(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        labelMedium: GoogleFonts.notoSansArabic(
          color: AppColors.textTertiaryLight,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurfaceVariant,
        hintStyle: const TextStyle(color: AppColors.textTertiaryLight),
        prefixIconColor: AppColors.primaryRed,
        suffixIconColor: AppColors.textSecondaryLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondaryLight),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryLight,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        selectedItemColor: AppColors.primaryRed,
        unselectedItemColor: AppColors.textTertiaryLight,
        elevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightSurfaceVariant,
        labelStyle: const TextStyle(color: AppColors.textSecondaryLight),
        side: const BorderSide(color: AppColors.lightBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
