part of 'routes_bloc.dart';

class RoutesState extends Equatable {
  final NavigationItem selectedItem;
  const RoutesState({required this.selectedItem});

  factory RoutesState.change({required selectedItem}) {
    return RoutesState(selectedItem: selectedItem);
  }

  @override
  String toString() => "RoutesState(selectedItem: $selectedItem)";

  @override
  List<Object> get props => [selectedItem];
}
