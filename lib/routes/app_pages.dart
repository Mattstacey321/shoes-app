import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shoes_app/constants/app_pages.dart';
import 'package:shoes_app/modules/base/base_binding.dart';
import 'package:shoes_app/modules/home/home_binding.dart';
import 'package:shoes_app/modules/product_detail/product_detail_page.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = Routes.INITIAL;
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => BasePage(), binding: BaseBinding(), children: [
      GetPage(name: Routes.HOME, page: () => HomePage(),binding: HomeBindings()),
      GetPage(name: Routes.FAVOURITE, page: () => FavouritePage()),
      GetPage(name: Routes.BAG, page: () => BagPage()),
      GetPage(name: Routes.PROFILE, page: () => ProfilePage()),
    ]),
    GetPage(name: Routes.PRODUCTDETAIL, page: ()=> ProductDetail())
  ];
}
