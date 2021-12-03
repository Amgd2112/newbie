import 'package:flutter/material.dart';
import 'enum_navigation_name.dart';

class NavigationItem {
  final bool header;
  final NavigationName name;
  final String title;
  final IconData icon;
  NavigationItem({
    required this.header,
    required this.name,
    required this.title,
    required this.icon,
  });
}
