import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/routes/navigation_bloc.dart';
import '../../config/routes/router.dart';
import '../modules.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: mapAppBar(navigationItem: state.selectedItem),
          drawer: NewbieDrawer(navigationItem: state.selectedItem),
          body: NewbieRouter.mapScreen(state.selectedItem.destination),
          floatingActionButton: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: mapFloatingActionButton(state.selectedItem.destination),
          ),
        );
      },
    );
  }

  Widget? mapFloatingActionButton(NavigationDestination destination) {
    if (destination == NavigationDestination.feed) {
      return const FeedFloatingActionButton();
    }

    if (destination == NavigationDestination.notes) {
      return const NotesFloatingActionButton();
    }

    return null;
  }
}
