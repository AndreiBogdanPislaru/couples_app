import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_bit_love/bindings/homeBinding.dart';
import 'package:heart_bit_love/bindings/introBinding.dart';
import 'package:heart_bit_love/pages/home.dart';
import 'package:heart_bit_love/pages/intro.dart';

import 'Translations/translations.dart';
GlobalKey prv = GlobalKey();


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Andrei <3 Giulia',
      initialRoute: '/pages',
      getPages: [
        GetPage(name: '/pages', page: () => Intro(), binding: IntroBinding()),
        GetPage(name: '/home', page: () => Home(), binding: HomeBinding())
      ],
    );
  }
}
