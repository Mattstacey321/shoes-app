import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SlidableRemoveItem extends StatelessWidget {
  final VoidCallback onRemove;
  SlidableRemoveItem({this.onRemove});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              EvaIcons.trash2,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
