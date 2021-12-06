part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState({required this.locale});

  factory LocalizationState.change({required Language language}) {
    return LocalizationState(locale: LanguageConfig.getLocalization(language));
  }

  @override
  String toString() => 'LocalizationState(locale: $locale)';

  @override
  List<Object?> get props => [locale];
}
