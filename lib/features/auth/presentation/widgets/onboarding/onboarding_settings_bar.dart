import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
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
                ? AppColors.darkSurface.withValues(alpha: 0.8)
                : AppColors.lightSurface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark
                  ? AppColors.darkBorder
                  : AppColors.lightBorder,
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
                      ? AppColors.textPrimaryDark.withValues(alpha: 0.7)
                      : AppColors.textPrimaryLight.withValues(alpha: 0.7),
                ),
              ),
              DropdownButton<String>(
                value: Localizations.localeOf(context).languageCode,
                underline: const SizedBox(),
                icon: Icon(Icons.language_rounded, size: 20,
                    color: isDark
                        ? AppColors.textPrimaryDark.withValues(alpha: 0.7)
                        : AppColors.textPrimaryLight.withValues(alpha: 0.7)),
                dropdownColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? AppColors.textPrimaryDark.withValues(alpha: 0.7)
                      : AppColors.textPrimaryLight.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
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
