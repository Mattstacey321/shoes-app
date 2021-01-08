import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(EvaIcons.heartOutline, size: 80),
          SizedBox(height: 10),
          Text(
            "No favourite",
            style: TextStyle(fontSize: 15),
          )
        ],
      )),
    );
  }
}
