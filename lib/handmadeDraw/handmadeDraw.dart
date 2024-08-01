import 'dart:ui';

import 'package:dart_earcut/dart_earcut.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_bit_love/pointDraw/pointDraw.dart';

import '../customPainter/heartCustomPainter.dart';

class HandmadeDraw {
  Color _color = Colors.black;
  List<Offset> _listOfPoints = [];
  bool _isClosed = false;

  HandmadeDraw({required List<Offset> listOfPoints, required Color color}) {
    _color = color;
    _listOfPoints = listOfPoints;
  }

  bool segmentsAreCrossing(Canvas canvas) {

    List<Offset> tmpList = [];

    for(int i = 0; i < _listOfPoints.length - 1; i++) {
      PointDraw firstPoint = PointDraw(x: _listOfPoints[i].dx, y: _listOfPoints[i].dy);
      PointDraw secondPoint = PointDraw(x: _listOfPoints[i+1].dx, y: _listOfPoints[i+1].dy);

      for(int j = i + 2; j < _listOfPoints.length - 1; j++) {
        PointDraw thirdPoint = PointDraw(x: _listOfPoints[j].dx, y: _listOfPoints[j].dy);
        PointDraw fourthPoint = PointDraw(x: _listOfPoints[j + 1].dx, y: _listOfPoints[j + 1].dy);

        if(doIntersect(firstPoint, secondPoint, thirdPoint, fourthPoint)){
          print(firstPoint);
          print(secondPoint);
          print(thirdPoint);
          print(fourthPoint);
          PointDraw tmpPoint = intersection(firstPoint, secondPoint, thirdPoint, fourthPoint)!;
          tmpList.add(Offset(tmpPoint.x, tmpPoint.y));
          tmpList.addAll(_listOfPoints.sublist(i+1, j));
          tmpList.add(Offset(tmpPoint.x, tmpPoint.y));
          List<double> listOfPoints = convertListOfOffsetsInArray(listOfOffsets: tmpList);
          List<int> triangles = Earcut.triangulateRaw(listOfPoints);
          List<Offset> polygonOffset = convertListOfPositionsInListOfOffset(listOfPosition: triangles, offsetList: tmpList);
          Vertices vertices = Vertices(VertexMode.triangles, polygonOffset);
          canvas.drawVertices(vertices, BlendMode.color, Paint()..color = _color);

          print(intersection(firstPoint, secondPoint, thirdPoint, fourthPoint));

          return true;
        }
      }
    }

    return false;
  }

  void checkIfClosed() {

  }

  Color get getColor => _color;
  List<Offset> get getList => _listOfPoints;

  set setColor(Color color) {
    _color = color;
  }

  set setList(List<Offset> listOfPoints) {
    _listOfPoints = listOfPoints;
  }

}