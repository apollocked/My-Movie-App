import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';
import 'dart:ui';

class OnboardingSettingsBar extends StatelessWidget {
  final bool isDark;
  final SettingsState settingsState;
  final SettingsCubit settingsCubit;

  const OnboardingSettingsBar({
    super.key,
    required this.isDark,
    required this.settingsState,
    required this.settingsCubit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.cardColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => settingsCubit.toggleTheme(),
                icon: Icon(
                  isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                  color: Colors.white,
                ),
              ),
              DropdownButton<String>(
                value: settingsState.locale.languageCode,
                underline: const SizedBox(),
                icon: const Icon(Icons.language_rounded, size: 20, color: Colors.white),
                dropdownColor: theme.cardColor,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                items: [
                  DropdownMenuItem(value: 'en', child: Text(t.settings.lang_en)),
                  DropdownMenuItem(value: 'ku', child: Text(t.settings.lang_ku)),
                  DropdownMenuItem(value: 'ar', child: Text(t.settings.lang_ar)),
                ],
                onChanged: (value) {
                  if (value != null) {
                    settingsCubit.changeLanguage(value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
