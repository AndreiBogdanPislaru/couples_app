import 'dart:math';
import 'dart:ui';

import 'package:dart_earcut/dart_earcut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<double> convertListOfOffsetsInArray({required List<Offset> listOfOffsets}) {
  List<double> convertedList = [];

  for (Offset element in listOfOffsets) {
    convertedList.add(element.dx);
    convertedList.add(element.dy);
  }

  return convertedList;
}

List<Offset> convertListOfPositionsInListOfOffset({required List<int> listOfPosition, required List<Offset> offsetList}) {
  List<Offset> result = [];

  for (int i = 0; i < listOfPosition.length; i++) {
    result.add(offsetList[listOfPosition[i]]);
  }

  return result;
}

class HeartCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    List<Offset> points = [];

    for (double t = -180; t < 180; t++) {
      double rad = t * (pi / 180);
      double x = 7 * pow(sin(rad), 3) as double;
      double y = (10 * cos(rad) - 3 * cos(2 * rad) - 2 * cos(3 * rad) - cos(4 * rad) );

      points.add(Offset(25 * x, 15 * y));
    }

    //canvas.drawPoints(PointMode.points, points, Paint()..color = Colors.red);
    canvas.save();
    canvas.rotate(180 * (pi / 180));
    //canvas.drawRect(Rect.fromLTRB(0, 0, 100, 200), Paint()..color = Colors.green);
    List<double> listOfPoints = convertListOfOffsetsInArray(listOfOffsets: points);
    List<int> triangles = Earcut.triangulateRaw(listOfPoints);
    List<Offset> polygonOffset = convertListOfPositionsInListOfOffset(listOfPosition: triangles, offsetList: points);

    Vertices vertices = Vertices(VertexMode.triangleStrip, polygonOffset);
    canvas.drawVertices(vertices, BlendMode.color, Paint()..color = Colors.yellow);
    canvas.drawPoints(PointMode.polygon, points,
        Paint()
          ..color = Colors.red
          ..strokeWidth = 3);
    //canvas.rotate(45 * (pi / 180));
    canvas.restore();

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}