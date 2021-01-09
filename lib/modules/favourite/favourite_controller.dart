import 'package:get/get.dart';
import 'package:shoes_app/constants/app_get_id.dart';
import 'package:shoes_app/models/favourites_shoes.dart';
import 'package:shoes_app/models/shoes_model.dart';

class FavouriteController extends GetxController {
  static FavouriteController get to => Get.find();
  var listFavouriteShoes = <FavouriteShoes>[].obs;
  static const FAVOURITE = AppGetId.FAVOURITE;

  void bookmarkShoes(ShoesModel shoes) {
    if (listFavouriteShoes.isEmpty) {
      listFavouriteShoes.add(FavouriteShoes(shoes: shoes, createdAt: DateTime.now()));
    } else {
      if (listFavouriteShoes.any((item) => item.shoes.prodId == shoes.prodId)) {
        //remove if item existed
        listFavouriteShoes.removeWhere((item) => item.shoes.prodId == shoes.prodId);
      } else
        listFavouriteShoes.add(FavouriteShoes(shoes: shoes, createdAt: DateTime.now()));
    }
    update([FAVOURITE]);
  }

  void removeFavouriteItem(String prodId) {
    listFavouriteShoes.removeWhere((item) => item.shoes.prodId == prodId);
    update([FAVOURITE]);
  }
}
