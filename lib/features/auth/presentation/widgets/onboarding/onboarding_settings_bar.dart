import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'dart:ui';

class OnboardingSettingsBar extends StatelessWidget {
  final bool isDark;

  const OnboardingSettingsBar({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: 0.06)
                : Colors.black.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.08)
                  : Colors.black.withValues(alpha: 0.08),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.read<SettingsCubit>().toggleTheme(),
                icon: Icon(
                  isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.7)
                      : Colors.black.withValues(alpha: 0.7),
                ),
              ),
              DropdownButton<String>(
                value: Localizations.localeOf(context).languageCode,
                underline: const SizedBox(),
                icon: Icon(Icons.language_rounded, size: 20,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.7)
                        : Colors.black.withValues(alpha: 0.7)),
                dropdownColor: isDark ? const Color(0xFF1C1C1E) : Colors.white,
                style: TextStyle(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.7)
                      : Colors.black.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                items: [
                  DropdownMenuItem(value: 'en', child: Text(t.settings.lang_en)),
                  DropdownMenuItem(value: 'ku', child: Text(t.settings.lang_ku)),
                  DropdownMenuItem(value: 'ar', child: Text(t.settings.lang_ar)),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.read<SettingsCubit>().changeLanguage(value);
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
