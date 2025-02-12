import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../controller/SplashController.dart';
class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      //Get.offNamed(Routes.onboardingScreen);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined,size: 100,color: Colors.blue,),
            SizedBox(height: 20,),
            Text('IMC TRACK',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
