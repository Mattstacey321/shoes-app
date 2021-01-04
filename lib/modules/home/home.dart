import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/modules/home/home_controller.dart';
import 'package:shoes_app/modules/home/widgets/rounded_tab_indicator.dart';
import 'package:shoes_app/widgets/cirlce_icon.dart';
import 'package:shoes_app/widgets/custom_app_bar.dart';
import 'package:shoes_app/widgets/custom_avatar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: CustomAppBar(
            homeIcon: Icon(EvaIcons.menu2),
            onTapBack: () {},
            childs: [
              Spacer(),
              CircleIcon(
                onTap: () {},
                child: Icon(EvaIcons.searchOutline),
              ),
              CustomAvatar(
                onTap: () {},
                size: 30,
              ),
              GestureDetector(
                child: Icon(EvaIcons.moreVertical, size: 15),
              )
            ],
            tabBar: Container(
              width: Get.width,
              padding: EdgeInsets.only(left: 15),
              height: 30,
              child: Theme(
                data:
                    ThemeData(highlightColor: Colors.transparent, splashColor: Colors.transparent),
                child: TabBar(
                  isScrollable: true,
                  controller: controller.tabController,
                  onTap: (value) {},
                  tabs: controller.availableBrands
                      .map((label) => Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Tab(
                              text: "$label",
                            ),
                          ))
                      .toList(),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  indicatorColor: Colors.black,
                  labelPadding: EdgeInsets.only(left: 0, right: 30, bottom: 8),
                  indicator: RoundedTabIndicator(color: Colors.black, radius: 2),
                ),
              ),
            ),
            height: 90,
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: [
              Center(
                child: Container(
                  child: Text("All"),
                ),
              ),
              Center(
                child: Container(
                  child: Text("Nike"),
                ),
              ),
              Center(
                child: Container(
                  child: Text("Puma"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
