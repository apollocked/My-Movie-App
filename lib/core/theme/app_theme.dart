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
        surfaceContainerHighest: AppColors.darkElevated,
        onSurface: AppColors.textPrimaryDark,
        onSurfaceVariant: AppColors.textSecondaryDark,
        outline: AppColors.darkBorder,
        error: AppColors.errorRed,
      ),
      textTheme: GoogleFonts.notoSansArabicTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.8,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.notoSansArabic(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.5,
        ),
        headlineLarge: GoogleFonts.notoSansArabic(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.3,
        ),
        headlineMedium: GoogleFonts.notoSansArabic(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimaryDark,
        ),
        titleLarge: GoogleFonts.notoSansArabic(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryDark,
          letterSpacing: -0.2,
        ),
        titleMedium: GoogleFonts.notoSansArabic(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        titleSmall: GoogleFonts.notoSansArabic(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondaryDark,
        ),
        bodyLarge: GoogleFonts.notoSansArabic(
          fontSize: 16,
          color: AppColors.textPrimaryDark,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.notoSansArabic(
          fontSize: 14,
          color: AppColors.textSecondaryDark,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.notoSansArabic(
          fontSize: 12,
          color: AppColors.textTertiaryDark,
        ),
        labelLarge: GoogleFonts.notoSansArabic(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
          letterSpacing: 0.5,
        ),
        labelMedium: GoogleFonts.notoSansArabic(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textTertiaryDark,
          letterSpacing: 0.3,
        ),
        labelSmall: GoogleFonts.notoSansArabic(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.textTertiaryDark,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.darkSurfaceVariant,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        hintStyle: const TextStyle(color: AppColors.textTertiaryDark),
        prefixIconColor: AppColors.primaryRed,
        suffixIconColor: AppColors.textSecondaryDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0,
          backgroundColor: AppColors.primaryRed,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          side: const BorderSide(color: AppColors.darkBorder, width: 1.5),
          foregroundColor: AppColors.textPrimaryDark,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondaryDark),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textPrimaryDark),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryDark,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primaryRed,
        unselectedItemColor: AppColors.textTertiaryDark,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurfaceVariant,
        labelStyle: const TextStyle(color: AppColors.textSecondaryDark),
        selectedColor: AppColors.primaryRed.withValues(alpha: 0.15),
        side: const BorderSide(color: AppColors.darkBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: CircleBorder(),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.darkBorder,
        thickness: 1,
        space: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
        surfaceContainerHighest: AppColors.lightSurface,
        onSurface: AppColors.textPrimaryLight,
        onSurfaceVariant: AppColors.textSecondaryLight,
        outline: AppColors.lightBorder,
        error: AppColors.errorRed,
      ),
      textTheme: GoogleFonts.notoSansArabicTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          color: AppColors.textPrimaryLight,
          letterSpacing: -0.8,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.notoSansArabic(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimaryLight,
          letterSpacing: -0.5,
        ),
        headlineLarge: GoogleFonts.notoSansArabic(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryLight,
          letterSpacing: -0.3,
        ),
        headlineMedium: GoogleFonts.notoSansArabic(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: GoogleFonts.notoSansArabic(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimaryLight,
          letterSpacing: -0.2,
        ),
        titleMedium: GoogleFonts.notoSansArabic(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        titleSmall: GoogleFonts.notoSansArabic(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondaryLight,
        ),
        bodyLarge: GoogleFonts.notoSansArabic(
          fontSize: 16,
          color: AppColors.textPrimaryLight,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.notoSansArabic(
          fontSize: 14,
          color: AppColors.textSecondaryLight,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.notoSansArabic(
          fontSize: 12,
          color: AppColors.textTertiaryLight,
        ),
        labelLarge: GoogleFonts.notoSansArabic(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
          letterSpacing: 0.5,
        ),
        labelMedium: GoogleFonts.notoSansArabic(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textTertiaryLight,
          letterSpacing: 0.3,
        ),
        labelSmall: GoogleFonts.notoSansArabic(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.textTertiaryLight,
          letterSpacing: 0.5,
        ),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurfaceVariant,
        hintStyle: const TextStyle(color: AppColors.textTertiaryLight),
        prefixIconColor: AppColors.primaryRed,
        suffixIconColor: AppColors.textSecondaryLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0,
          backgroundColor: AppColors.primaryRed,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          side: const BorderSide(color: AppColors.lightBorder, width: 1.5),
          foregroundColor: AppColors.textPrimaryLight,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondaryLight),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimaryLight,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primaryRed,
        unselectedItemColor: AppColors.textTertiaryLight,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightSurfaceVariant,
        labelStyle: const TextStyle(color: AppColors.textSecondaryLight),
        selectedColor: AppColors.primaryRed.withValues(alpha: 0.12),
        side: const BorderSide(color: AppColors.lightBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryRed,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: CircleBorder(),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightBorder,
        thickness: 1,
        space: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
