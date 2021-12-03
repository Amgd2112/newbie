import 'package:flutter/material.dart';
import '../../config/routes/router.dart';
import '../models/enum_navigation_name.dart';

FloatingActionButton? mapFloatingActionButton({
  required BuildContext context,
  required NavigationName navigationName,
}) {
  switch (navigationName) {
    case NavigationName.feed:
      return FloatingActionButton(
        child: const Icon(Icons.add),
        heroTag: 'add-problem-tag',
        tooltip: 'Add Problem',
        onPressed: () {
          NewbieRouter.pushSlidePage(
            context: context,
            name: NavigationName.addProblem,
            direction: AxisDirection.right,
          );
        },
      );

    case NavigationName.notes:
      return FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.note_add),
      );

    default:
      return null;
  }
}
