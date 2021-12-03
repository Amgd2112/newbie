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
              end: mapOffset(direction),
            ).animate(animation),
            child: exitPage,
          ),
          SlideTransition(
            position: Tween<Offset>(
              begin: mapReverseOffset(direction),
              end: Offset.zero,
            ).animate(animation),
            child: enterPage,
          )
        ],
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

  Offset mapReverseOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.down:
        return const Offset(0.0, 1.0);
      case AxisDirection.left:
        return const Offset(-1.0, 0.0);
      case AxisDirection.up:
        return const Offset(0.0, -1.0);
      case AxisDirection.right:
        return const Offset(1.0, 0.0);
    }
  }
}
