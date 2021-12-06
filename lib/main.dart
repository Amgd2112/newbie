import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app.dart';
import 'blocs/blocs.dart';
import 'config/config.dart';
import 'utils/helper/newbie_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Locale newbieLocale = await LanguageConfig.loadLocalization();
  ThemeMode newbieTheme = await ThemeConfig.loadTheme();

  BlocOverrides.runZoned(
    () => runApp(Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationBloc>(
            create: (BuildContext context) {
              return LocalizationBloc(newbieLocale);
            },
          ),
          BlocProvider<ThemeBloc>(
            create: (BuildContext context) {
              return ThemeBloc(newbieTheme);
            },
          ),
          BlocProvider<NetworkBloc>(
            create: (BuildContext context) {
              return NetworkBloc()..add(ListenConnection());
            },
          ),
          BlocProvider<NavigationBloc>(
            create: (BuildContext context) => NavigationBloc(),
          ),
        ],
        child: const NewbieApp(),
      ),
    )),
    blocObserver: NewbieBlocObserver(),
  );
}
