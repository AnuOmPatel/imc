import 'package:get/get.dart';
import 'package:imc_track/screens/homescreen/controller/HomeScreenController.dart';
import 'package:imc_track/screens/nearestbeatscreen/controller/nearest_beat_controller.dart';

class NearestBeatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NearestBeatController());
  }

}