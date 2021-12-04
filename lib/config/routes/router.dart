import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/routes/navigation_bloc.dart';
import '../../modules/modules.dart';
import '../../utils/interface/animations/animations.dart';

class NewbieRouter {
  static Widget mapScreen(NavigationDestination destination) {
    switch (destination) {
      case NavigationDestination.feed:
        return const FeedScreen();
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
        return const ThemeScreen();
      case NavigationDestination.languages:
        return const LanguagesScreen();
      case NavigationDestination.notifications:
        return const NotificationsScreen();
      case NavigationDestination.privacy:
        return const PrivacyScreen();
    }
  }

  static void replacePage({
    required BuildContext context,
    required NavigationDestination destination,
  }) {
    Navigator.pop(context);
    context
        .read<NavigationBloc>()
        .add(DestinationChanged(destination: destination));
  }

  static Future pushPage({
    required BuildContext context,
    required NavigationDestination destination,
  }) {
    var val = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => mapScreen(destination),
      ),
    );

    return val;
  }

  static Future pushBouncyPage({
    required BuildContext context,
    required NavigationDestination destination,
  }) {
    var val = Navigator.push(
      context,
      BouncyPageRoute(screen: mapScreen(destination)),
    );

    return val;
  }

  static Future pushSlidePage({
    required BuildContext context,
    required NavigationDestination destination,
    required AxisDirection direction,
  }) {
    var val = Navigator.push(
      context,
      SlidePageRoute(
        screen: mapScreen(destination),
        direction: direction,
      ),
    );

    return val;
  }

  static Future pushFadePage({
    required BuildContext context,
    required NavigationDestination destination,
  }) {
    var val = Navigator.push(
      context,
      FadePageRoute(screen: mapScreen(destination)),
    );

    return val;
  }

  static Future pushEnterExitPage({
    required BuildContext context,
    required NavigationDestination source,
    required NavigationDestination destination,
    required AxisDirection direction,
  }) {
    var val = Navigator.push(
      context,
      EnterExitPageRoute(
        enterPage: mapScreen(source),
        exitPage: mapScreen(destination),
        direction: direction,
      ),
    );

    return val;
  }

  static Future pushPageDialog(BuildContext context, Widget dialog) {
    var val = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return dialog;
        },
        fullscreenDialog: true,
      ),
    );

    return val;
  }
}
