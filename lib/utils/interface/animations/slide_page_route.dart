import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget screen;
  final AxisDirection direction;
  SlidePageRoute({required this.screen, required this.direction})
      : super(pageBuilder: (context, animation, secondaryAnimation) => screen);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 50);

  @override
  RouteTransitionsBuilder get transitionsBuilder {
    return (context, animation, secondaryAnimation, child) {
      final Tween<Offset> tween = Tween<Offset>(
        begin: offsetMap[direction],
        end: Offset.zero,
      );
      final Animation<Offset> offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    };
  }
  static const Map<AxisDirection, Offset> offsetMap = {
    AxisDirection.up: Offset(0.0, 1.0),
    AxisDirection.right: Offset(-1.0, 0.0),
    AxisDirection.down: Offset(0.0, -1.0),
    AxisDirection.left: Offset(1.0, 0.0),
  };

}
