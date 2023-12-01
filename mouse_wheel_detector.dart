import 'package:flutter/material.dart';

enum MouseWheelDirection {
  //Both horization and verticle work
  both,
  //only enable horization
  horization,
  //only enable verticle
  verticle,
}

//监听鼠标滚轮事件
class MouseWheelDetector extends StatelessWidget {
  final Widget child;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  late MouseWheelDirection mouseWheelDirection;

  MouseWheelDetector({
    super.key,
    required this.onIncrease,
    required this.onDecrease,
    this.mouseWheelDirection = MouseWheelDirection.both,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (mouseWheelDirection == MouseWheelDirection.both) {
          if (details.delta.dx > 0 || details.delta.dy < 0) {
            //滚轮向右或者向上
            //to right, inscrease
            if (onIncrease != null) {
              onIncrease!();
            }
          } else {
            if (onDecrease != null) {
              onDecrease!();
            }
          }
        } else if (mouseWheelDirection == MouseWheelDirection.horization) {
          //只对dx生效
          if (details.delta.dx > 0) {
            //滚轮向右或者向上
            //to right, inscrease
            if (onIncrease != null) {
              onIncrease!();
            }
          } else if (details.delta.dx < 0) {
            if (onDecrease != null) {
              onDecrease!();
            }
          }
        } else if (mouseWheelDirection == MouseWheelDirection.verticle) {
          //只对dy生效
          //只对dx生效
          if (details.delta.dy < 0) {
            //滚轮向右或者向上
            //to right, inscrease
            if (onIncrease != null) {
              onIncrease!();
            }
          } else if (details.delta.dy > 0) {
            if (onDecrease != null) {
              onDecrease!();
            }
          }
        }
      },
      child: child,
    );
  }
}
