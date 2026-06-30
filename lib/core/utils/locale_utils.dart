import 'package:flutter/material.dart';

String getTmdbLanguageCode(Locale locale) {
  if (locale.languageCode == 'ar') return 'ar-SA';
  if (locale.languageCode == 'ku') return 'en-US';
  return 'en-US';
}
