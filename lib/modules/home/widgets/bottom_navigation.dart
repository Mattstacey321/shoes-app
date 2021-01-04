import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:shoes_app/modules/base/base_controller.dart';

class CustomBottomNavigationBar extends GetView<BaseController> {
  final int index;
  CustomBottomNavigationBar({this.index});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      currentIndex: controller.currentIndex.value,
      onTap: (index) => controller.changePage(index),
      items: [
        BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline), activeIcon: Icon(EvaIcons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(EvaIcons.heartOutline),
            activeIcon: Icon(EvaIcons.heart),
            label: "Favourite"),
        BottomNavigationBarItem(
            icon: Icon(EvaIcons.shoppingBagOutline),
            activeIcon: Icon(EvaIcons.shoppingBag),
            label: "Your bag"),
        BottomNavigationBarItem(
            icon: Icon(EvaIcons.peopleOutline), activeIcon: Icon(EvaIcons.people), label: "Profile")
      ],
    );
  }
}
