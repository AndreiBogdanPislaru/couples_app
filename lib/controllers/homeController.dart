import 'dart:ui' as ui;

import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<ui.Size?> size = Rxn();
  Rx<ui.Offset> cursorPoint = ui.Offset(0.0, 0.0).obs;
  RxList<ui.Offset> listOfPoints = <ui.Offset>[].obs;
}