import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movies_app/features/auth/presentation/blocs/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AuthGuest) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle_outlined,
                        size: 80, color: theme.hintColor),
                    const SizedBox(height: 16),
                    Text('Browsing as Guest',
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(
                      'Sign up or log in to access personalized features like ratings, watch lists, and saved movies.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.hintColor),
                    ),
                    const SizedBox(height: 32),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () => context.go('/login'),
                          child: const Text('Log In'),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            side: BorderSide(
                              color: theme.dividerColor,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () => context.go('/signup'),
                          child: const Text('Create Account'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 24),
                  Text('Welcome Back!', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 32),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.redAccent),
                    title: const Text('Logout Account',
                        style: TextStyle(color: Colors.redAccent)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.redAccent),
                    onTap: () {
                      context.read<AuthBloc>().add(const LogoutRequested());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
