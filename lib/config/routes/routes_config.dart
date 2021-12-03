import 'package:flutter/material.dart';
import '../../modules/models/enum_navigation_name.dart';
import '../../modules/screens/deleted.dart';
import '../../modules/screens/add_problem.dart';
import '../../modules/screens/settings.dart';
import '../../modules/screens/statistics.dart';
import '../../modules/screens/feed.dart';
import '../../modules/screens/notes.dart';
import '../../modules/screens/roadmap.dart';
import '../../modules/models/navigation_item.dart';

class RouteNavigator {
  static NavigationItem feed = NavigationItem(
    header: true,
    name: NavigationName.feed,
    title: 'Feed',
    icon: Icons.home_filled,
  );

  static NavigationItem statistics = NavigationItem(
    header: false,
    name: NavigationName.statistics,
    title: 'Statistics',
    icon: Icons.bar_chart_sharp,
  );

  static NavigationItem notes = NavigationItem(
    header: false,
    name: NavigationName.notes,
    title: 'Newbie Big Notes',
    icon: Icons.mode_edit_rounded,
  );

  static NavigationItem roadmap = NavigationItem(
    header: false,
    name: NavigationName.roadmap,
    title: 'Roadmap',
    icon: Icons.lightbulb_outline,
  );

  static NavigationItem deleted = NavigationItem(
    header: false,
    name: NavigationName.deleted,
    title: 'Deleted',
    icon: Icons.delete_outline,
  );

  static NavigationItem settings = NavigationItem(
    header: false,
    name: NavigationName.settings,
    title: 'Settings',
    icon: Icons.settings,
  );

  static NavigationItem addProblem = NavigationItem(
    header: false,
    name: NavigationName.addProblem,
    title: 'Add New Problem',
    icon: Icons.my_library_books_outlined,
  );

  static NavigationItem mapNavigationItem(NavigationName item) {
    switch (item) {
      case NavigationName.feed:
        return feed;
      case NavigationName.statistics:
        return statistics;
      case NavigationName.notes:
        return notes;
      case NavigationName.roadmap:
        return roadmap;
      case NavigationName.deleted:
        return deleted;
      case NavigationName.settings:
        return settings;
      case NavigationName.addProblem:
        return addProblem;
    }
  }

  static Widget mapRoute(NavigationName item) {
    switch (item) {
      case NavigationName.feed:
        return const FeedScreen();
      case NavigationName.statistics:
        return const StatisticsScreen();
      case NavigationName.notes:
        return const NotesScreen();
      case NavigationName.roadmap:
        return const RoadmapScreen();
      case NavigationName.deleted:
        return const DeletedScreen();
      case NavigationName.settings:
        return const SettingsScreen();
      case NavigationName.addProblem:
        return const AddProblemScreen();
    }
  }
}
