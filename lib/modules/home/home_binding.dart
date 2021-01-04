import 'package:get/get.dart';
import 'package:shoes_app/modules/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
