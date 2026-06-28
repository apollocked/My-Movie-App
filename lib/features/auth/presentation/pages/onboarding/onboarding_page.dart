// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movie/features/auth/presentation/widgets/onboarding/feature_card.dart';
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

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        const Color(0xFF0A0A0F),
                        const Color(0xFF0F0F1A),
                        const Color(0xFF1A0A1A),
                      ]
                    : [
                        const Color(0xFFF8F8FF),
                        const Color(0xFFF0F0FF),
                        const Color(0xFFFFF0F8),
                      ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  right: -80,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor
                          .withValues(alpha: isDark ? 0.08 : 0.06),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -60,
                  left: -60,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor
                          .withValues(alpha: isDark ? 0.05 : 0.04),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        OnboardingSettingsBar(isDark: isDark),
                        const Spacer(),
                        ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [
                              theme.primaryColor,
                              theme.primaryColor.withValues(alpha: 0.7),
                            ],
                          ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Text(
                            t.auth.welcome_title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 44,
                              letterSpacing: -1,
                              color: isDark ? Colors.white : Colors.black,
                              height: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        FeatureCard(
                          icon: Icons.explore_rounded,
                          color: theme.colorScheme.primary,
                          title: t.onboarding.features.browse.title,
                          description: t.onboarding.features.browse.desc,
                        ),
                        const SizedBox(height: 10),
                        FeatureCard(
                          icon: Icons.lightbulb_rounded,
                          color: AppColors.ratingGold,
                          title: t.onboarding.features.recommend.title,
                          description: t.onboarding.features.recommend.desc,
                        ),
                        const SizedBox(height: 10),
                        FeatureCard(
                          icon: Icons.favorite_rounded,
                          color: AppColors.favoriteRed,
                          title: t.onboarding.features.favorites.title,
                          description: t.onboarding.features.favorites.desc,
                        ),
                        const SizedBox(height: 10),
                        FeatureCard(
                          icon: Icons.bookmark_rounded,
                          color: AppColors.watchLaterGreen,
                          title: t.onboarding.features.watch_later.title,
                          description: t.onboarding.features.watch_later.desc,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          t.auth.onboarding_subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.5)
                                : Colors.black.withValues(alpha: 0.45),
                            height: 1.5,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        OnboardingButtons(
                          isDark: isDark,
                          onGetStarted: () => context.go('/login'),
                          onContinueAsGuest: () {
                            context
                                .read<AuthBloc>()
                                .add(const ContinueAsGuestRequested());
                            Future.microtask(() => context.go('/'));
                          },
                          getStartedText: t.auth.get_started,
                          continueGuestText: t.auth.continue_guest,
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
