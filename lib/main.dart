import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'blocs/connection/connection_bloc.dart';
import 'blocs/routes/routes_bloc.dart';
import 'config/theme/dark_theme.dart';
import 'modules/screens/internet_connection.dart';
import 'modules/screens/wrapper.dart';
import 'utils/helper/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnectionBloc>(
            create: (BuildContext context) {
              return ConnectionBloc()..add(ListenConnection());
            },
          ),
          BlocProvider<RoutesBloc>(
            create: (BuildContext context) => RoutesBloc(),
          ),
        ],
        child: const NewbieApp(),
      ),
    )),
    blocObserver: NewbieBlocObserver(),
  );
}

class NewbieApp extends StatelessWidget {
  const NewbieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newbie',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: BlocBuilder<ConnectionBloc, InternetConnectionState>(
        builder: (context, internetConnectionState) {
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) {
              return internetConnectionState.isConnected;
            },
            widgetBuilder: (BuildContext context) {
              return BlocBuilder<RoutesBloc, RoutesState>(
                builder: (context, state) {
                  return const WrapperScreen();
                },
              );
            },
            fallbackBuilder: (BuildContext context) {
              return const InternetConnectionScreen();
            },
          );
        },
      ),
    );
  }
}
