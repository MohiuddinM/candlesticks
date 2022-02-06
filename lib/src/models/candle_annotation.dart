import 'package:flutter/material.dart';

abstract class Annotation {
  void paint(
    PaintingContext context,
    Offset candleTop,
    Offset candleBottom,
  );
}

class CircleAnnotation extends Annotation {
  CircleAnnotation({
    this.text,
    this.radius = 5,
    this.color = Colors.green,
    this.textStyle,
  });

  final String? text;
  final double radius;
  final Color color;
  final TextStyle? textStyle;

  @override
  void paint(PaintingContext context, Offset candleTop, Offset candleBottom) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    context.canvas.drawCircle(candleBottom.translate(0, 20), radius, paint);

    if (text != null) {
      final textSpan = TextSpan(
        text: text,
        style: textStyle ?? TextStyle(color: color, fontSize: 12),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(
        minWidth: 0,
        maxWidth: 80,
      );

      final offset = Offset(
        candleBottom.dx - textPainter.width / 2,
        candleBottom.dy + radius + textPainter.height + 5,
      );
      textPainter.paint(context.canvas, offset);
    }
  }
}
