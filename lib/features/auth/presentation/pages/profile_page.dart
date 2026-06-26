import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie/core/theme/app_colors.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import '../widgets/guest_profile_view.dart';
import '../widgets/profile_widgets.dart';
import '../widgets/profile_movie_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
                      _buildUserHeader(theme, user.displayName, user.email),
                      const SizedBox(height: 48),
                      ProfileSectionHeader(title: t.profile.my_activity),
                      const SizedBox(height: 8),
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
                        onTap: () => context
                            .read<AuthBloc>()
                            .add(const LogoutRequested()),
                      ),
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

  Widget _buildUserHeader(ThemeData theme, String? name, String email) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [theme.primaryColor, AppColors.ratingGold]),
              boxShadow: [
                BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10))
              ],
            ),
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(name ?? t.profile.default_name,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(email,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.hintColor)),
        ],
      ),
    );
  }
}
