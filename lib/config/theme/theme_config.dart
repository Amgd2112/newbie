import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/models/items/theme_item.dart';
import 'theme.dart';

abstract class ThemeConfig {
  static Future<ThemeMode> loadTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int themeCode = preferences.getInt('theme') ?? 0;

    return _themeMap[themeCode]!;
  }

  static ThemeMode getTheme(int themeCode) => _themeMap[themeCode]!;

  static Future<void> setTheme(int themeCode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('language', themeCode);
  }

  static const Map<int, ThemeMode> _themeMap = {
    0: ThemeMode.system,
    1: ThemeMode.light,
    2: ThemeMode.dark,
  };

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
