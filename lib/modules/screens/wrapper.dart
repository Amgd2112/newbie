import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/routes/router.dart';
import '../components/app_bar.dart';
import '../components/drawer.dart';
import '../components/floating_action_button.dart';
import '../../blocs/routes/routes_bloc.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutesBloc, RoutesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: mapAppBar(navigationItem: state.selectedItem),
          drawer: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: NewbieDrawer(navigationItem: state.selectedItem),
          ),
          body: NewbieRouter.mapScreen(state.selectedItem.name),
          floatingActionButton: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: mapFloatingActionButton(
              context: context,
              navigationName: state.selectedItem.name,
            ),
          ),
        );
      },
    );
  }
}
