import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'config/theme/theme.dart';
import 'modules/screens/screens.dart';

class NewbieApp extends StatelessWidget {
  const NewbieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return MaterialApp(
          title: 'Newbie',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeState.mode,
          home: BlocBuilder<NetworkBloc, NetworkState>(
            builder: (networkContext, networkState) {
              if (networkState is ConnectionInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (networkState is ConnectionChanged) {
                return const InternetConnectionScreen();
              }

              return BlocBuilder<NavigationBloc, NavigationState>(
                builder: (context, state) {
                  return const WrapperScreen();
                },
              );
            },
          ),
        );
      },
    );
  }
}
