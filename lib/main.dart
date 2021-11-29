import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'constants/themes/light_theme.dart';
import 'modules/screens/home.dart';
import 'modules/screens/internet_connection.dart';
import 'utils/connections/bloc/connection_bloc.dart';
import 'utils/helpers/bloc_observer.dart';

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
        ],
        child: const MyApp(),
      ),
    )),
    blocObserver: NewbieBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newbie',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: BlocBuilder<ConnectionBloc, InternetConnectionState>(
        builder: (context, internetConnectionState) {
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) {
              return internetConnectionState is ConnectionSuccess;
            },
            widgetBuilder: (BuildContext context) {
              return const HomeScreen();
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
