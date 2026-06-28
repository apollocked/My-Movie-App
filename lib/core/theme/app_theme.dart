import 'package:flutter/material.dart';
import 'app_theme_dark.dart';
import 'app_theme_light.dart';

class AppTheme {
  static ThemeData _applyCustomFont(ThemeData baseTheme) {
    return baseTheme.copyWith(
      textTheme: baseTheme.textTheme.apply(fontFamily: 'sarkar'),
      primaryTextTheme: baseTheme.primaryTextTheme.apply(fontFamily: 'sarkar'),
    );
  }

  // Apply it to the dark theme
  static ThemeData get darkTheme => _applyCustomFont(AppDarkTheme.theme);

  // Apply it to the light theme
  static ThemeData get lightTheme => _applyCustomFont(AppLightTheme.theme);
}
