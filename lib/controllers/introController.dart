import 'dart:ui';

import 'package:get/get.dart';

class IntroController extends GetxController {

  RxInt colorIndex = 0.obs;
  RxInt counter = 0.obs;
  Rx<Paint> paint = Paint().obs;
  RxInt counterPressions = 0.obs;

  void tapOnScreen(){

  }

}