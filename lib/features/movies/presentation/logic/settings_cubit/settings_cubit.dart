import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
            themeMode: ThemeMode.dark, locale: const Locale('en')));

  void toggleTheme() {
    final nextMode =
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(SettingsState(themeMode: nextMode, locale: state.locale));
  }

  void changeLanguage(String languageCode) {
    emit(SettingsState(
        themeMode: state.themeMode, locale: Locale(languageCode)));
  }
}
