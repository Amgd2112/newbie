import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  primaryColor: Colors.deepPurple,
  primarySwatch: Colors.deepPurple,

  backgroundColor: Colors.grey[900],
  scaffoldBackgroundColor: Colors.grey[900],

  appBarTheme: const AppBarTheme(
    elevation: 0.0,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepPurple,
  ),
);
