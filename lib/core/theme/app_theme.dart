import 'package:flutter/material.dart';
import 'app_theme_dark.dart';
import 'app_theme_light.dart';

class AppTheme {
  static ThemeData get darkTheme => AppDarkTheme.theme;
  static ThemeData get lightTheme => AppLightTheme.theme;
}
