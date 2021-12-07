import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../config/config.dart';
import '../modules.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settingsTitle)),
      body: ListView(
        physics: const BouncingScrollPhysics(),
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
                    AppLocalizations.of(context)!.settingsTitle,
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                        ),
                  ),
                ),

                ...[
                  NavigationDestination.notifications,
                  NavigationDestination.privacy,
                ].map(
                  (NavigationDestination destination) {
                    return NavigationListTile(
                      destination: destination,
                      onTap: () {
                        NewbieRouter.pushSlidePage(context, destination, AxisDirection.left);
                      },
                    );
                  },
                ),

                ...[NavigationDestination.languages, NavigationDestination.theme]
                    .map((NavigationDestination destination) {
                  return NavigationListTile(
                    destination: destination,
                    onTap: () {
                      NewbieRouter.pushDialog(context, destination);
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
