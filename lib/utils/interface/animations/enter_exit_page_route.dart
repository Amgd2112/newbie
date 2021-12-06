import 'package:flutter/material.dart';

class EnterExitPageRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  final AxisDirection direction;
  EnterExitPageRoute({
    required this.exitPage,
    required this.enterPage,
    required this.direction,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return enterPage;
          },
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 150);

  @override
  RouteTransitionsBuilder get transitionsBuilder {
    return (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: offsetMap[offsetMapReverse[direction]],
            ).animate(animation),
            child: exitPage,
          ),
          SlideTransition(
            position: Tween<Offset>(
              begin: offsetMap[direction],
              end: Offset.zero,
            ).animate(animation),
            child: enterPage,
          )
        ],
      );
    };
  }

  static const Map<AxisDirection, Offset> offsetMap = {
    AxisDirection.up: Offset(0.0, 1.0),
    AxisDirection.right: Offset(-1.0, 0.0),
    AxisDirection.down: Offset(0.0, -1.0),
    AxisDirection.left: Offset(1.0, 0.0),
  };

  static const Map<AxisDirection, AxisDirection> offsetMapReverse = {
    AxisDirection.up: AxisDirection.down,
    AxisDirection.right: AxisDirection.left,
    AxisDirection.down: AxisDirection.up,
    AxisDirection.left: AxisDirection.right,
  };
}
