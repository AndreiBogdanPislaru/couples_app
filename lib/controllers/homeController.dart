import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<ui.Size?> size = Rxn();
  Rx<ui.Offset> cursorPoint = ui.Offset(0.0, 0.0).obs;
  RxList<ui.Offset> listOfPoints = <ui.Offset>[].obs;
  RxList<List<ui.Offset>> listsOfPoints = <List<ui.Offset>>[].obs;
  RxList<ui.Color> listOfChosenColors = <ui.Color>[].obs;
  Rx<ui.Color> chosenColor = (Colors.white).obs;
}