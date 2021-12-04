import 'package:flutter/material.dart';

import 'enums/navigation_destination.dart';

class NavigationItem {
  final NavigationDestination destination;
  final String title;
  final IconData icon;

  const NavigationItem({
    required this.destination,
    required this.title,
    required this.icon,
  });
}
