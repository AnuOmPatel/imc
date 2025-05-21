import 'package:get/get.dart';
import 'package:imc_track/screens/profilescreen/controller/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }

}