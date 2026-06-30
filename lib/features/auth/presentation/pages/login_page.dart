import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/translations.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/features/auth/presentation/widgets/auth_header.dart';
import 'package:my_movie/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:my_movie/features/auth/presentation/widgets/auth_navigation_links.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() != true) return;
    context.read<AuthBloc>().add(
          LoginRequested(
            _emailController.text.trim(),
            _passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.go('/');
          } else if (state is Unauthenticated && state.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
                backgroundColor: theme.colorScheme.error,
              ),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthHeader(
                      title: t.auth.welcome_back,
                      subtitle: t.auth.login_subtitle,
                    ),
                    const SizedBox(height: 40),
                    AuthInputField(
                      controller: _emailController,
                      label: t.auth.email,
                      hint: t.auth.email_hint,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return t.auth.errors.email_required;
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                          return t.auth.errors.invalid_email;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AuthInputField(
                      controller: _passwordController,
                      label: t.auth.password,
                      hint: t.auth.password_hint,
                      prefixIcon: Icons.lock_outline,
                      obscureText: _obscurePassword,
                      suffixIcon: _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      onSuffixTap: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return t.auth.errors.password_required;
                        }
                        if (value!.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                    child: AnimatedButton.text(
                      text: t.auth.reset_password,
                      onPressed: () => context.push('/forgot-password'),
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return AnimatedButton(
                          text: t.auth.login,
                          isLoading: state is AuthLoading,
                          onPressed: _handleLogin,
                        );
                      },
                    ),
                    AuthNavigationLinks(
                      primaryText: t.auth.no_account,
                      linkText: t.auth.signup,
                      linkRoute: '/signup',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
