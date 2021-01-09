import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/constants/app_get_id.dart';
import 'package:shoes_app/models/shoes_size_model.dart';
import 'package:shoes_app/modules/product_detail/product_detail_controller.dart';

class ShoesSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      assignId: true,
      id: AppGetId.SHOESSIZE,
      builder: (controller) {
        int totalSize = controller.shoesSizes.length;
        List<ShoesSizeModel> shoesSizes = controller.shoesSizes;
        return Container(
          height: 50,
          alignment: Alignment.center,
          width: Get.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(width: 20),
              itemCount: totalSize,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ()=> controller.changeShoesSize(shoesSizes[index].id),
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: shoesSizes[index].isClick == true ? Colors.indigo : Colors.transparent,
                      border: Border.all(
                        color:
                            shoesSizes[index].isClick == true ? Colors.transparent : Colors.indigo,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      shoesSizes[index].size.toString(),
                      style: TextStyle(
                          color: shoesSizes[index].isClick == true ? Colors.white : Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
