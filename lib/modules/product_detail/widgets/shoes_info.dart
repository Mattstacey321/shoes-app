import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shoes_app/models/shoes_model.dart';
import 'package:shoes_app/modules/product_detail/product_detail_controller.dart';
import 'package:shoes_app/modules/product_detail/widgets/shoes_size.dart';
import 'package:shoes_app/widgets/loading_button.dart';

class ShoesInfo extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return ObxValue((res) {
      ShoesModel shoes = res.value;
      return Container(
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xffEBEAED),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150),
              child: Align(
                alignment: Alignment.center,
                child: Divider(
                  thickness: 2,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              shoes.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 20),
            Flexible(child: Text(shoes.description)),
            SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 4.6,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 25,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Size",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  " - Inches",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            ShoesSize(),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Text(
                  r'$' ' ${shoes.price}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Spacer(),
                LoadingButton(
                  controller: controller.purchaseButton,
                  onPressed: () {
                    controller.purchaseShoes();
                  },
                  initialWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add to Bag",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      Icon(EvaIcons.shoppingBagOutline, color: Colors.white),
                    ],
                  ),
                  height: 50,
                  width: 180,
                ),
              ],
            )
          ],
        ),
      );
    }, controller.shoes);
  }
}
