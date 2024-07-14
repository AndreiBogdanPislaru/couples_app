import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_bit_love/controllers/introController.dart';

import '../customPainter/heartCustomPainter.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);
  final IntroController controller = Get.put(IntroController());

  @override
  State<StatefulWidget> createState() => IntroState();
}

class IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
      alignment: Alignment.center,
      height: 400,
          color: Colors.indigoAccent,
      child: CustomPaint(
        painter: HeartCustomPainter(),
      )
      )
    );
  }
}