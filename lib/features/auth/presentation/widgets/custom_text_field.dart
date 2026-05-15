import 'package:flutter/material.dart';

Widget customTextField(ThemeData theme, bool isDark, String hint, IconData icon,
    TextEditingController controller,
    {bool obscure = false}) {
  return TextField(
    controller: controller,
    obscureText: obscure,
    style: TextStyle(color: theme.textTheme.bodyLarge?.color),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: theme.inputDecorationTheme.hintStyle,
      prefixIcon: Icon(icon, color: theme.inputDecorationTheme.prefixIconColor),
      filled: true,
      fillColor: isDark ? theme.colorScheme.surfaceContainer : theme.cardColor,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
  );
}
