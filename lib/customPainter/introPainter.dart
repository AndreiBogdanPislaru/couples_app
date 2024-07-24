import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPainter extends CustomPainter {
  late ui.Image? image;

  IntroPainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
  canvas.drawCircle(Offset(size.width / 2, size.height / 2), 10, Paint()..color = Colors.red );
  canvas.drawCircle(Offset(size.width, size.height), 10, Paint()..color = Colors.green );
  canvas.drawCircle(Offset(0.0, 0.0), 10, Paint()..color = Colors.yellow );

  ui.Rect rect = ui.Rect.fromPoints(
      ui.Offset(size.width / 5, size.height / 5),
      ui.Offset(4 * size.width / 5, 4 * size.height / 5));

  Matrix4 matrix4 = Matrix4.identity()..scale(
      (rect.width / image!.width),
      (rect.height / image!.height)
  );

  canvas.drawRect(rect,
      ui.Paint()..shader =
        ImageShader(image!, ui.TileMode.clamp, ui.TileMode.clamp, matrix4.storage));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}