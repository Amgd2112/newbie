import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/routes/navigation_bloc.dart';
import '../../modules/modules.dart';
import '../../utils/interface/interface.dart';

class NewbieRouter {
  static void replacePage(BuildContext context, NavigationDestination destination) {
    Navigator.pop(context);
    context.read<NavigationBloc>().add(DestinationChanged(destination: destination));
  }

  static Future<dynamic> pushPage(BuildContext context, NavigationDestination destination) {
    var val = Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => lookupScreen(destination)),
    );
    return val;
  }

  static Future<dynamic> pushBouncyPage(BuildContext context, NavigationDestination destination) {
    var val = Navigator.push(
      context,
      BouncyPageRoute(screen: lookupScreen(destination)),
    );
    return val;
  }

  static Future<dynamic> pushSlidePage(
      BuildContext context, NavigationDestination destination, AxisDirection direction) {
    var val = Navigator.push(
      context,
      SlidePageRoute(
        screen: lookupScreen(destination),
        direction: direction,
      ),
    );
    return val;
  }

  static Future<dynamic> pushFadePage(BuildContext context, NavigationDestination destination) {
    var val = Navigator.push(
      context,
      FadePageRoute(screen: lookupScreen(destination)),
    );
    return val;
  }

  static Future<dynamic> pushEnterExitPage(
    BuildContext context, {
    required NavigationDestination source,
    required NavigationDestination destination,
    required AxisDirection direction,
  }) {
    var val = Navigator.push(
      context,
      EnterExitPageRoute(
        enterPage: lookupScreen(source),
        exitPage: lookupScreen(destination),
        direction: direction,
      ),
    );
    return val;
  }

  static Future<dynamic> pushDialog(BuildContext context, NavigationDestination destination) {
    var val = showDialog(
      context: context,
      builder: (BuildContext context) {
        return lookupScreen(destination);
      },
    );
    return val;
  }
}

Widget lookupScreen(NavigationDestination destination) {
  switch (destination) {
    case NavigationDestination.home:
      return const HomeScreen();
    case NavigationDestination.statistics:
      return const StatisticsScreen();
    case NavigationDestination.notes:
      return const NotesScreen();
    case NavigationDestination.roadmap:
      return const RoadmapScreen();
    case NavigationDestination.deleted:
      return const DeletedScreen();
    case NavigationDestination.settings:
      return const SettingsScreen();
    case NavigationDestination.addProblem:
      return const AddProblemScreen();

    case NavigationDestination.theme:
      return const ThemeDialog();
    case NavigationDestination.languages:
      return const LanguagesDialog();

    case NavigationDestination.notifications:
      return const NotificationsScreen();
    case NavigationDestination.privacy:
      return const PrivacyScreen();
  }
}
