import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_movies_app/i18n/strings.g.dart';
import 'package:my_movies_app/features/movies/presentation/widgets/empty_state_widget.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.not_found.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: EmptyStateWidget(
          icon: Icons.search_off_rounded,
          title: t.not_found.title_404,
          subtitle: t.not_found.subtitle,
          onAction: () => context.go('/'),
          actionLabel: t.not_found.return_home,
        ),
      ),
    );
  }
}
