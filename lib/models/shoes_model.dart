import 'package:flutter/material.dart';
import 'package:shoes_app/models/brands_model.dart';
import 'package:shoes_app/models/shoes_galeries.dart';
import 'package:shoes_app/models/shoes_size_model.dart';

class ShoesModel {
  String prodId;
  String name;
  String image;
  String description;
  List<ShoesSizeModel> sizes; // in inches
  double price;
  BrandsModel brand;
  double starPoint;
  Color mainColor;
  List<ShoesGalery> galeries;
  ShoesModel(
      {this.prodId,
      this.name,
      this.image,
      this.description,
      this.sizes,
      this.price,
      this.brand,
      this.starPoint,
      this.galeries,
      this.mainColor});
}
