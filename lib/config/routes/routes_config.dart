import 'package:flutter/material.dart';
import '../../modules/screens/about.dart';
import '../../modules/screens/dashboard.dart';
import '../../modules/screens/feed.dart';
import '../../modules/screens/notes.dart';
import '../../modules/screens/roadmap.dart';
import '../../modules/screens/settings.dart';

class RouteNavigator {
  static const String dashboard = '/dashboard';
  static const String feed = '/feed';
  static const String newbieBigNotes = '/newbie-big-notes';
  static const String roadMap = '/road-map';
  static const String settings = '/settings';
  static const String about = '/about';

  static Widget mapRoute(String destination) {
    switch (destination) {
      case dashboard:
        return const DashboardScreen();
      case feed:
        return const FeedScreen();
      case settings:
        return const SettingsScreen();
      case newbieBigNotes:
        return const NotesScreen();
      case roadMap:
        return const RoadmapScreen();
      case about:
        return const AboutScreen();
    }

    return const Center(child: CircularProgressIndicator());
  }
}
