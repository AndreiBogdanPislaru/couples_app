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

List<Offset> scalePolygon({required List<Offset> polygon, required double scaledFactor}) {
  List<Offset> scaledPolygon = [];

  for (Offset point in polygon){
    scaledPolygon.add(Offset(point.dx * scaledFactor, point.dy * scaledFactor));
  }

  return scaledPolygon;
}

List<List<double>> heartPolygon() {
  List<List<double>> result = [];


  return result;
}


List<List<Offset>> assemblePolygon({required List<List<Offset>> polygonList}) {
  List<List<Offset>> result = [];

  for (int i = 0; i < polygonList.length - 1; i++) {
    List<Offset> tmpArray = [];
    for(int j = 0; j < polygonList[i].length - 1; j++) {
      tmpArray.add(polygonList[i][j]);
      tmpArray.add(polygonList[i+1][i]);
      tmpArray.add(polygonList[i+1][i+1]);

      tmpArray.add(polygonList[i][j]);
      tmpArray.add(polygonList[i+1][i+1]);
      tmpArray.add(polygonList[i][i+1]);
    }
    result.add(tmpArray);
  }

  return result;
}

class HeartCustomPainter extends CustomPainter {
  Color? firstColor;
  Color? secondColor;

  HeartCustomPainter({required this.firstColor, required this.secondColor});

  @override
  void paint(Canvas canvas, Size size) {

    List<Offset> points = [];

    for (double t = -180; t < 180; t++) {
      double rad = t * (pi / 180);
      double x = 10 * pow(sin(rad), 3) as double;
      double y = (10 * cos(rad) - 3 * cos(2 * rad) - 2 * cos(3 * rad) - cos(4 * rad));

      points.add(Offset(15 * x, 15 * y));
    }

    //canvas.drawPoints(PointMode.points, points, Paint()..color = Colors.red);
    canvas.save();
    canvas.rotate(180 * (pi / 180));
    //canvas.drawRect(Rect.fromLTRB(0, 0, 100, 200), Paint()..color = Colors.green);
    List<double> listOfPoints = convertListOfOffsetsInArray(listOfOffsets: points);
    List<int> triangles = Earcut.triangulateRaw(listOfPoints);
    List<Offset> polygonOffset = convertListOfPositionsInListOfOffset(listOfPosition: triangles, offsetList: points);

    List<Offset> scaledPolygon_1 = scalePolygon(polygon: polygonOffset, scaledFactor: 0.8);
    List<Offset> scaledPolygon_2 = scalePolygon(polygon: scaledPolygon_1, scaledFactor: 0.8);
    List<Offset> scaledPolygon_3 = scalePolygon(polygon: scaledPolygon_2, scaledFactor: 0.8);
    List<Offset> scaledPolygon_4 = scalePolygon(polygon: scaledPolygon_3, scaledFactor: 0.8);
    List<Offset> scaledPolygon_5 = scalePolygon(polygon: scaledPolygon_4, scaledFactor: 0.8);
    List<Offset> scaledPolygon_6 = scalePolygon(polygon: scaledPolygon_5, scaledFactor: 0.8);
    List<Offset> scaledPolygon_7 = scalePolygon(polygon: scaledPolygon_6, scaledFactor: 0.8);
    List<Offset> scaledPolygon_8 = scalePolygon(polygon: scaledPolygon_7, scaledFactor: 0.7);
    List<Offset> scaledPolygon_9 = scalePolygon(polygon: scaledPolygon_8, scaledFactor: 0.5);

    List<List<Offset>> threeDimensionalHeartUnassembled = [];
    threeDimensionalHeartUnassembled.add(scaledPolygon_1);
    threeDimensionalHeartUnassembled.add(scaledPolygon_2);
    threeDimensionalHeartUnassembled.add(scaledPolygon_3);
    threeDimensionalHeartUnassembled.add(scaledPolygon_4);
    threeDimensionalHeartUnassembled.add(scaledPolygon_5);
    threeDimensionalHeartUnassembled.add(scaledPolygon_6);
    threeDimensionalHeartUnassembled.add(scaledPolygon_7);
    threeDimensionalHeartUnassembled.add(scaledPolygon_8);
    threeDimensionalHeartUnassembled.add(scaledPolygon_9);

    List<List<Offset>> threeDimensionalHeartAssembled = assemblePolygon(polygonList: threeDimensionalHeartUnassembled);




    Vertices vertices = Vertices(VertexMode.triangles, polygonOffset);
    Vertices scaledVertices_1 = Vertices(VertexMode.triangles, scaledPolygon_1);
    Vertices scaledVertices_2 = Vertices(VertexMode.triangles, scaledPolygon_2);
    Vertices scaledVertices_3 = Vertices(VertexMode.triangles, scaledPolygon_3);
    Vertices scaledVertices_4 = Vertices(VertexMode.triangles, scaledPolygon_4);
    Vertices scaledVertices_5 = Vertices(VertexMode.triangles, scaledPolygon_5);
    Vertices scaledVertices_6 = Vertices(VertexMode.triangles, scaledPolygon_6);
    Vertices scaledVertices_7 = Vertices(VertexMode.triangles, scaledPolygon_7);
    Vertices scaledVertices_8 = Vertices(VertexMode.triangles, scaledPolygon_8);
    Vertices scaledVertices_9 = Vertices(VertexMode.triangles, scaledPolygon_9);


    MaterialColor color_1 = Colors.red;
    MaterialColor color_2 = Colors.red;

    canvas.drawVertices(vertices, BlendMode.color, Paint()..color = secondColor!);
    canvas.drawVertices(scaledVertices_1, BlendMode.color, Paint()..color = firstColor!);
    canvas.drawVertices(scaledVertices_2, BlendMode.color, Paint()..color = secondColor!);
    canvas.drawVertices(scaledVertices_3, BlendMode.color, Paint()..color = firstColor!);
    canvas.drawVertices(scaledVertices_4, BlendMode.color, Paint()..color = secondColor!);
    canvas.drawVertices(scaledVertices_5, BlendMode.color, Paint()..color = firstColor!);
    canvas.drawVertices(scaledVertices_6, BlendMode.color, Paint()..color = secondColor!);
    canvas.drawVertices(scaledVertices_7, BlendMode.color, Paint()..color = firstColor!);
    canvas.drawVertices(scaledVertices_8, BlendMode.color, Paint()..color = secondColor!);
    canvas.drawVertices(scaledVertices_9, BlendMode.color, Paint()..color = firstColor!);
    /*canvas.drawPoints(PointMode.polygon, points,
        Paint()
          ..color = Colors.red
          ..strokeWidth = 7);*/
    //canvas.rotate(45 * (pi / 180));
    canvas.restore();

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}