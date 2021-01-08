import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/widgets/cirlce_icon.dart';

class CustomAppBar extends PreferredSize {
  final List<Widget> childs;
  final double height;
  final Widget homeIcon;
  final Widget menu;
  final VoidCallback onTapBack;
  final Color color;
  final Widget tabBar;
  CustomAppBar(
      {@required this.childs,
      this.height = 50,
      this.menu = const SizedBox(),
      this.color = Colors.transparent,
      this.homeIcon: const Icon(EvaIcons.chevronLeft, size: 25),
      this.tabBar,
      this.onTapBack});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.only(right: 0),
      decoration: BoxDecoration(color: color, boxShadow: []),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [for (var widget in childs) widget],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  onTapBack == null
                      ? Container()
                      : CircleIcon(onTap: () => onTapBack(), tooltip: "Back", child: homeIcon),
                  menu
                ],
              ),
            ],
          ),
          tabBar == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: tabBar,
                ),
        ],
      ),
    );
  }
}
