// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppColors {
  // Dark theme colors
  static const Color darkBackground = Color(0xFF0F1014);
  static const Color darkSurface = Color(0xFF1C1D24);
  static const Color darkSurfaceVariant = Color(0xFF262833);
  static const Color darkBorder = Color(0xFF323544);

  // Light theme colors
  static const Color lightBackground = Color(0xFFF4F6F9);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFE8ECEF);
  static const Color lightBorder = Color(0xFFDEE2E6);

  // Semantic colors
  static const Color primaryGold = Color(0xFFE50914);
  static const Color secondaryAccent = Color(0xFFFFC107);
  static const Color errorRed = Color(0xFFFF3B30);
  static const Color infoBlue = Color(0xFF0066CC);
  static const Color warningOrange = Color(0xFFFF9500);
  static const Color successGreen = Color(0xFF34C759);

  // Action colors
  static const Color favoriteRed = Color(0xFFFF3B30);
  static const Color watchLaterGreen = Color(0xFF34C759);
  static const Color ratingYellow = Color(0xFFFFD60A);

  // Text colors - Dark theme
  static const Color textPrimaryDark = Color(0xFFF8F9FA);
  static const Color textSecondaryDark = Color(0xFFA6A8B2);
  static const Color textTertiaryDark = Color(0xFF7A7D88);

  // Text colors - Light theme
  static const Color textPrimaryLight = Color(0xFF121212);
  static const Color textSecondaryLight = Color(0xFF6C757D);
  static const Color textTertiaryLight = Color(0xFF9CA3AF);

  // Status colors with opacity helpers
  static Color getOfflineIconColor(bool isDarkMode) {
    return isDarkMode ? errorRed : errorRed;
  }

  static Color getOfflineBgColor(bool isDarkMode) {
    return isDarkMode
        ? errorRed.withValues(alpha: 0.15)
        : errorRed.withOpacity(0.1);
  }

  static Color getInfoBgColor(bool isDarkMode) {
    return isDarkMode ? infoBlue.withOpacity(0.15) : infoBlue.withOpacity(0.1);
  }

  static Color getInfoBorderColor(bool isDarkMode) {
    return isDarkMode ? infoBlue.withOpacity(0.4) : infoBlue.withOpacity(0.3);
  }
}
