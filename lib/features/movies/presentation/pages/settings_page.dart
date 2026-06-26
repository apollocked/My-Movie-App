import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';

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
            Row(
              children: [
                Container(
                  width: 6,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 14),
                Text(t.settings.title,
                    style: theme.textTheme.displayMedium),
              ],
            ),
            const SizedBox(height: 32),
            _buildGlassCard(
              theme,
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.translate_rounded,
                      color: theme.primaryColor, size: 22),
                ),
                title: Text(t.settings.language,
                    style: TextStyle(
                        color: theme.textTheme.titleLarge?.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: DropdownButton<String>(
                    value: currentSettings.locale.languageCode,
                    underline: const SizedBox(),
                    isDense: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: theme.hintColor, size: 20),
                    dropdownColor: theme.cardColor,
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
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildGlassCard(
              theme,
              child: SwitchListTile(
                value: isDark,
                onChanged: (value) {
                  settingsCubit.toggleTheme();
                },
                activeTrackColor: theme.primaryColor.withValues(alpha: 0.4),
                activeThumbColor: theme.primaryColor,
                inactiveTrackColor: AppColors.textTertiaryDark.withValues(alpha: 0.3),
                inactiveThumbColor: AppColors.textTertiaryDark,
                title: Text(t.settings.dark_mode,
                    style: TextStyle(
                        color: theme.textTheme.titleLarge?.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                secondary: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                      isDark
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                      color: theme.primaryColor,
                      size: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassCard(ThemeData theme, {required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: theme.dividerColor.withValues(alpha: 0.5)),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: child,
      ),
    );
  }
}
