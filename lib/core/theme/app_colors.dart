import 'package:flutter/material.dart';

class AppColors {
  // Dark theme surfaces — deep cinematic black
  static const Color darkBackground = Color(0xFF07090F);
  static const Color darkSurface = Color(0xFF0F1219);
  static const Color darkSurfaceVariant = Color(0xFF161B28);
  static const Color darkBorder = Color(0xFF1F2535);
  static const Color darkElevated = Color(0xFF1C2335);

  // Light theme surfaces
  static const Color lightBackground = Color(0xFFF2F4F8);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFE8ECEF);
  static const Color lightBorder = Color(0xFFD5DAE6);
  static const Color lightElevated = Color(0xFFFFFFFF);

  // Brand — cinematic red as hero accent + gradient companion
  static const Color primaryRed = Color(0xFFE8445A);
  static const Color primaryOrange = Color(0xFFFF6B35);
  static const Color ratingGold = Color(0xFFFFB800);
  static const Color infoCyan = Color(0xFF00C2FF);
  static const Color warningAmber = Color(0xFFFF9500);
  static const Color successGreen = Color(0xFF34C759);
  static const Color errorRed = Color(0xFFFF3B30);
  static const Color accentPurple = Color(0xFF7B61FF);

  // Gradient helpers
  static const Gradient primaryGradient = LinearGradient(
    colors: [primaryRed, primaryOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient darkOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black87],
    stops: [0.3, 1.0],
  );

  // Action shortcuts
  static const Color favoriteRed = errorRed;
  static const Color watchLaterGreen = successGreen;
  static const Color ratingYellow = ratingGold;

  // Dark text scale
  static const Color textPrimaryDark = Color(0xFFF0F2F8);
  static const Color textSecondaryDark = Color(0xFF9BA3B8);
  static const Color textTertiaryDark = Color(0xFF5C6480);

  // Light text scale
  static const Color textPrimaryLight = Color(0xFF0D0F18);
  static const Color textSecondaryLight = Color(0xFF5A6175);
  static const Color textTertiaryLight = Color(0xFF8C93A8);

  // Glow shadows
  static List<BoxShadow> glowShadow(Color color, {double radius = 12}) => [
        BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: radius, offset: const Offset(0, 4)),
        BoxShadow(color: color.withValues(alpha: 0.15), blurRadius: radius * 2, offset: const Offset(0, 0)),
      ];

  // Status helpers
  static Color getOfflineIconColor(bool isDarkMode) => errorRed;

  static Color getOfflineBgColor(bool isDarkMode) =>
      errorRed.withValues(alpha: isDarkMode ? 0.15 : 0.10);

  static Color getInfoBgColor(bool isDarkMode) =>
      infoCyan.withValues(alpha: isDarkMode ? 0.12 : 0.08);

  static Color getInfoBorderColor(bool isDarkMode) =>
      infoCyan.withValues(alpha: isDarkMode ? 0.35 : 0.25);
}
