import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shoes_app/constants/app_get_id.dart';
import 'package:shoes_app/constants/sample_data.dart';
import 'package:shoes_app/modules/base/base_controller.dart';
import 'package:shoes_app/modules/favourite/favourite_controller.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  final availableBrands = ["All", "Nike", "Puma", "Adidas", "Crocs"];
  final listShoes = SampleData.shoesData;
  final RxBool isBookmark = false.obs;
  static const HOME = AppGetId.HOME;

  void goToProfilePage() {
    BaseController.to.changePage(3);
  }

  void bookmarkShoes(String prodId) {
    //listShoes.firstWhere((item) => item.prodId == prodId).isBookmark = true;
    FavouriteController.to.bookmarkShoes(listShoes.firstWhere((item) => item.prodId == prodId));
    update([HOME]);
  }

  @override
  void onInit() {
    tabController = TabController(length: availableBrands.length, vsync: this);
    super.onInit();
  }
}
