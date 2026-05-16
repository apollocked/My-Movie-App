import 'package:flutter/material.dart';

String getTmdbLanguageCode(Locale locale) {
  if (locale.languageCode == 'ar') return 'ar-SA';
  // Add other mappings if needed
  return 'en-US';
}
