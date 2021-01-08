import 'package:get/get.dart';
import 'package:shoes_app/modules/bags/bag_controller.dart';
import 'package:shoes_app/modules/home/home_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put(() => BagController(),permanent: true);
  }
}
