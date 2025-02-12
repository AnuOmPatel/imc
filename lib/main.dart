import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_track/routes/app_pages.dart';
import 'package:imc_track/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
    );
  }
}
