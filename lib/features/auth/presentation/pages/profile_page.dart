import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movies_app/core/localization/strings.g.dart';
import 'package:my_movies_app/core/theme/app_colors.dart';
import '../widgets/guest_profile_view.dart';
import '../widgets/profile_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AuthGuest) return const GuestProfileView();
            if (state is Authenticated) {
              final user = state.user;
              return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                children: [
                  _buildUserHeader(theme, user.displayName, user.email),
                  const SizedBox(height: 48),
                  ProfileSectionHeader(title: t.profile.my_activity),
                  const SizedBox(height: 16),
                  ProfileTile(
                    icon: Icons.bookmark_outline_rounded,
                    title: t.profile.watch_later,
                    onTap: () => context.push('/collection/watch_later'),
                  ),
                  ProfileTile(
                    icon: Icons.favorite_outline_rounded,
                    title: t.profile.my_favorites,
                    onTap: () => context.push('/collection/favorites'),
                  ),
                  ProfileTile(
                    icon: Icons.star_outline_rounded,
                    title: t.profile.my_ratings,
                    onTap: () => context.push('/collection/ratings'),
                  ),
                  const SizedBox(height: 32),
                  ProfileSectionHeader(title: t.profile.account),
                  const SizedBox(height: 16),
                  ProfileTile(
                    icon: Icons.logout_rounded,
                    title: t.profile.logout,
                    isDestructive: true,
                    onTap: () =>
                        context.read<AuthBloc>().add(const LogoutRequested()),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
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
                  colors: [theme.primaryColor, AppColors.secondaryAccent]),
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
          Text(name ?? 'CineVault Moviegoer',
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(email,
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor)),
        ],
      ),
    );
  }
}
