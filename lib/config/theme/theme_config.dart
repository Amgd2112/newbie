import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/models/items/theme_item.dart';
import 'theme.dart';

class ThemeConfig {
  static Future<ThemeMode> loadTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int themeCode = preferences.getInt('theme') ?? 0;
    return getTheme(themeCode);
  }

  static ThemeMode getTheme(int themeCode) => ThemeMode.values.elementAt(themeCode);

  static Future<void> setTheme(int themeCode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme', themeCode);
  }

  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;
}

ThemeItem lookupThemeItem(BuildContext context, int themeKey) {
  switch (themeKey) {
    case 2:
      return ThemeItem(
        title: AppLocalizations.of(context)?.settingsThemeDarkTitle,
        mode: ThemeMode.dark,
      );

    case 1:
      return ThemeItem(
        title: AppLocalizations.of(context)?.settingsThemeLightTitle,
        mode: ThemeMode.light,
      );

    default:
      return ThemeItem(
        title: AppLocalizations.of(context)?.settingsThemeSystemTitle,
        mode: ThemeMode.system,
      );
  }
}
