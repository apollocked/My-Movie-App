import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movie/common/widgets/animated_button.dart';
import 'package:my_movie/core/localization/strings.g.dart';

import 'forgot_password_header.dart';
import 'success_message_card.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetEmail() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      setState(() => _isSent = true);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? t.common.error_title),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        const ForgotPasswordHeader(),
        const SizedBox(height: 32),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: t.auth.email,
            hintText: t.auth.email_hint,
            prefixIcon: const Icon(Icons.email_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return t.auth.errors.email_required;
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) return t.auth.errors.invalid_email;
            return null;
          },
        ),
        const SizedBox(height: 24),
        AnimatedButton(
          text: t.auth.send_reset_link,
          onPressed: _isLoading ? null : _sendResetEmail,
          isLoading: _isLoading,
          height: 56,
        ),
        if (_isSent) ...[
          const SizedBox(height: 24),
          const SuccessMessageCard(),
        ],
        const SizedBox(height: 32),
        Center(
          child: AnimatedButton.text(
            text: t.auth.back_to_login,
            onPressed: () => context.pop(),
            foregroundColor: theme.primaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
