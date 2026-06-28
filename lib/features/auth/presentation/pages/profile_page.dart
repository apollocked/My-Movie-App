import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/shows/presentation/cubit/content_type_cubit.dart';
import '../widgets/guest_profile_view.dart';
import '../widgets/profile_user_header.dart';
import '../widgets/profile_widgets.dart';
import '../widgets/profile_movie_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 6, height: 24,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(width: 12),
            Text(t.profile.title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is AuthGuest) return const GuestProfileView();
              if (state is Authenticated) {
                final user = state.user;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileUserHeader(theme: theme, email: user.email),
                      const SizedBox(height: 16),
                      ProfileSectionHeader(title: t.profile.my_activity),
                      const SizedBox(height: 16),
                      _ProfileContentTypePill(),
                      const SizedBox(height: 24),
                      ProfileMovieSection(
                        icon: Icons.bookmark_outline_rounded,
                        title: t.profile.watch_later,
                        collectionType: 'watch_later',
                        iconColor: AppColors.watchLaterGreen,
                      ),
                      const SizedBox(height: 8),
                      ProfileMovieSection(
                        icon: Icons.favorite_outline_rounded,
                        title: t.profile.my_favorites,
                        collectionType: 'favorites',
                        iconColor: AppColors.favoriteRed,
                      ),
                      const SizedBox(height: 8),
                      ProfileMovieSection(
                        icon: Icons.star_outline_rounded,
                        title: t.profile.my_ratings,
                        collectionType: 'ratings',
                        iconColor: Colors.amber,
                      ),
                      const SizedBox(height: 24),
                      ProfileSectionHeader(title: t.profile.account),
                      const SizedBox(height: 16),
                      ProfileTile(
                        icon: Icons.logout_rounded,
                        title: t.profile.logout,
                        isDestructive: true,
                        onTap: () => showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(t.profile.logout),
                            content: Text(t.profile.logout_confirm),
                            actions: [
                              AnimatedButton.text(
                                text: t.common.cancel,
                                onPressed: () => Navigator.of(ctx).pop(),
                                foregroundColor: theme.hintColor,
                              ),
                              AnimatedButton(
                                text: t.profile.logout,
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  context
                                      .read<AuthBloc>()
                                      .add(const LogoutRequested());
                                },
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: bottom + 120),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _ProfileContentTypePill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final current = context.watch<ContentTypeCubit>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _PillTab(
            label: t.search.filters.movies,
            isSelected: current == ContentType.movies,
            onTap: () =>
                context.read<ContentTypeCubit>().select(ContentType.movies),
          ),
          const SizedBox(width: 10),
          _PillTab(
            label: t.search.filters.tv_shows,
            isSelected: current == ContentType.shows,
            onTap: () =>
                context.read<ContentTypeCubit>().select(ContentType.shows),
          ),
        ],
      ),
    );
  }
}

class _PillTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PillTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 150,
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.dividerColor,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: isSelected
                ? Colors.white
                : theme.colorScheme.onSurface.withValues(alpha: 0.7),
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
