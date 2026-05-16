import 'package:flutter/material.dart';

String getTmdbLanguageCode(Locale locale) {
  if (locale.languageCode == 'ar') return 'ar-SA';
  if (locale.languageCode == 'ku') return 'en-US'; // TMDB has limited Kurdish support, fallback to EN
  return 'en-US';
}
