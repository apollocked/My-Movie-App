import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/i18n/strings.g.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_cubit.dart';
import 'package:my_movies_app/features/movies/presentation/logic/settings_cubit/settings_state.dart';
import 'dart:ui'; // Required for ImageFilter (Glassmorphism)

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        final isDark = settingsState.themeMode == ThemeMode.dark;
        final settingsCubit = context.read<SettingsCubit>();

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Stack(
            children: [
              // 1. Cinematic Background Image
              Positioned.fill(
                child: Image.network(
                  // A placeholder cinematic collage (you can replace with a local asset)
                  'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070&auto=format&fit=crop',
                  fit: BoxFit.cover,
                ),
              ),

              // 2. Gradient Overlay (Darkens the bottom so text and buttons are readable)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.scaffoldBackgroundColor.withValues(alpha: 0.3),
                        theme.scaffoldBackgroundColor.withValues(alpha: 0.8),
                        theme.scaffoldBackgroundColor,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),

              // 3. Main Content
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // --- Top Settings Bar (Glassmorphism) ---
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: theme.cardColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.1)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Theme Toggle
                                IconButton(
                                  onPressed: () => settingsCubit.toggleTheme(),
                                  icon: Icon(
                                    isDark
                                        ? Icons.dark_mode_rounded
                                        : Icons.light_mode_rounded,
                                    color: Colors.white,
                                  ),
                                ),

                                // Language Dropdown
                                DropdownButton<String>(
                                  value: settingsState.locale.languageCode,
                                  underline: const SizedBox(),
                                  icon: const Icon(Icons.language_rounded,
                                      size: 20, color: Colors.white),
                                  dropdownColor: theme.cardColor,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'en', child: Text('EN')),
                                    DropdownMenuItem(
                                        value: 'ku', child: Text('KU')),
                                    DropdownMenuItem(
                                        value: 'ar', child: Text('AR')),
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
                      ),

                      // --- Center Text Content ---
                      Column(
                        children: [
                          Icon(
                            Icons.movie_creation_rounded,
                            size: 80,
                            color: theme.primaryColor,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            t.auth.welcome_title,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 36,
                              letterSpacing: 1.2,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              t.auth.onboarding_subtitle,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.white.withValues(alpha: 0.8),
                                height: 1.6,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40), // Spacer before buttons
                        ],
                      ),

                      // --- Bottom Buttons ---
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(60),
                              backgroundColor: theme.primaryColor,
                              foregroundColor: theme.colorScheme.onPrimary,
                              elevation: 8,
                              shadowColor:
                                  theme.primaryColor.withValues(alpha: 0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () => context.go('/login'),
                            child: Text(
                              t.auth.get_started,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1),
                            ),
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size.fromHeight(60),
                              side: const BorderSide(
                                  color: Colors.white, width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const ContinueAsGuestRequested());
                              context.go('/');
                            },
                            child: Text(
                              t.auth.continue_guest,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
