import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_event.dart';
import 'package:my_movie/features/auth/presentation/blocs/auth_state.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/features/auth/presentation/widgets/auth_header.dart';
import 'package:my_movie/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:my_movie/features/auth/presentation/widgets/auth_navigation_links.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
                      title: t.auth.create_account,
                      subtitle: t.auth.join_us_subtitle,
                    ),
                    const SizedBox(height: 40),
                    AuthInputField(
                      controller: _emailController,
                      label: t.auth.email,
                      hint: t.auth.email_hint,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) return t.auth.errors.email_required;
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) return t.auth.errors.invalid_email;
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
                      onSuffixTap: () => setState(() => _obscurePassword = !_obscurePassword),
                      validator: (value) {
                        if (value?.isEmpty ?? true) return t.auth.errors.password_required;
                        if (value!.length < 6) return t.auth.errors.password_too_short;
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AuthInputField(
                      controller: _confirmPasswordController,
                      label: t.auth.confirm_password,
                      hint: t.auth.confirm_password_hint,
                      prefixIcon: Icons.lock_outline,
                      obscureText: _obscureConfirmPassword,
                      suffixIcon: _obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      onSuffixTap: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                      validator: (value) {
                        if (value?.isEmpty ?? true) return t.auth.errors.confirm_password_required;
                        if (value != _passwordController.text) return t.auth.errors.passwords_dont_match;
                        return null;
                      },
                    ),
                    const SizedBox(height: 28),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return AnimatedButton(
                          text: t.auth.create_account,
                          isLoading: state is AuthLoading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() != true) return;
                            context.read<AuthBloc>().add(
                                  SignupRequested(
                                    _emailController.text.trim(),
                                    _passwordController.text,
                                  ),
                            );
                          },
                        );
                      },
                    ),
                    AuthNavigationLinks(
                      primaryText: t.auth.already_account,
                      linkText: t.auth.login,
                      linkRoute: '/login',
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
