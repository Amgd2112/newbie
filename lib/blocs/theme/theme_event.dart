part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final int key;
  const ThemeChanged({required this.key});

  @override
  List<Object> get props => [key];
}
