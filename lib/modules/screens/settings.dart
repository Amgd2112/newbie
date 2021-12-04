import 'package:flutter/material.dart';
import 'package:newbie/modules/modules.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Material(
            color: Theme.of(context).canvasColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 20.0,
                    bottom: 5.0,
                  ),
                  child: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                        ),
                  ),
                ),
                ...[
                  NavigationDestination.notifications,
                  NavigationDestination.theme,
                  NavigationDestination.languages,
                  NavigationDestination.privacy,
                ].map(
                  (NavigationDestination name) {
                    return NavigationListTile(destination: name);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
