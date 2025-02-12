import 'package:get/get.dart';
import 'package:imc_track/screens/splashscreen/controller/SplashController.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }

}