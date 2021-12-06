part of 'localization_bloc.dart';

@immutable
abstract class LocalizationEvent extends Equatable {}

class LocalizationChanged extends LocalizationEvent {
  final Language language;

  LocalizationChanged({required this.language});

  @override
  String toString() => 'LocalizationChanged(language: $language)';

  @override
  List<Object> get props => [language];
}
