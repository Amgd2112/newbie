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
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: null,
          ),
          ...[
            NavigationDestination.feed,
            NavigationDestination.statistics,
            NavigationDestination.notes,
            NavigationDestination.roadmap,
          ].map((dynamic destination) {
            return DrawerListTile(
              navigationItem: RouteConfig.getNavigationItem(destination),
              selected: navigationItem.destination == destination,
              onTap: () {
                NewbieRouter.replacePage(
                    context: context, destination: destination);
              },
            );
          }),
          const Divider(),
          DrawerListTile(
            navigationItem: RouteConfig.getNavigationItem(
              NavigationDestination.deleted,
            ),
            selected:
                navigationItem.destination == NavigationDestination.deleted,
            onTap: () {
              NewbieRouter.replacePage(
                context: context,
                destination: NavigationDestination.deleted,
              );
            },
          ),
          DrawerListTile(
            navigationItem: RouteConfig.getNavigationItem(
              NavigationDestination.settings,
            ),
            selected:
                navigationItem.destination == NavigationDestination.settings,
            onTap: () {
              Navigator.pop(context);
              NewbieRouter.pushSlidePage(
                context: context,
                destination: NavigationDestination.settings,
                direction: AxisDirection.left,
              );
            },
          ),
        ],
      ),
    );
  }
}
