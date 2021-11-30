import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../blocs/connection/connection_bloc.dart';
import '../../blocs/routes/routes_bloc.dart';
import '../components/drawer/drawer.dart';
import 'internet_connection.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const NewbieDrawer(),
      body: BlocBuilder<ConnectionBloc, InternetConnectionState>(
        builder: (context, internetConnectionState) {
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) {
              return internetConnectionState.isConnected;
            },
            widgetBuilder: (BuildContext context) {
              return BlocBuilder<RoutesBloc, RoutesState>(
                builder: (context, state) {
                  return state.screen;
                },
              );
            },
            fallbackBuilder: (BuildContext context) {
              return const InternetConnectionScreen();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
