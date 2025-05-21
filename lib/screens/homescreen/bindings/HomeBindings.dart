import 'package:get/get.dart';
import 'package:imc_track/screens/homescreen/controller/HomeScreenController.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }

}