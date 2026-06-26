import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movie/core/theme/app_colors.dart';

class AppTextTheme {
  static TextTheme get dark => GoogleFonts.notoSansArabicTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(fontSize: 36, fontWeight: FontWeight.w900, color: AppColors.textPrimaryDark, letterSpacing: -0.8, height: 1.1),
        displayMedium: GoogleFonts.notoSansArabic(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textPrimaryDark, letterSpacing: -0.5),
        headlineLarge: GoogleFonts.notoSansArabic(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimaryDark, letterSpacing: -0.3),
        headlineMedium: GoogleFonts.notoSansArabic(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textPrimaryDark),
        titleLarge: GoogleFonts.notoSansArabic(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimaryDark, letterSpacing: -0.2),
        titleMedium: GoogleFonts.notoSansArabic(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark),
        titleSmall: GoogleFonts.notoSansArabic(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondaryDark),
        bodyLarge: GoogleFonts.notoSansArabic(fontSize: 16, color: AppColors.textPrimaryDark, height: 1.6),
        bodyMedium: GoogleFonts.notoSansArabic(fontSize: 14, color: AppColors.textSecondaryDark, height: 1.5),
        bodySmall: GoogleFonts.notoSansArabic(fontSize: 12, color: AppColors.textTertiaryDark),
        labelLarge: GoogleFonts.notoSansArabic(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimaryDark, letterSpacing: 0.5),
        labelMedium: GoogleFonts.notoSansArabic(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textTertiaryDark, letterSpacing: 0.3),
        labelSmall: GoogleFonts.notoSansArabic(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textTertiaryDark, letterSpacing: 0.5),
      );

  static TextTheme get light => GoogleFonts.notoSansArabicTextTheme(ThemeData.light().textTheme).copyWith(
        displayLarge: GoogleFonts.notoSansArabic(fontSize: 36, fontWeight: FontWeight.w900, color: AppColors.textPrimaryLight, letterSpacing: -0.8, height: 1.1),
        displayMedium: GoogleFonts.notoSansArabic(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textPrimaryLight, letterSpacing: -0.5),
        headlineLarge: GoogleFonts.notoSansArabic(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimaryLight, letterSpacing: -0.3),
        headlineMedium: GoogleFonts.notoSansArabic(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textPrimaryLight),
        titleLarge: GoogleFonts.notoSansArabic(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimaryLight, letterSpacing: -0.2),
        titleMedium: GoogleFonts.notoSansArabic(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
        titleSmall: GoogleFonts.notoSansArabic(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondaryLight),
        bodyLarge: GoogleFonts.notoSansArabic(fontSize: 16, color: AppColors.textPrimaryLight, height: 1.6),
        bodyMedium: GoogleFonts.notoSansArabic(fontSize: 14, color: AppColors.textSecondaryLight, height: 1.5),
        bodySmall: GoogleFonts.notoSansArabic(fontSize: 12, color: AppColors.textTertiaryLight),
        labelLarge: GoogleFonts.notoSansArabic(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight, letterSpacing: 0.5),
        labelMedium: GoogleFonts.notoSansArabic(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textTertiaryLight, letterSpacing: 0.3),
        labelSmall: GoogleFonts.notoSansArabic(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textTertiaryLight, letterSpacing: 0.5),
      );
}
