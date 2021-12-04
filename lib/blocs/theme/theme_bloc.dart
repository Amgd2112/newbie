import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/config.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final int initKey;
  ThemeBloc(this.initKey) : super(ThemeState.change(key: initKey)) {
    on<ThemeChanged>((event, emit) async {
      await _setTheme(event.key);
      emit(ThemeState.change(key: event.key));
    });
  }

  Future<void> _setTheme(int key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('theme', key);
  }
}
