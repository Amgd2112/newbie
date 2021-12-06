import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../config/theme/theme_config.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeMode mode;
  ThemeBloc(this.mode) : super(ThemeState(mode: mode)) {
    on<ThemeChanged>((event, emit) async {
      await ThemeConfig.setTheme(event.key);
      emit(ThemeState.change(key: event.key));
    });
  }


}
