import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget screen;
  final AxisDirection direction;
  SlidePageRoute({required this.screen, required this.direction})
      : super(pageBuilder: (context, animation, secondaryAnimation) => screen);

  @override
  RouteTransitionsBuilder get transitionsBuilder {
    return (context, animation, secondaryAnimation, child) {
      final Tween<Offset> tween = Tween<Offset>(
        begin: mapOffset(direction),
        end: Offset.zero,
      );
      final Animation<Offset> offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    };
  }

  Offset mapOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0.0, 1.0);
      case AxisDirection.right:
        return const Offset(-1.0, 0.0);
      case AxisDirection.down:
        return const Offset(0.0, -1.0);
      case AxisDirection.left:
        return const Offset(1.0, 0.0);
    }
  }
}
