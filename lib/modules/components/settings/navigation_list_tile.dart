import 'package:flutter/material.dart';

import '../../../config/routes/routes.dart';
import '../../models/models.dart';

class NavigationListTile extends StatelessWidget {
  final NavigationDestination destination;

  const NavigationListTile({Key? key, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationItem item = RouteConfig.getNavigationItem(destination);
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20.0),
      dense: true,
      leading: Icon(item.icon),
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.button,
      ),
      onTap: () {
        NewbieRouter.pushSlidePage(
          context: context,
          destination: item.destination,
          direction: AxisDirection.left,
        );
      },
    );
  }
}
