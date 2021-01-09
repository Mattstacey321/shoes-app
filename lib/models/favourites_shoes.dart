import 'package:flutter/material.dart';
import 'package:shoes_app/models/shoes_model.dart';

class FavouriteShoes {
  ShoesModel shoes;
  DateTime createdAt;
  FavouriteShoes({@required this.shoes, @required this.createdAt});
}
