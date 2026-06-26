import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/theme/text/app_text_theme.dart';

class AppDarkTheme {
  static ThemeData get theme => ThemeData(
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
        textTheme: AppTextTheme.dark,
        cardTheme: const CardThemeData(
          color: AppColors.darkSurfaceVariant,
          elevation: 0,
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.darkSurface,
          hintStyle: const TextStyle(color: AppColors.textTertiaryDark),
          prefixIconColor: AppColors.primaryRed,
          suffixIconColor: AppColors.textSecondaryDark,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.darkBorder)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.primaryRed, width: 1.5)),
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
          titleTextStyle: TextStyle(color: AppColors.textPrimaryDark, fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.3),
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
        dividerTheme: const DividerThemeData(color: AppColors.darkBorder, thickness: 1, space: 0),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      );
}
