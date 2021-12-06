import 'package:flutter/material.dart';

import '../models/items/navigation_item.dart';

AppBar mapAppBar({required NavigationItem navigationItem}) {
  return AppBar(
    title: Text(navigationItem.title),
  );
}
