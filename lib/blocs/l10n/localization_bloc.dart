import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../config/l10n/localization_config.dart';
import '../../modules/models/enums/languages.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final Locale locale;
  LocalizationBloc(this.locale) : super(LocalizationState(locale: locale)) {
    on<LocalizationChanged>((event, emit) async {
      await LanguageConfig.setLocalization(event.language);
      emit(LocalizationState.change(language: event.language));
    });
  }
}
