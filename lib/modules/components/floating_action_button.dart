import 'package:flutter/cupertino.dart';

import '../modules.dart';

Widget? lookupFloatingActionButton(NavigationDestination destination) {
  if (destination == NavigationDestination.home) {
    return const HomeFloatingActionButton();
  }

  if (destination == NavigationDestination.notes) {
    return const NotesFloatingActionButton();
  }

  return null;
}
