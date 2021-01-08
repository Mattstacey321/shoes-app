import 'package:shoes_app/models/shoes_model.dart';

class ShoesBagModel {
  String prodId;
  int quantity;
  double price;
  ShoesModel info;
  ShoesBagModel({this.prodId, this.quantity, this.price, this.info});
}
