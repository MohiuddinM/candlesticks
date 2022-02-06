import 'package:flutter/material.dart';

abstract class Annotation {
  void paint(
    PaintingContext context,
    Offset candleTop,
    Offset candleBottom,
  );
}

class CircleAnnotation extends Annotation {
  CircleAnnotation({this.text, this.radius = 5, this.color = Colors.green});

  final String? text;
  final double radius;
  final Color color;

  @override
  void paint(PaintingContext context, Offset candleTop, Offset candleBottom) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    context.canvas.drawCircle(candleBottom.translate(0, 20), radius, paint);
  }
}
