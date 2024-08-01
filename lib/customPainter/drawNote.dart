import 'dart:ui' as ui;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:heart_bit_love/handmadeDraw/handmadeDraw.dart';

class DrawNote extends CustomPainter{
  List<List<ui.Offset>> listOfListsOfCursorPosition;
  Color color = Colors.white;

  DrawNote({required this.listOfListsOfCursorPosition, required this.color});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    //for (ui.Offset cursorPoint in listOfCursorPosition) {
    //  canvas.drawCircle(cursorPoint, 15, ui.Paint()..color = Colors.white);
    //}

    for(List<ui.Offset> listOfPoints in listOfListsOfCursorPosition){
      ui.Path path = ui.Path();
      path.moveTo(listOfPoints.first.dx, listOfPoints.first.dy);
      if(HandmadeDraw(listOfPoints: listOfPoints, color: color).segmentsAreCrossing(canvas)) {
        print("UELLAAAAAAAAAAAAAAAAAAAAAAAA");
      }

      for(ui.Offset point in listOfPoints) {
        path.lineTo(point.dx, point.dy);
      }

      canvas.drawPath(
          path,
          ui.Paint()
            ..color = color
            ..strokeWidth = 5
            ..style = ui.PaintingStyle.stroke
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}