import 'package:flutter/material.dart';
import '../models/enum_navigation_name.dart';
import '../models/navigation_item.dart';
import '../../config/routes/router.dart';
import 'drawer_list_tile.dart';

class NewbieDrawer extends StatelessWidget {
  final NavigationItem navigationItem;
  const NewbieDrawer({Key? key, required this.navigationItem})
      : super(key: key);

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
            NavigationName.feed,
            NavigationName.statistics,
            NavigationName.notes,
            NavigationName.roadmap,
          ].map((dynamic name) {
            return DrawerListTile(
              navigationItem: NewbieRouter.mapNavigationItem(name),
              selected: navigationItem.name == name,
              onTap: () {
                NewbieRouter.replacePage(context: context, name: name);
              },
            );
          }),
          const Divider(),
          DrawerListTile(
            navigationItem: NewbieRouter.mapNavigationItem(
              NavigationName.deleted,
            ),
            selected: navigationItem.name == NavigationName.deleted,
            onTap: () {
              NewbieRouter.replacePage(
                context: context,
                name: NavigationName.deleted,
              );
            },
          ),
          DrawerListTile(
            navigationItem: NewbieRouter.mapNavigationItem(
              NavigationName.settings,
            ),
            selected: navigationItem.name == NavigationName.settings,
            onTap: () {
              Navigator.pop(context);
              NewbieRouter.pushSlidePage(
                context: context,
                name: NavigationName.settings,
                direction: AxisDirection.left,
              );
            },
          ),
        ],
      ),
    );
  }
}
