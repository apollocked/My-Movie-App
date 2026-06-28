import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class AppTextTheme {
  static TextTheme get dark => GoogleFonts.notoSansArabicTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(fontSize: 44, fontWeight: FontWeight.w800, color: AppColors.textPrimaryDark, letterSpacing: -1.0, height: 1.1),
        displayMedium: GoogleFonts.notoSansArabic(fontSize: 36, fontWeight: FontWeight.w800, color: AppColors.textPrimaryDark, letterSpacing: -0.5, height: 1.15),
        headlineLarge: GoogleFonts.notoSansArabic(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.textPrimaryDark, letterSpacing: -0.3, height: 1.2),
        headlineMedium: GoogleFonts.notoSansArabic(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textPrimaryDark, letterSpacing: -0.2, height: 1.25),
        headlineSmall: GoogleFonts.notoSansArabic(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark, letterSpacing: -0.2, height: 1.3),
        titleLarge: GoogleFonts.notoSansArabic(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimaryDark, letterSpacing: -0.2, height: 1.3),
        titleMedium: GoogleFonts.notoSansArabic(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark, height: 1.4),
        titleSmall: GoogleFonts.notoSansArabic(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textSecondaryDark, height: 1.4),
        bodyLarge: GoogleFonts.notoSansArabic(fontSize: 22, color: AppColors.textPrimaryDark, height: 1.6),
        bodyMedium: GoogleFonts.notoSansArabic(fontSize: 20, color: AppColors.textSecondaryDark, height: 1.5),
        bodySmall: GoogleFonts.notoSansArabic(fontSize: 18, color: AppColors.textTertiaryDark, height: 1.5),
        labelLarge: GoogleFonts.notoSansArabic(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark, letterSpacing: 0.5),
        labelMedium: GoogleFonts.notoSansArabic(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textTertiaryDark, letterSpacing: 0.3),
        labelSmall: GoogleFonts.notoSansArabic(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textTertiaryDark, letterSpacing: 0.5),
      );

  static TextTheme get light => GoogleFonts.notoSansArabicTextTheme(ThemeData.light().textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(fontSize: 44, fontWeight: FontWeight.w800, color: AppColors.textPrimaryLight, letterSpacing: -1.0, height: 1.1),
        displayMedium: GoogleFonts.notoSansArabic(fontSize: 36, fontWeight: FontWeight.w800, color: AppColors.textPrimaryLight, letterSpacing: -0.5, height: 1.15),
        headlineLarge: GoogleFonts.notoSansArabic(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.textPrimaryLight, letterSpacing: -0.3, height: 1.2),
        headlineMedium: GoogleFonts.notoSansArabic(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textPrimaryLight, letterSpacing: -0.2, height: 1.25),
        headlineSmall: GoogleFonts.notoSansArabic(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight, letterSpacing: -0.2, height: 1.3),
        titleLarge: GoogleFonts.notoSansArabic(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimaryLight, letterSpacing: -0.2, height: 1.3),
        titleMedium: GoogleFonts.notoSansArabic(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight, height: 1.4),
        titleSmall: GoogleFonts.notoSansArabic(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textSecondaryLight, height: 1.4),
        bodyLarge: GoogleFonts.notoSansArabic(fontSize: 22, color: AppColors.textPrimaryLight, height: 1.6),
        bodyMedium: GoogleFonts.notoSansArabic(fontSize: 20, color: AppColors.textSecondaryLight, height: 1.5),
        bodySmall: GoogleFonts.notoSansArabic(fontSize: 18, color: AppColors.textTertiaryLight, height: 1.5),
        labelLarge: GoogleFonts.notoSansArabic(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight, letterSpacing: 0.5),
        labelMedium: GoogleFonts.notoSansArabic(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textTertiaryLight, letterSpacing: 0.3),
        labelSmall: GoogleFonts.notoSansArabic(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textTertiaryLight, letterSpacing: 0.5),
      );
}
