import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movie/features/auth/presentation/widgets/onboarding/onboarding_buttons.dart';
import 'package:my_movie/features/auth/presentation/widgets/onboarding/onboarding_settings_bar.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_cubit.dart';
import 'package:my_movie/features/movies/presentation/blocs/settings_cubit/settings_state.dart';

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
              Positioned.fill(
                child: Image.network(
                  'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070&auto=format&fit=crop',
                  fit: BoxFit.cover,
                ),
              ),
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
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8),
                          OnboardingSettingsBar(
                            isDark: isDark,
                            settingsState: settingsState,
                            settingsCubit: settingsCubit,
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Icon(Icons.movie_creation_rounded, size: 80, color: theme.primaryColor),
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
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            ],
                          ),
                          const Spacer(),
                          OnboardingButtons(
                            onGetStarted: () => context.go('/login'),
                            onContinueAsGuest: () {
                              context.read<AuthBloc>().add(const ContinueAsGuestRequested());
                              context.go('/');
                            },
                            getStartedText: t.auth.get_started,
                            continueGuestText: t.auth.continue_guest,
                          ),
                        ],
                      ),
                    ),
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
