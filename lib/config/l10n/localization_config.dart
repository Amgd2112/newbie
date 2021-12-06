import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/models/models.dart';

abstract class LanguageConfig {
  static Future<Locale> loadLocalization() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String languageCode = preferences.getString('language') ?? 'en';

    for (MapEntry<Language, Locale> e in _localeMap.entries) {
      if (languageCode == e.value.languageCode) return e.value;
    }
    return _localeMap[Language.en]!;
  }

  static Locale getLocalization(Language language) => _localeMap[language]!;

  static Future<void> setLocalization(Language language) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('language', _localeMap[language]!.languageCode);
  }

  static const Map<Language, Locale> _localeMap = {
    Language.en: Locale('en'),
    Language.ar: Locale('ar'),
  };
}

LocalizationItem lookupLocalizationItem(BuildContext context, Language language) {
  switch (language) {
    case Language.ar:
      return LocalizationItem(
        title: AppLocalizations.of(context)?.settingsLanguagesArabicTitle,
        language: Language.ar,
      );

    case Language.en:
      return LocalizationItem(
        title: AppLocalizations.of(context)?.settingsLanguagesEnglishTitle,
        language: Language.en,
      );
  }
}
