import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_bit_love/controllers/homeController.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROVA PROVA"),
      ),
      body: Align(
        child: Container(
          color: Colors.deepPurple,
          foregroundDecoration: BoxDecoration.lerp(BoxDecoration(color: Colors.green), BoxDecoration(color: Colors.yellow), 10),
          child: Expanded(
            child: Container(
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }

}