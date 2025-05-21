import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {

  static bool get isDialogOpen => Get.isDialogOpen ?? false;
  static void showLoading({String title = "Loading.."}) {
    Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              15.0,
            ),
            child: Container(
              height: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(title),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
    );


  }

  static void dismissDialog(){
    if (isDialogOpen) {
      Get.back();
    }
  }
}
