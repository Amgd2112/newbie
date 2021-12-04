import 'package:flutter/material.dart';

import '../../modules/models/theme_item.dart';

class ThemeConfig {
  static const ThemeItem dark = ThemeItem(
    title: 'Dark Mode',
    subtitle: 'Change the default app theme to dark.',
    mode: ThemeMode.dark,
  );

  static const ThemeItem light = ThemeItem(
    title: 'Light Mode',
    subtitle: 'Or, to light.',
    mode: ThemeMode.light,
  );

  static const ThemeItem system = ThemeItem(
    title: 'System Mode',
    subtitle: 'You can use the system mode instead.',
    mode: ThemeMode.system,
  );

  static ThemeItem getThemeItem(int key) {
    switch (key) {
      case 0:
        return dark;
      case 1:
        return light;
      default:
        return system;
    }
  }
}
