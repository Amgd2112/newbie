import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'blocs/blocs.dart';
import 'utils/helper/newbie_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _preferences = await SharedPreferences.getInstance();

  BlocOverrides.runZoned(
    () => runApp(Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NetworkBloc>(
            create: (BuildContext context) {
              return NetworkBloc()..add(ListenConnection());
            },
          ),
          BlocProvider<NavigationBloc>(
            create: (BuildContext context) => NavigationBloc(),
          ),
          BlocProvider<ThemeBloc>(
            create: (BuildContext context) {
              return ThemeBloc(_preferences.getInt('theme') ?? 2);
            },
          ),
        ],
        child: const NewbieApp(),
      ),
    )),
    blocObserver: NewbieBlocObserver(),
  );
}
