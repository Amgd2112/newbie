part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final NavigationDestination destination;
  const NavigationState({required this.destination});

  factory NavigationState.initial() {
    return const NavigationState(destination: NavigationDestination.home);
  }

  factory NavigationState.change({required destination}) {
    return NavigationState(destination: destination);
  }

  @override
  String toString() => 'NavigationState(destination: $destination)';

  @override
  List<Object> get props => [destination];
}
