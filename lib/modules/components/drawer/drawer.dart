import 'package:flutter/material.dart';
import '../../../config/routes/routes_config.dart';

import 'drawer_list_tile.dart';

class NewbieDrawer extends StatelessWidget {
  const NewbieDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerListTile(
            title: 'Feed',
            icon: Icons.feed,
            destination: RouteNavigator.feed,
          ),
          DrawerListTile(
            title: 'Dashboard',
            icon: Icons.dashboard,
            destination: RouteNavigator.dashboard,
          ),
          Divider(),
          DrawerListTile(
            title: 'Newbie Big Notes',
            icon: Icons.note,
            destination: RouteNavigator.newbieBigNotes,
          ),
          DrawerListTile(
            title: 'Roadmap',
            icon: Icons.label_important_outline_rounded,
            destination: RouteNavigator.roadMap,
          ),
          Divider(),
          DrawerListTile(
            title: 'Settings & Acount',
            icon: Icons.settings,
            destination: RouteNavigator.settings,
          ),
          DrawerListTile(
            title: 'Aboute',
            icon: Icons.info_outline,
            destination: RouteNavigator.about,
          ),
        ],
      ),
    );
  }
}
