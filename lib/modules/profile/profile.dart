import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/widgets/custom_avatar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CustomAvatar(
                onTap: () {},
                size: 70,
                borderRadius: 15,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mattstacey",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("+012345678", style: TextStyle(fontSize: 15, color: Colors.grey))
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Text("Personal Information"),
          SizedBox(height: 30),
          ProfileItem(
            icon: EvaIcons.pin,
            onTap: () {},
            title: "Location",
          ),
          SizedBox(height: 20),
          ProfileItem(
            icon: EvaIcons.giftOutline,
            onTap: () {},
            title: "Payment",
          ),
          SizedBox(height: 20),
          ProfileItem(
            icon: EvaIcons.infoOutline,
            onTap: () {},
            title: "Information",
          ),
          SizedBox(height: 20),
          ProfileItem(
            icon: EvaIcons.shieldOutline,
            onTap: () {},
            title: "Security",
          ),
          SizedBox(height: 20),
          ProfileItem(
            icon: EvaIcons.settings,
            onTap: () {},
            title: "Setting",
          ),
          SizedBox(height: 20),
          ProfileItem(
            icon: EvaIcons.logOutOutline,
            onTap: () {},
            title: "Log out",
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  ProfileItem({this.onTap, this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: Get.width,
        child: Row(
          children: <Widget>[
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2), offset: Offset(1, 2), blurRadius: 0.2)
              ]),
              child: Icon(
                icon,
                color: Colors.black,
                size: 15,
              ),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(EvaIcons.chevronRight),
          ],
        ),
      ),
    );
  }
}
