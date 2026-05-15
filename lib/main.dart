import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Add Firebase.initializeApp() & GetIt setup here later
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cinema Local-First',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark, // Enforcing modern OLED look
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
