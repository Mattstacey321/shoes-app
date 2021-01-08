import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shoes_app/constants/app_pages.dart';

class BaseController extends GetxController{
  static BaseController get to => Get.find();
  final pages = [HomePage(), FavouritePage(), BagPage(), ProfilePage()];
  RxInt currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}