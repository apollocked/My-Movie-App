import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:my_movies_app/core/localization/strings.g.dart';

class AuthPromptSheet extends StatelessWidget {
  final String actionMsg;

  const AuthPromptSheet({super.key, required this.actionMsg});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.lock_person_rounded, size: 64, color: Colors.orange),
          const SizedBox(height: 16),
          Text(t.movie_detail.prompts.login_required,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('${t.movie_detail.prompts.please_sign_in} $actionMsg.',
              textAlign: TextAlign.center),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            onPressed: () {
              Navigator.pop(context);
              context.go('/login');
            },
            child: Text(t.movie_detail.prompts.go_to_login,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  static void show(BuildContext context, String msg) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => AuthPromptSheet(actionMsg: msg),
    );
  }
}
