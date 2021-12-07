import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../modules.dart';

class NewbieDrawer extends StatelessWidget {
  final NavigationItem navigationItem;
  const NewbieDrawer({
    Key? key,
    required this.navigationItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: null),
          ...[
            NavigationDestination.home,
            NavigationDestination.statistics,
            NavigationDestination.notes,
            NavigationDestination.roadmap,
          ].map((dynamic destination) {
            return DrawerListTile(
              navigationItem: lookupNavigationItem(context, destination),
              selected: navigationItem.destination == destination,
              onTap: () {
                NewbieRouter.replacePage(context, destination);
              },
            );
          }),
          const Divider(),
          DrawerListTile(
            navigationItem: lookupNavigationItem(context, NavigationDestination.deleted),
            selected: navigationItem.destination == NavigationDestination.deleted,
            onTap: () {
              NewbieRouter.replacePage(context, NavigationDestination.deleted);
            },
          ),
          DrawerListTile(
            navigationItem: lookupNavigationItem(context, NavigationDestination.settings),
            selected: navigationItem.destination == NavigationDestination.settings,
            onTap: () {
              Navigator.pop(context);
              NewbieRouter.pushSlidePage(context, NavigationDestination.settings, AxisDirection.left);
            },
          ),
        ],
      ),
    );
  }
}
