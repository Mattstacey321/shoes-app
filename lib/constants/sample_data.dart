import 'package:flutter/material.dart';
import 'package:shoes_app/models/brands_model.dart';
import 'package:shoes_app/models/shoes_galeries.dart';
import 'package:shoes_app/models/shoes_model.dart';
import 'package:shoes_app/models/shoes_size_model.dart';

class SampleData {
  static const shoes1 = "assets/shoes/1/nike-air-max-running-jogging.png";
  static const shoes2 = "assets/shoes/2/nike-air-max-sneakers-running.png";
  static const galery1 = "assets/shoes/more_image/1.png";
  static const galery2 = "assets/shoes/more_image/2.png";
  static const galery3 = "assets/shoes/more_image/3.png";
  static const adidasLogo = "assets/brands/adidas.png";
  static const crocsLogo = "assets/brands/crocs.png";
  static const nikeLogo = "assets/brands/nike.png";
  static const pumaLogo = "assets/brands/puma.png";
  static const _listGalery = [galery1, galery2, galery3];
  static const _shoesSizes = [5, 5.5, 6, 6.5, 7];
  static List<ShoesSizeModel> shoesSize = _shoesSizes.map((e) => ShoesSizeModel(id: "${_shoesSizes.indexOf(e)}",size: e)).toList();
  static List<ShoesGalery> shoesGalery =
      _listGalery.map((e) => ShoesGalery(image: e, id: "id${_listGalery.indexOf(e)}")).toList();
  static List<ShoesModel> shoesData = [
    ShoesModel(
        prodId: "prod001",
        brand: BrandsModel(name: "Nike", image: nikeLogo),
        name: "Nike Air Max",
        image: shoes1,
        galeries: shoesGalery,
        price: 120,
        sizes: shoesSize,
        starPoint: 4.2,
        mainColor: Colors.black,
        description:
            "The Nike Air Max combines the exaggerated tongue from the Air Max 180 and classic elements from the Air Max 93. It features Nike's biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks."),
    ShoesModel(
        prodId: "prod002",
        brand: BrandsModel(name: "Crocs", image: crocsLogo),
        name: "Nike Air Max",
        image: shoes2,
        galeries: shoesGalery,
        price: 240,
        mainColor: Colors.blue[800],
        sizes: shoesSize,
        starPoint: 4.6,
        description:
            "The Nike Air Max combines the exaggerated tongue from the Air Max 180 and classic elements from the Air Max 93. It features Nike's biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks."),
    ShoesModel(
        prodId: "prod003",
        brand: BrandsModel(name: "Puma", image: pumaLogo),
        name: "Nike Air Max",
        image: shoes1,
        galeries: shoesGalery,
        mainColor: Colors.black,
        price: 180,
        sizes: shoesSize,
        starPoint: 4.8,
        description:
            "The Nike Air Max combines the exaggerated tongue from the Air Max 180 and classic elements from the Air Max 93. It features Nike's biggest heel Air unit yet for a super-soft ride that feels as impossible as it looks."),
    ShoesModel(
        prodId: "prod004",
        brand: BrandsModel(name: "Adidas", image: adidasLogo),
        name: "Superstart Shoes",
        image: shoes2,
        galeries: shoesGalery,
        price: 165,
        mainColor: Colors.blue[800],
        sizes: shoesSize,
        starPoint: 4.5,
        description:
            "Originally made for basketball courts in the '70s. Celebrated by hip hop royalty in the '80s. The adidas Superstar shoe is now a lifestyle staple for streetwear enthusiasts. The world-famous shell toe feature remains, providing style and protection. Just like it did on the B-ball courts back in the day.")
  ];
}
