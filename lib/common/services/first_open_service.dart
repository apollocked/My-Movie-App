import 'package:flutter/material.dart';
import 'package:my_movie/common/widgets/what_to_watch_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstOpenService {
  static const _tipsSeenKey = 'first_open_tooltips_seen';
  static const _whatToWatchSeenKey = 'what_to_watch_dialog_seen';

  static Future<bool> hasSeenTooltips() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_tipsSeenKey) ?? false;
  }

  static Future<void> markTooltipsSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_tipsSeenKey, true);
  }

  static Future<bool> hasSeenWhatToWatchDialog() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_whatToWatchSeenKey) ?? false;
  }

  static Future<void> markWhatToWatchDialogSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_whatToWatchSeenKey, true);
  }

  static Future<void> showWhatToWatchDialog(BuildContext context) async {
    final seen = await hasSeenWhatToWatchDialog();
    if (seen) return;
    await markWhatToWatchDialogSeen();
    if (!context.mounted) return;

    await showDialog(
      context: context,
      builder: (_) => const WhatToWatchDialog(),
    );
  }
}
