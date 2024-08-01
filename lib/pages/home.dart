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
  List<Color> drawColors = [...Colors.primaries, ...Colors.accents];

  final Map<String, Color> availableColors = {
    "red" : Colors.red,
    "yellow" : Colors.yellow,
    "blue" : Colors.blue,
    "pink" : Colors.pinkAccent.shade100,
    "brown" : Colors.brown,
    "white" : Colors.white,
    "black" : Colors.black,
    "grey" : Colors.grey,
    "green" : Colors.green,
    "orange" : Colors.deepOrange,
    "purple" : Colors.purpleAccent
  };

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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: TextButton(
                          onPressed: () {
                            controller.listsOfPoints.clear();
                          },
                          child: Text("BOOOOOM"),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                          color: Colors.green,
                          child: DropdownButton(
                            items: availableColors.keys.toList().map<DropdownMenuItem<String>>((String color) {
                              return DropdownMenuItem(
                                value: color,
                                  child: Text(color)
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.chosenColor.value = availableColors[value]!;
                            },
                          ),
                        )
                    )
                  ],
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
                            painter: DrawNote(
                                listOfListsOfCursorPosition: controller.listsOfPoints.value,
                                color: controller.chosenColor.value),
                          ),
                        ),
                      ),
                      Container(
                        height: 600,
                        child: GestureDetector(
                          onPanStart: (details) {
                            controller.listsOfPoints
                                .add(<Offset>[details.localPosition]);
                          },
                          onPanUpdate: (details) {
                            controller.listsOfPoints.last
                                .add(details.localPosition);
                            controller.listsOfPoints.refresh();
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
