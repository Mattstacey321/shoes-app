import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/modules/base/base_controller.dart';
import 'package:shoes_app/modules/home/widgets/bottom_navigation.dart';
import 'package:shoes_app/widgets/fade_indexed_stack.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      init: BaseController(),
      builder: (controller) {
        return Obx(
          () => Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: FadeIndexedStack(
              children: controller.pages,
              duration: 200.milliseconds,
              index: controller.currentIndex.value,
            ),
          ),
        );
      },
    );
  }
}
