import 'package:flutter/material.dart';

class SlideCutsPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(0, h / 2), radius: 8),
      0,
      10,
      false,
      Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(w, h / 2), radius: 8),
      0,
      10,
      false,
      Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
