import 'package:flutter/material.dart';

import '../../config/routes/routes.dart';
import '../models/models.dart';

class NavigationListTile extends StatelessWidget {
  final NavigationDestination destination;
  final void Function()? onTap;

  const NavigationListTile({Key? key, required this.destination, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationItem item = lookupNavigationItem(context, destination);
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20.0),
      dense: true,
      leading: Icon(item.icon),
      title: Text(
        item.title,
        style: Theme.of(context).textTheme.button,
      ),
      onTap: onTap,
    );
  }
}
