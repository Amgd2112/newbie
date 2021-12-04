part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final NavigationItem selectedItem;
  const NavigationState({required this.selectedItem});

  factory NavigationState.initial() {
    return const NavigationState(selectedItem: RouteConfig.feed);
  }

  factory NavigationState.change({required selectedItem}) {
    return NavigationState(selectedItem: selectedItem);
  }

  @override
  String toString() =>
      'NavigationState(selectedItem: ${selectedItem.destination})';

  @override
  List<Object> get props => [selectedItem];
}
