part of 'routes_bloc.dart';

class RoutesState extends Equatable {
  final Widget screen;
  const RoutesState({required this.screen});

  factory RoutesState.change({required screen}) {
    return RoutesState(screen: screen);
  }

  @override
  String toString() => "RoutesState(screen: $screen)";

  @override
  List<Object> get props => [screen];
}
