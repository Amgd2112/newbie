import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/models/models.dart';

class LanguageConfig {
  static Future<Locale> loadLocalization() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int languageCode = preferences.getInt('language') ?? 0;
    return _localeMap[Language.values.elementAt(languageCode)]!;
  }

  static Locale getLocalization(Language language) => _localeMap[language]!;

  static Future<void> setLocalization(Language language) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('language', Language.values.indexOf(language));
  }

  static const Map<Language, Locale> _localeMap = {
    Language.en: Locale('en'),
    Language.ar: Locale('ar'),
  };
}

LocalizationItem lookupLocalizationItem(BuildContext context, int languageKey) {
  switch (languageKey) {
    case 1:
      return LocalizationItem(
        title: AppLocalizations.of(context)?.settingsLanguagesArabicTitle,
        language: Language.ar,
      );

    default:
      return LocalizationItem(
        title: AppLocalizations.of(context)?.settingsLanguagesEnglishTitle,
        language: Language.en,
      );
  }
}
