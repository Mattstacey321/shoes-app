import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final double iconSize;
  final String tooltip;
  final bool isCircle;
  const CircleIcon(
      {this.isCircle = true,@required this.child,@required this.onTap,
      this.tooltip = "",
      this.iconSize = 20,
      });
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      type: isCircle ? MaterialType.circle : MaterialType.button,
      color: Colors.transparent,
      child: isCircle
          ? IconButton(
              tooltip: tooltip ?? null,
              icon: child,
              onPressed: onTap,
              splashRadius: 20,
              iconSize: iconSize,
            )
          : InkWell(child: child),
    );
  }
}
