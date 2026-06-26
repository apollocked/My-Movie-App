import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';
import 'package:my_movie/features/auth/presentation/widgets/auth/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: Text(t.auth.reset_password)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ForgotPasswordForm(),
        ),
      ),
    );
  }
}
