import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  TabController tabController;
  final availableBrands = ["All", "Nike", "Puma"];
  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
