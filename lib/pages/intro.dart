import 'dart:math';

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

class IntroState extends State<Intro> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3000),
        upperBound: 360 * (pi / 180),
        lowerBound: 0
    );

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Container(
            alignment: Alignment.topCenter,
            height: 400,
            child: AnimatedBuilder(
              animation: _animationController,
              child: CustomPaint(
                painter: HeartCustomPainter(),
              ),
              builder: (context, child) => 
                  Transform(
                      transform: Matrix4.identity()..setRotationY(_animationController.value),
                      child: child,
                  ),
            )
        )
    );
  }
}