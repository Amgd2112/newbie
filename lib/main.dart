import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'constants/themes/light_theme.dart';
import 'modules/screens/home.dart';
import 'utils/helpers/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(Phoenix(child: const MyApp())),
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
      home: const HomeScreen(),
    );
  }
}
