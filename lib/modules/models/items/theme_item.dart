import 'package:flutter/material.dart';

import 'newbie_item.dart';

class ThemeItem extends NewbieItem {
  final ThemeMode mode;
  ThemeItem({required title, required this.mode}) : super(title: title, type: mode);
}
