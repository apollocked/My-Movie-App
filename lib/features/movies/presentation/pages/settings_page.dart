import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    final currentSettings = context.watch<SettingsCubit>().state;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text('SETTINGS',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white)),
            const SizedBox(height: 24),

            // Language Control Tile
            _buildSettingsTile(
              icon: Icons.translate_rounded,
              title: 'App Language',
              value: currentSettings.locale.languageCode.toUpperCase(),
              onTap: () {
                // Quick trilingual toggle cycle: en -> ku -> ar -> en
                final code = currentSettings.locale.languageCode;
                if (code == 'en') {
                  settingsCubit.changeLanguage('ku');
                } else if (code == 'ku') {
                  settingsCubit.changeLanguage('ar');
                } else {
                  settingsCubit.changeLanguage('en');
                }
              },
            ),

            // Theme Mode Control Tile
            _buildSettingsTile(
              icon: currentSettings.themeMode == ThemeMode.dark
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded,
              title: 'OLED Display Mode',
              value: currentSettings.themeMode == ThemeMode.dark
                  ? 'Enabled'
                  : 'Disabled',
              onTap: () => settingsCubit.toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: const Color(0xFFD4AF37)),
        title: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value,
                style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const Icon(Icons.chevron_right_rounded,
                color: Colors.grey, size: 20),
          ],
        ),
      ),
    );
  }
}
