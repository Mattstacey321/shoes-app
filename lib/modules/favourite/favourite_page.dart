import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shoes_app/constants/app_get_id.dart';
import 'package:shoes_app/models/favourites_shoes.dart';
import 'package:shoes_app/modules/favourite/favourite_controller.dart';
import 'package:shoes_app/routes/routes.dart';
import 'package:shoes_app/widgets/slidable_remove_item.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
      init: FavouriteController(),
      assignId: true,
      id: AppGetId.FAVOURITE,
      builder: (controller) {
        int totalFavourite = controller.listFavouriteShoes.length;
        List<FavouriteShoes> listFavourite = controller.listFavouriteShoes;
        if (controller.listFavouriteShoes.isEmpty)
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(EvaIcons.heartOutline, size: 80),
                SizedBox(height: 10),
                Text(
                  "No favourite",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          );
        else
          return Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your favourite",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View and edit your wishlist",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: totalFavourite,
                    itemBuilder: (context, index) {
                      String prodId = listFavourite[index].shoes.prodId;
                      return FavouriteItem(
                        item: listFavourite[index],
                        onTap: () {
                          Get.toNamed(Routes.PRODUCTDETAIL, arguments: prodId);
                        },
                        onRemove: () {
                          controller.removeFavouriteItem(prodId);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
      },
    );
  }
}

class FavouriteItem extends StatelessWidget {
  final FavouriteShoes item;
  final VoidCallback onTap;
  final VoidCallback onRemove;
  const FavouriteItem({@required this.item, @required this.onTap, @required this.onRemove});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        closeOnScroll: true,
        secondaryActions: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SlidableRemoveItem(onRemove: onRemove),
          ),
        ],
        child: Container(
            height: 100,
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey.withOpacity(0.2)),
            child: Row(
              children: <Widget>[
                Image.asset(
                  item.shoes.image,
                  height: 80,
                  width: 80,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      item.shoes.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(EvaIcons.star, color: Colors.amber),
                        SizedBox(width: 5),
                        Text("${item.shoes.starPoint}")
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  EvaIcons.heart,
                  color: Colors.pink,
                )
              ],
            )),
      ),
    );
  }
}
