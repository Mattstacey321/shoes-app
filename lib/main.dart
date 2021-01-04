import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoes_app/modules/base/base_page.dart';
import 'package:shoes_app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: SafeArea(child: BasePage()),
    );
  }
}
