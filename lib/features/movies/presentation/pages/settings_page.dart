import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/i18n/strings.g.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsCubit = context.read<SettingsCubit>();
    final currentSettings = context.watch<SettingsCubit>().state;
    final isDark = currentSettings.themeMode == ThemeMode.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(t.settings.title,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: theme.textTheme.titleLarge?.color)),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.dividerColor)),
              child: ListTile(
                leading:
                    Icon(Icons.translate_rounded, color: theme.primaryColor),
                title: Text(t.settings.language,
                    style: TextStyle(
                        color: theme.textTheme.titleLarge?.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                trailing: SizedBox(
                  width: 100,
                  child: DropdownButton<String>(
                    value: currentSettings.locale.languageCode,
                    underline: const SizedBox(),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: theme.hintColor),
                    dropdownColor: theme.cardColor,
                    items: const [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'ku', child: Text('Kurdish')),
                      DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        settingsCubit.changeLanguage(value);
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: theme.dividerColor)),
              child: SwitchListTile(
                value: isDark,
                onChanged: (value) {
                  settingsCubit.toggleTheme();
                },
                activeTrackColor: theme.primaryColor.withValues(alpha: 0.5),
                activeThumbColor: theme.primaryColor,
                title: Text(t.settings.dark_mode,
                    style: TextStyle(
                        color: theme.textTheme.titleLarge?.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                secondary: Icon(
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: theme.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
