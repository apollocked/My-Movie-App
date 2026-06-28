import 'package:flutter/material.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/core/theme/text/app_text_theme.dart';

class AppLightTheme {
  static ThemeData get theme => ThemeData(
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
        textTheme: AppTextTheme.light,
        cardTheme: const CardThemeData(
          color: AppColors.lightSurface,
          elevation: 0,
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lightSurfaceVariant,
          hintStyle: AppTextTheme.light.bodySmall,
          prefixIconColor: AppColors.primaryRed,
          suffixIconColor: AppColors.textSecondaryLight,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.lightBorder)),
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
            textStyle: AppTextTheme.light.labelLarge,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            side: const BorderSide(color: AppColors.lightBorder, width: 1.5),
            foregroundColor: AppColors.textPrimaryLight,
            textStyle: AppTextTheme.light.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.textSecondaryLight),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightBackground,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: AppColors.textPrimaryLight),
          titleTextStyle: AppTextTheme.light.titleLarge,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.primaryRed,
          unselectedItemColor: AppColors.textTertiaryLight,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.lightSurfaceVariant,
          labelStyle: AppTextTheme.light.labelSmall,
          selectedColor: AppColors.primaryRed.withValues(alpha: 0.12),
          side: const BorderSide(color: AppColors.lightBorder),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: CircleBorder(),
        ),
        dividerTheme: const DividerThemeData(color: AppColors.lightBorder, thickness: 1, space: 0),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      );
}
