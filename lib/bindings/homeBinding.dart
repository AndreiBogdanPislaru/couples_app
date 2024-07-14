import "package:get/get.dart";
import "package:heart_bit_love/controllers/homeController.dart";

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController() );
  }
}