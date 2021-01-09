import 'package:bot_toast/bot_toast.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shoes_app/models/shoes_bag_model.dart';
import 'package:shoes_app/modules/bags/bag_controller.dart';
import 'package:shoes_app/widgets/custom_button.dart';
import 'package:shoes_app/widgets/slidable_remove_item.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BagController>(
      init: BagController(),
      assignId: true,
      id: "your-bag",
      builder: (controller) {
        if (controller.yourBag.isEmpty)
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(EvaIcons.shoppingBagOutline, size: 80),
              SizedBox(height: 10),
              Text(
                "Your bag is empty.",
                style: TextStyle(fontSize: 15),
              )
            ],
          ));
        else {
          var listItem = controller.yourBag;
          int totalItem = controller.yourBag.length;
          num totalMoney = controller.totalMoney;
          return Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Bag",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Check and pay items",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: totalItem,
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return BagItem(
                        key: Key(listItem[index].prodId),
                        shoes: listItem[index],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$totalItem items",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      r'$' " $totalMoney",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    height: 50,
                    width: 180,
                    onPress: () {
                      BotToast.showText(text: "On working feature");
                    },
                    opacity: 1,
                    childs: [
                      Text(
                        "Payment",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

class BagItem extends GetView<BagController> {
  final Key key;
  final ShoesBagModel shoes;
  BagItem({this.key, this.shoes});
  @override
  Widget build(BuildContext context) {
    num shoesSize = shoes.info.sizes.firstWhere((e) => e.isClick == true).size;
    int quantity = shoes.quantity;
    return Slidable(
      key: key,
      actionPane: SlidableDrawerActionPane(),
      closeOnScroll: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: AddMoreShoes(
            quantity: quantity,
            onDecrease: () {
              controller.onDecrease(shoes.prodId);
            },
            onIncrease: () {
              controller.onIncrease(shoes.prodId);
            },
          ),
        ),
      ],
      secondaryActions: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: SlidableRemoveItem(
            onRemove: () => controller.onRemove(shoes.prodId),
          ),
        ),
      ],
      child: Container(
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(shoes.info.name, style: TextStyle(fontSize: 15)),
                    SizedBox(height: 15),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                                text: r'$',
                                style: TextStyle(
                                    color: shoes.info.mainColor, fontWeight: FontWeight.bold)),
                            TextSpan(text: " ${shoes.info.price}")
                          ])),
                          SizedBox(width: 5),
                          VerticalDivider(color: Colors.grey, thickness: 1),
                          SizedBox(width: 5),
                          Text(
                            "${shoes.quantity}X",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                          SizedBox(width: 5),
                          VerticalDivider(color: Colors.grey, thickness: 1),
                          SizedBox(width: 5),
                          Text(
                            "S$shoesSize",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Image.asset(
                shoes.info.image,
                height: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddMoreShoes extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  AddMoreShoes({@required this.quantity, @required this.onDecrease, @required this.onIncrease});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(onTap: onIncrease, child: Icon(EvaIcons.plus, size: 15)),
          SizedBox(height: 5),
          Text(
            "$quantity" "X",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          GestureDetector(onTap: onDecrease, child: Icon(EvaIcons.minus, size: 15))
        ],
      ),
    );
  }
}
