import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
            themeMode: ThemeMode.dark, locale: const Locale('en'))) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('isDark') ?? true;
      final langCode = prefs.getString('lang') ?? 'en';
      
      emit(SettingsState(
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        locale: Locale(langCode),
      ));
    } catch (_) {
      // Keep defaults if failed
    }
  }

  void toggleTheme() async {
    final nextMode =
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(SettingsState(themeMode: nextMode, locale: state.locale));
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', nextMode == ThemeMode.dark);
  }

  void changeLanguage(String languageCode) async {
    emit(SettingsState(
        themeMode: state.themeMode, locale: Locale(languageCode)));
        
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', languageCode);
  }
}
