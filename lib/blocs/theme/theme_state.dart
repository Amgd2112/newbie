part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode mode;
  const ThemeState({required this.mode});

  factory ThemeState.change({required int key}) {
    return ThemeState(mode: ThemeConfig.getTheme(key));
  }

  @override
  String toString() => 'ThemeState(mode: $mode)';

  @override
  List<Object> get props => [mode];
}
