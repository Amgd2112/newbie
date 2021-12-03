part of 'routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  const RoutesEvent();

  @override
  List<Object> get props => [];
}

class DestinationChanged extends RoutesEvent {
  final NavigationName destination;
  const DestinationChanged({required this.destination});

  @override
  List<Object> get props => [destination];
}
