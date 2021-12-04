import 'package:flutter/material.dart';

import '../../modules/models/models.dart';

class RouteConfig {
  static const NavigationItem feed = NavigationItem(
    destination: NavigationDestination.feed,
    title: 'Feed',
    icon: Icons.home_filled,
  );

  static const NavigationItem statistics = NavigationItem(
    destination: NavigationDestination.statistics,
    title: 'Statistics',
    icon: Icons.bar_chart_sharp,
  );

  static const NavigationItem notes = NavigationItem(
    destination: NavigationDestination.notes,
    title: 'Newbie Big Notes',
    icon: Icons.mode_edit_rounded,
  );

  static const NavigationItem roadmap = NavigationItem(
    destination: NavigationDestination.roadmap,
    title: 'Roadmap',
    icon: Icons.lightbulb_outline,
  );

  static const NavigationItem deleted = NavigationItem(
    destination: NavigationDestination.deleted,
    title: 'Deleted',
    icon: Icons.delete_outline,
  );

  static const NavigationItem settings = NavigationItem(
    destination: NavigationDestination.settings,
    title: 'Settings',
    icon: Icons.settings,
  );

  static const NavigationItem addProblem = NavigationItem(
    destination: NavigationDestination.addProblem,
    title: 'Add New Problem',
    icon: Icons.my_library_books_outlined,
  );

  static const NavigationItem theme = NavigationItem(
    destination: NavigationDestination.theme,
    title: 'Theme',
    icon: Icons.light_mode_outlined,
  );

  static const NavigationItem languages = NavigationItem(
    destination: NavigationDestination.languages,
    title: 'Languages',
    icon: Icons.translate,
  );

  static const NavigationItem notifications = NavigationItem(
    destination: NavigationDestination.notifications,
    title: 'Notifications',
    icon: Icons.notifications_none,
  );

  static const NavigationItem privacy = NavigationItem(
    destination: NavigationDestination.privacy,
    title: 'Privacy',
    icon: Icons.lock_outline_rounded,
  );

  static NavigationItem getNavigationItem(NavigationDestination destination) {
    switch (destination) {
      case NavigationDestination.feed:
        return RouteConfig.feed;
      case NavigationDestination.statistics:
        return RouteConfig.statistics;
      case NavigationDestination.notes:
        return RouteConfig.notes;
      case NavigationDestination.roadmap:
        return RouteConfig.roadmap;
      case NavigationDestination.deleted:
        return RouteConfig.deleted;
      case NavigationDestination.settings:
        return RouteConfig.settings;
      case NavigationDestination.addProblem:
        return RouteConfig.addProblem;
      case NavigationDestination.theme:
        return RouteConfig.theme;
      case NavigationDestination.languages:
        return RouteConfig.languages;
      case NavigationDestination.notifications:
        return RouteConfig.notifications;
      case NavigationDestination.privacy:
        return RouteConfig.privacy;
    }
  }
}
