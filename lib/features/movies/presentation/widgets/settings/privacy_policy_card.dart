import 'package:flutter/material.dart';
import 'package:my_movie/core/localization/strings.g.dart';

class PrivacyPolicyCard extends StatelessWidget {
  final ThemeData theme;

  const PrivacyPolicyCard({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.5)),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.privacy_tip_rounded,
                color: theme.primaryColor, size: 22),
          ),
          title: Text(t.settings.privacy_policy,
              style: TextStyle(
                  color: theme.textTheme.titleLarge?.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          iconColor: theme.hintColor,
          collapsedIconColor: theme.hintColor,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.privacy.last_updated,
                      style: TextStyle(color: theme.hintColor, fontSize: 12)),
                  const SizedBox(height: 16),
                  _section(t.privacy.introduction, false),
                  const SizedBox(height: 20),
                  _section(t.privacy.info_collect_title, true),
                  const SizedBox(height: 8),
                  _section(t.privacy.info_collect, false),
                  const SizedBox(height: 20),
                  _section(t.privacy.how_use_title, true),
                  const SizedBox(height: 8),
                  _section(t.privacy.how_use, false),
                  const SizedBox(height: 20),
                  _section(t.privacy.data_security_title, true),
                  const SizedBox(height: 8),
                  _section(t.privacy.data_security, false),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(String text, bool isTitle) {
    if (isTitle) {
      return Text(text,
          style: TextStyle(
              color: theme.textTheme.titleLarge?.color,
              fontWeight: FontWeight.w700,
              fontSize: 15));
    }
    return Text(text,
        style: TextStyle(
            color: theme.textTheme.bodyMedium?.color,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.6));
  }
}
