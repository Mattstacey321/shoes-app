import 'package:shoes_app/constants/sample_data.dart';
import 'package:get/get.dart';
import 'package:shoes_app/models/shoes_model.dart';

class ShoesServices {
  Future<List<ShoesModel>> getShoesList() async {
    return Future.delayed(2.seconds, () => SampleData.shoesData);
  }

  Future<ShoesModel> getShoesInfo({String prodId}) async {
    return Future.delayed(
        2.seconds, () => SampleData.shoesData.firstWhere((item) => item.prodId == prodId));
  }

}
