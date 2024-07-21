import 'dart:async';
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

class IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animationColor1;
  late Animation<Color?> _animationColor2;
  late Timer _timer;
  Color _firstColor = Colors.yellow;
  Color _secondColor = Colors.red;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
      upperBound: 1,
      lowerBound: 0,
    );

    _animationColor1 = ColorTween(
      begin: Colors.yellow,
      end: Colors.red,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationColor2 = ColorTween(
      begin: Colors.red,
      end: Colors.yellow,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _timer = Timer.periodic(Duration(milliseconds: 400), (timer) {
      setState(() {
        _firstColor = _firstColor == Colors.yellow ? Colors.red : Colors.yellow;
        _secondColor = _secondColor == Colors.red ? Colors.yellow : Colors.red;
      });
    });

    //_animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animationController,
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .5,
            child: Align(
              alignment: Alignment.center,
              child: CustomPaint(
                painter: HeartCustomPainter(
                    firstColor: _firstColor, secondColor: _secondColor),
              ),
            ),
          ),
          builder: (context, child) => Transform(
            transform: Matrix4.identity(),
            child: child,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Get.toNamed('/home');
            },
            child: Text("Avanti >>",
            style: TextStyle(color: Colors.red,
            fontSize: 37, fontWeight: FontWeight.w900),),
          ),
        )
      ],
    );
  }
}
