import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DrawNote extends CustomPainter{
  List<ui.Offset> listOfCursorPosition;

  DrawNote({required this.listOfCursorPosition});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    for (ui.Offset cursorPoint in listOfCursorPosition) {
      canvas.drawCircle(cursorPoint, 15, ui.Paint()..color = Colors.white);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}