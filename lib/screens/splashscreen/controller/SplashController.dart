import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../session_manager.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    checkSession();
  }


  void checkSession() async {
    await Future.delayed(const Duration(seconds: 2)); // Optional delay
    final data = await SessionManager.getLoginData();

    if (data['email'] != null) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed('/homeScreen');
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Get.offNamed('/loginScreen');
      });
    }
  }
}