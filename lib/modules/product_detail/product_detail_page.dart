import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/constants/app_setting.dart';
import 'package:shoes_app/modules/product_detail/product_detail_controller.dart';
import 'package:shoes_app/modules/product_detail/widgets/shoes_info.dart';
import 'package:shoes_app/utils/enum_loading_result.dart';
import 'package:shoes_app/widgets/cirlce_icon.dart';
import 'package:shoes_app/widgets/custom_app_bar.dart';

import 'widgets/shoes_galery_view.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prodId = Get.arguments as String;
    return GetBuilder<ProductDetailController>(
      init: ProductDetailController(prodId),
      id: "shoes-detail",
      assignId: true,
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
              appBar: CustomAppBar(
                onTapBack: () => Get.back(),
                childs: [
                  Obx(
                    () => controller.shoes.value.prodId == null
                        ? SizedBox()
                        : Image.asset(
                            controller.shoes.value.brand.image,
                            height: 30,
                            width: 100,
                          ),
                  ),
                ],
                menu: CircleIcon(
                  child: Icon(EvaIcons.searchOutline),
                  onTap: () {},
                ),
              ),
              body: Center(
                child: ObxValue(
                  (state) => state.value == LoadingResult.loading
                      ? AppSetting.shoesLoading
                      : state.value == LoadingResult.fail
                          ? Text("Loading fail")
                          : Container(
                              height: Get.height,
                              width: Get.width,
                              child: Stack(
                                children: [
                                  Container(
                                    height: Get.height * 0.4,
                                    padding: EdgeInsets.all(25),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: Get.height * 0.5,
                                          width: 40,
                                          child: ShoesGaleryView()),
                                        SizedBox(width: 10),
                                        Expanded(
                                          flex: 6,
                                          child: Hero(
                                            tag: prodId,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                controller.shoesGaleries.firstWhere((item) => item.isClick == true).image,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DraggableScrollableSheet(
                                    initialChildSize: 0.60,
                                    minChildSize: 0.60,
                                    builder: (context, scrollController) {
                                      return SingleChildScrollView(
                                        controller: scrollController,
                                        child: ShoesInfo(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                  controller.loadingResult,
                ),
              )),
        );
      },
    );
  }
}
