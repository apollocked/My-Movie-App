import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KurdishMaterialLocalizations extends DefaultMaterialLocalizations {
  const KurdishMaterialLocalizations();

  TextDirection get textDirection => TextDirection.rtl;
}

class KurdishCupertinoLocalizations extends DefaultCupertinoLocalizations {
  const KurdishCupertinoLocalizations();

  // CupertinoLocalizations doesn't have textDirection, it's handled by WidgetsLocalizations
}

class KurdishWidgetsLocalizations extends DefaultWidgetsLocalizations {
  const KurdishWidgetsLocalizations();

  @override
  TextDirection get textDirection => TextDirection.rtl;
}

class FallbackMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const KurdishMaterialLocalizations();

  @override
  bool shouldReload(FallbackMaterialLocalizationsDelegate old) => false;
}

class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async =>
      const KurdishCupertinoLocalizations();

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}

class FallbackWidgetsLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const FallbackWidgetsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ku';

  @override
  Future<WidgetsLocalizations> load(Locale locale) async =>
      const KurdishWidgetsLocalizations();

  @override
  bool shouldReload(FallbackWidgetsLocalizationsDelegate old) => false;
}
