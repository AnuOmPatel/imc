import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
   @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
      Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/homeScreen');
    });
  }
}