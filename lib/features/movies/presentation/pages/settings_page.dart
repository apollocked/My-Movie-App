import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsCubit = context.read<SettingsCubit>();
    final currentSettings = context.watch<SettingsCubit>().state;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text('SETTINGS',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: theme.textTheme.displayLarge?.color)),
            const SizedBox(height: 24),
            _buildSettingsTile(
              theme: theme,
              icon: Icons.translate_rounded,
              title: 'App Language',
              value: currentSettings.locale.languageCode.toUpperCase(),
              onTap: () {
                final code = currentSettings.locale.languageCode;
                settingsCubit.changeLanguage(
                    code == 'en' ? 'ku' : (code == 'ku' ? 'ar' : 'en'));
              },
            ),
            _buildSettingsTile(
              theme: theme,
              icon: isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              title: 'OLED Display Mode',
              value: isDark ? 'Enabled' : 'Disabled',
              onTap: () => settingsCubit.toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.dividerColor),
          boxShadow: theme.brightness == Brightness.dark
              ? []
              : [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2))
                ]),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: theme.primaryColor),
        title: Text(title,
            style: TextStyle(
                color: theme.textTheme.displayLarge?.color,
                fontWeight: FontWeight.w600,
                fontSize: 14)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: TextStyle(color: theme.hintColor, fontSize: 13)),
            Icon(Icons.chevron_right_rounded, color: theme.hintColor, size: 20),
          ],
        ),
      ),
    );
  }
}
