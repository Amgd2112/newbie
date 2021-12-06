import '../models.dart';

class NavigationItem extends NewbieItem {
  final NavigationDestination destination;
  const NavigationItem({required title, required this.destination, required icon})
      : super(title: title, type: destination, icon: icon);
}
