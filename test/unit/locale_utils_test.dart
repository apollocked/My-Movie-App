import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_movie/core/utils/locale_utils.dart';

void main() {
  group('getTmdbLanguageCode', () {
    test('returns en-US for English locale', () {
      expect(getTmdbLanguageCode(const Locale('en')), 'en-US');
    });

    test('returns ar-SA for Arabic locale', () {
      expect(getTmdbLanguageCode(const Locale('ar')), 'ar-SA');
    });

    test('returns en-US for Kurdish locale', () {
      expect(getTmdbLanguageCode(const Locale('ku')), 'en-US');
    });
  });
}
