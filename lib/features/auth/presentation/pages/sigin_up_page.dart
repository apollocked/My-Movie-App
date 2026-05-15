import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/features/auth/presentation/widgets/custom_text_field.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_event.dart';
import '../blocs/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) context.go('/home');
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.message),
                    backgroundColor: theme.colorScheme.error),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Vault',
                      style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Sign up to track and sync your custom watchlist.',
                      style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 40),
                  customTextField(theme, isDark, 'Email', Icons.email_rounded,
                      _emailController),
                  const SizedBox(height: 16),
                  customTextField(theme, isDark, 'Password', Icons.lock_rounded,
                      _passwordController,
                      obscure: true),
                  const SizedBox(height: 16),
                  customTextField(theme, isDark, 'Confirm Password',
                      Icons.lock_outline_rounded, _confirmController,
                      obscure: true),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_passwordController.text !=
                                  _confirmController.text) {
                                return;
                              }
                              context.read<AuthBloc>().add(AuthSignUpSubmitted(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim()));
                            },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
