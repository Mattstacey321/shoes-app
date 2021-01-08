import 'package:bot_toast/bot_toast.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shoes_app/models/shoes_galeries.dart';
import 'package:shoes_app/models/shoes_model.dart';
import 'package:shoes_app/models/shoes_size_model.dart';
import 'package:shoes_app/modules/bags/bag_controller.dart';
import 'package:shoes_app/modules/base/base_controller.dart';
import 'package:shoes_app/services/shoes_services.dart';
import 'package:shoes_app/utils/enum_loading_result.dart';
import 'package:shoes_app/widgets/loading_button.dart';

class ProductDetailController extends GetxController {
  final String _prodId;
  ProductDetailController(String prodId) : _prodId = prodId;
  ShoesServices _shoesServices = ShoesServices();
  final shoes = ShoesModel().obs;
  var shoesGaleries = <ShoesGalery>[].obs;
  var shoesSizes = <ShoesSizeModel>[].obs;
  var loadingResult = LoadingResult.loading.obs;
  LoadingButtonController purchaseButton = LoadingButtonController();

  void getShoesInfo() async {
    try {
      shoes.value = await _shoesServices.getShoesInfo(prodId: _prodId);
      shoesGaleries.add(ShoesGalery(image: shoes.value.image, id: shoes.value.prodId));
      // set first image  isClick variable to  true
      shoesGaleries.first.isClick = true;
      shoesGaleries.addAll(shoes.value.galeries);
      // set first shoes size isClick variable to true
      shoesSizes.assignAll(shoes.value.sizes);
      shoesSizes.first.isClick = true;
      update(["shoes-galeries"]);
      loadingResult(LoadingResult.success);
    } catch (e) {
      loadingResult(LoadingResult.fail);
    }
  }

  void changeGaleryImage(String id) {
    shoesGaleries.forEach((item) {
      if (item.id == id)
        item.isClick = true;
      else
        item.isClick = false;
    });
    update(["shoes-galeries", "shoes-detail"]);
  }

  void changeShoesSize(String id) {
    shoesSizes.forEach((item) {
      if (item.id == id)
        item.isClick = true;
      else
        item.isClick = false;
    });
    update(["shoes-size"]);
  }

  void purchaseShoes() async {
    Future.delayed(1.seconds, () {
      BagController.to.onPurchase(shoes.value);
      showPurchaseSuccessNotify();
      purchaseButton.success();
    });
    Future.delayed(2.seconds, () => purchaseButton.reset());
  }

  void showPurchaseSuccessNotify() {
    BotToast.showCustomNotification(
      backButtonBehavior: BackButtonBehavior.close,
      align: Alignment(0, -0.85),
      duration: 5.seconds,
      toastBuilder: (cancelFunc) {
        return GestureDetector(
          onTap: () {
            cancelFunc.call();
            Get.back();
            BaseController.to.changePage(2);
          },
          child: Container(
            height: 40,
            width: 180,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3), offset: Offset(0, 1), blurRadius: 0.2)
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(EvaIcons.checkmarkCircle2, color: Colors.green),
                SizedBox(width: 5),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Add success !"),
                    SizedBox(width: 10),
                    Text("Tap to check your bag",
                        style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void onReady() {
    getShoesInfo();
    super.onReady();
  }

  @override
  void onClose() {
    shoesGaleries.clear();
    shoesSizes.clear();
    super.onClose();
  }
}
