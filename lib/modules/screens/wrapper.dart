import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/routes/navigation_bloc.dart';
import '../../config/routes/routes.dart';
import '../modules.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final NavigationItem navItem = lookupNavigationItem(context, state.destination);
        return Scaffold(
          appBar: mapAppBar(navigationItem: navItem),
          drawer: NewbieDrawer(navigationItem: navItem),
          body: lookupScreen(state.destination),
          floatingActionButton: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: lookupFloatingActionButton(state.destination),
          ),
        );
      },
    );
  }
}
