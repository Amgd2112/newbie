import 'package:flutter/material.dart';

import '../../../config/routes/router.dart';
import '../../models/enums/navigation_destination.dart';

class FeedFloatingActionButton extends StatelessWidget {
  const FeedFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      heroTag: 'add-problem-tag',
      // tooltip: 'Add Problem',
      onPressed: () {
        NewbieRouter.pushSlidePage(
          context: context,
          destination: NavigationDestination.addProblem,
          direction: AxisDirection.right,
        );
      },
    );
  }
}
