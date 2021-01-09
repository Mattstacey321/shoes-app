import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/constants/app_get_id.dart';
import 'package:shoes_app/models/shoes_galeries.dart';

import '../product_detail_controller.dart';

class ShoesGaleryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        assignId: true,
        id: AppGetId.SHOESGALERY,
        builder: (controller) {
          List<ShoesGalery> galeries = controller.shoesGaleries;
          int galeryCount = controller.shoesGaleries.length;
          return Obx(
            () => controller.shoesGaleries.isEmpty
                ? Text("Load")
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: galeryCount,
                    itemBuilder: (context, index) {
                      return  GaleryItem(
                              image: galeries[index].image,
                              isClick: galeries[index].isClick,
                              onTap: () {
                                controller.changeGaleryImage(galeries[index].id);
                              },
                            );
                    },
                  ),
          );
        });
  }
}

class GaleryItem extends StatelessWidget {
  final bool isClick;
  final String image;
  final VoidCallback onTap;
  const GaleryItem({this.isClick, this.image, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    Color galerySelectedColor = Colors.indigo[800];
    double size = 40;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isClick ? galerySelectedColor : Colors.transparent, width: 2),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
