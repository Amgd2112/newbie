import 'package:flutter/material.dart';

import '../../models/items/navigation_item.dart';

class DrawerListTile extends StatelessWidget {
  final NavigationItem navigationItem;
  final bool selected;
  final void Function()? onTap;
  const DrawerListTile({
    Key? key,
    required this.navigationItem,
    required this.selected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        leading: Icon(navigationItem.icon),
        title: Text(navigationItem.title),
        onTap: onTap,
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        selected: selected,
        selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
    );
  }
}
