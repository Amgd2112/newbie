import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../modules/models/models.dart';

NavigationItem lookupNavigationItem(BuildContext context, NavigationDestination destination) {
  switch (destination) {
    case NavigationDestination.home:
      return NavigationItem(
        title: AppLocalizations.of(context)?.homeTitle,
        destination: NavigationDestination.home,
        icon: Icons.home_filled,
      );

    case NavigationDestination.statistics:
      return NavigationItem(
        destination: NavigationDestination.statistics,
        title: AppLocalizations.of(context)?.statisticsTitle,
        icon: Icons.bar_chart_sharp,
      );

    case NavigationDestination.notes:
      return NavigationItem(
        destination: NavigationDestination.notes,
        title: AppLocalizations.of(context)?.notesTitle,
        icon: Icons.mode_edit_rounded,
      );

    case NavigationDestination.roadmap:
      return NavigationItem(
        destination: NavigationDestination.roadmap,
        title: AppLocalizations.of(context)?.roadmapTitle,
        icon: Icons.lightbulb_outline,
      );

    case NavigationDestination.deleted:
      return NavigationItem(
        destination: NavigationDestination.deleted,
        title: AppLocalizations.of(context)?.deletedTitle,
        icon: Icons.delete_outline,
      );

    case NavigationDestination.settings:
      return NavigationItem(
        destination: NavigationDestination.settings,
        title: AppLocalizations.of(context)?.settingsTitle,
        icon: Icons.settings,
      );

    case NavigationDestination.addProblem:
      return NavigationItem(
        destination: NavigationDestination.addProblem,
        title: AppLocalizations.of(context)?.homeNewProblemTitle,
        icon: Icons.my_library_books_outlined,
      );

    case NavigationDestination.theme:
      return NavigationItem(
        destination: NavigationDestination.theme,
        title: AppLocalizations.of(context)?.settingsThemeTitle,
        icon: Icons.light_mode_outlined,
      );

    case NavigationDestination.languages:
      return NavigationItem(
        destination: NavigationDestination.languages,
        title: AppLocalizations.of(context)?.settingsLanguagesTitle,
        icon: Icons.translate,
      );

    case NavigationDestination.notifications:
      return NavigationItem(
        destination: NavigationDestination.notifications,
        title: AppLocalizations.of(context)?.settingsNotificationsTitle,
        icon: Icons.notifications_none,
      );

    case NavigationDestination.privacy:
      return NavigationItem(
        destination: NavigationDestination.privacy,
        title: AppLocalizations.of(context)?.settingsPrivacyTitle,
        icon: Icons.lock_outline_rounded,
      );
  }
}
