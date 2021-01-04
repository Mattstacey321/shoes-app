import 'package:flutter/material.dart';

class RoundedTabIndicator extends Decoration {
  final BoxPainter _painter;
  RoundedTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final RRect rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(offset.dx, 20, 15 , 4), Radius.circular(radius));
    canvas.drawRRect(rect, _paint);
  }
}
