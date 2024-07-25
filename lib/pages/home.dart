import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_bit_love/controllers/homeController.dart';
import 'package:heart_bit_love/customPainter/drawNote.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final HomeController controller = Get.put(HomeController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.size.value = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROVA PROVA"),
      ),
      body: Align(
        child: Container(
            color: Colors.deepPurple,
            child: Column(
              children: [
                Container(
                  height: controller.size.value!.height / 4,
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      controller.listOfPoints.clear();
                    },
                    child: Text("BOOOOOOOOOOM"),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        color: Colors.yellow,
                        child: Obx(
                          () => CustomPaint(
                            painter:
                                DrawNote(listOfCursorPosition: controller.listOfPoints.value),
                          ),
                        ),
                      ),
                      Container(
                        height: 600,
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            controller.listOfPoints.add(details.localPosition);
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
