import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    List<Offset> points = [];

    for (double t = -180; t < 180; t++) {
      double rad = t * (pi / 180);
      double x = 7 * pow(sin(rad), 3) as double;
      double y = (10 * cos(rad) - 3 * cos(2 * rad) - 2 * cos(3 * rad) - cos(4 * rad) );

      points.add(Offset(x, y));
      canvas.drawPoints(PointMode.points, [Offset(x * 20, y * -20)], Paint()..color = Colors.red
      ..strokeWidth = 7);
    }

    //canvas.drawPoints(PointMode.points, points, Paint()..color = Colors.red);
    canvas.save();
    canvas.rotate(45 * (pi / 180));
    canvas.drawRect(Rect.fromLTRB(0, 0, 100, 200), Paint()..color = Colors.green);
    canvas.drawPoints(PointMode.lines, points, Paint()..color = Colors.red);
    //canvas.rotate(45 * (pi / 180));
    canvas.restore();

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}