import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/constants/app_get_id.dart';
import 'package:shoes_app/models/shoes_model.dart';
import 'package:shoes_app/modules/favourite/favourite_controller.dart';
import 'package:shoes_app/modules/home/home_controller.dart';
import 'package:shoes_app/modules/home/widgets/rounded_tab_indicator.dart';
import 'package:shoes_app/routes/routes.dart';
import 'package:shoes_app/widgets/cirlce_icon.dart';
import 'package:shoes_app/widgets/custom_app_bar.dart';
import 'package:shoes_app/widgets/custom_avatar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      assignId: true,
      id: AppGetId.HOME,
      builder: (controller) => DefaultTabController(
        length: controller.availableBrands.length,
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
                onTap: () {
                  controller.goToProfilePage();
                },
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
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          width: Get.width,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(width: 40),
                            itemCount: controller.listShoes.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(left: 20, right: 10),
                            itemBuilder: (context, index) {
                              final shoes = controller.listShoes[index];
                              return ShoesItem(
                                shoes: shoes,
                                onBookmark: () {
                                  controller.bookmarkShoes(shoes.prodId);
                                },
                                onTap: () {
                                  Get.toNamed(Routes.PRODUCTDETAIL, arguments: shoes.prodId);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Best Choice",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 150,
                        width: Get.width,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(width: 20),
                          itemCount: controller.listShoes.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 20, right: 10),
                          itemBuilder: (context, index) {
                            final shoes = controller.listShoes[index];
                            return ShoesItem(
                              height: 100,
                              width: Get.width / 2,
                              shoes: shoes,
                              onBookmark: () {},
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
              ),
              Center(
                child: Container(
                  child: Text("Adidas"),
                ),
              ),
              Center(
                child: Container(
                  child: Text("Crocs"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShoesItem extends StatelessWidget {
  final ShoesModel shoes;
  final double height;
  final double width;
  final VoidCallback onBookmark;
  final VoidCallback onTap;
  ShoesItem({this.height = 355, this.width = 220, this.shoes, this.onBookmark, this.onTap});
  @override
  Widget build(BuildContext context) {
    String brandName = shoes.brand.name;
    String image = shoes.image;
    String starPoint = shoes.starPoint.toString();
    String price = shoes.price.toString();
    String prodName = shoes.name;
    Color mainColor = shoes.mainColor;
    bool isBookmark = FavouriteController.to.listFavouriteShoes
        .any((element) => element.shoes.prodId == shoes.prodId);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(0, 1), spreadRadius: 0.1)
        ]),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  brandName,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Spacer(),
                Icon(EvaIcons.star, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  starPoint,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                      left: 10,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fitHeight,
                      )),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "$price",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(prodName, style: TextStyle(color: Colors.white))
                  ],
                ),
                Spacer(),
                CircleIcon(
                  child:
                      Icon(isBookmark ? EvaIcons.heart : EvaIcons.heartOutline, color: Colors.pink),
                  onTap: onBookmark,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
