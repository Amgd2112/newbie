import 'package:flutter/material.dart';

import '../models/navigation_item.dart';

AppBar mapAppBar({required NavigationItem navigationItem}) {
  return AppBar(
    title: Text(navigationItem.title),
  );
}
