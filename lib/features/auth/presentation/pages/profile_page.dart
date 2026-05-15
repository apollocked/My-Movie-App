import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_event.dart';
import '../blocs/auth_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Unauthenticated) context.go('/login');
          },
          builder: (context, state) {
            String email = "Guest User";
            if (state is Authenticated) {
              email = state.user.email;
            }

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: isDark
                        ? theme.colorScheme.surfaceContainer
                        : theme.cardColor,
                    child: Icon(Icons.person_rounded,
                        size: 50, color: theme.primaryColor),
                  ),
                  const SizedBox(height: 16),
                  Text(email,
                      style:
                          theme.textTheme.titleLarge?.copyWith(fontSize: 20)),
                  const Spacer(),
                  ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    tileColor: isDark
                        ? theme.colorScheme.surfaceContainer
                        : theme.cardColor,
                    leading: const Icon(Icons.logout_rounded,
                        color: Colors.redAccent),
                    title: const Text('Sign Out',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold)),
                    onTap: () =>
                        context.read<AuthBloc>().add(AuthLogoutRequested()),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
