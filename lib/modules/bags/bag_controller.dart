import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shoes_app/models/shoes_bag_model.dart';
import 'package:shoes_app/models/shoes_model.dart';

class BagController extends GetxController {
  static BagController get to => Get.find();
  var yourBag = <ShoesBagModel>[].obs;
  var _totalMoney = 0.0.obs;

  double get totalMoney => _totalMoney.value;

  void onPurchase(ShoesModel shoes) {
    if (yourBag.isEmpty) {
      yourBag
          .add(ShoesBagModel(prodId: shoes.prodId, price: shoes.price, quantity: 1, info: shoes));
    } else {
      if(!yourBag.any((item) => item.prodId == shoes.prodId)){
        yourBag.add(
              ShoesBagModel(prodId: shoes.prodId, price: shoes.price, quantity: 1, info: shoes));
      }else{
         yourBag.forEach((item) {
        if (item.prodId == shoes.prodId) {
          item.quantity++;
          item.price += item.quantity * item.price;
        } 
      });
      }
     
    }
    updateTotalMoney(true);
  }

  void onIncrease(String prodId) {
    yourBag.firstWhere((item) => item.prodId == prodId).quantity++;
    updateTotalMoney(true);
  }

  void onDecrease(String prodId) {
    if (yourBag.firstWhere((item) => item.prodId == prodId).quantity == 1) {
      yourBag.removeWhere((item) => item.prodId == prodId);
      _totalMoney.value -= yourBag.firstWhere((item) => item.prodId == prodId).price;
    } else
      yourBag.firstWhere((item) => item.prodId == prodId).quantity--;
    updateTotalMoney(false);
  }

  void onRemove(String prodId) {
    yourBag.removeWhere((item) => item.prodId == prodId);
    updateTotalMoney(false);
  }

  void updateTotalMoney(bool isIncrease) {
    yourBag.forEach((item) {
      isIncrease ? _totalMoney.value += item.price : _totalMoney.value -= item.price;
    });
    update(["your-bag"]);
  }

}
