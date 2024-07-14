import 'package:get/get.dart';
import 'package:heart_bit_love/controllers/introController.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }

}