import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/interface/animations/enter_exit_page_route.dart';
import '../../utils/interface/animations/fade_page_route.dart';
import '../../utils/interface/animations/slide_page_route.dart';

import '../../../blocs/routes/routes_bloc.dart';
import '../../utils/interface/animations/bouncy_page_route.dart';
import '../../modules/models/enum_navigation_name.dart';
import '../../modules/models/navigation_item.dart';
import 'routes_config.dart';

class NewbieRouter {
  static NavigationItem mapNavigationItem(NavigationName name) {
    return RouteNavigator.mapNavigationItem(name);
  }

  static Widget mapScreen(NavigationName name) {
    return RouteNavigator.mapRoute(name);
  }

  static void replacePage({
    required BuildContext context,
    required NavigationName name,
  }) {
    Navigator.pop(context);
    context.read<RoutesBloc>().add(DestinationChanged(destination: name));
    // BlocProvider.of<RoutesBloc>(context)
    //     .add(DestinationChanged(destination: name));
  }

  static Future pushPage({
    required BuildContext context,
    required NavigationName name,
  }) {
    var val = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => mapScreen(name),
      ),
    );

    return val;
  }

  static Future pushBouncyPage({
    required BuildContext context,
    required NavigationName name,
  }) {
    var val = Navigator.push(
      context,
      BouncyPageRoute(screen: mapScreen(name)),
    );

    return val;
  }

  static Future pushSlidePage({
    required BuildContext context,
    required NavigationName name,
    required AxisDirection direction,
  }) {
    var val = Navigator.push(
      context,
      SlidePageRoute(
        screen: mapScreen(name),
        direction: direction,
      ),
    );

    return val;
  }

  static Future pushFadePage({
    required BuildContext context,
    required NavigationName name,
  }) {
    var val = Navigator.push(
      context,
      FadePageRoute(screen: mapScreen(name)),
    );

    return val;
  }

  static Future pushEnterExitPage({
    required BuildContext context,
    required NavigationName source,
    required NavigationName destination,
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
