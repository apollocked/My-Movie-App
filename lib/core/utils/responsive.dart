import 'package:flutter/material.dart';

class AppSizing {
  AppSizing._();

  static double w(BuildContext context) => MediaQuery.of(context).size.width;
  static double h(BuildContext context) => MediaQuery.of(context).size.height;

  static bool isMobile(BuildContext context) => w(context) < 600;
  static bool isTablet(BuildContext context) => w(context) >= 600 && w(context) < 1024;
  static bool isDesktop(BuildContext context) => w(context) >= 1024;

  static double wp(BuildContext context, double percent) => w(context) * percent / 100;
  static double hp(BuildContext context, double percent) => h(context) * percent / 100;

  static double gridColumns(BuildContext context, {int mobile = 2, int tablet = 3, int desktop = 4}) =>
      (isMobile(context) ? mobile : (isTablet(context) ? tablet : desktop)).toDouble();

  static double safeHorizontal(BuildContext context) =>
      w(context) > 600 ? w(context) * 0.08 : 20.0;

  static double scale(BuildContext context, double base) =>
      base * (w(context) / 390).clamp(0.85, 1.25);
}
