import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
import '../../models/enums/navigation_destination.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      heroTag: 'add-problem-tag',
      onPressed: () {
        NewbieRouter.pushSlidePage(context, NavigationDestination.addProblem, AxisDirection.right);
      },
    );
  }
}
