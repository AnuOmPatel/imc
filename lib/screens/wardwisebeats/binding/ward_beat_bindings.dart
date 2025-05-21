import 'package:get/get.dart';
import 'package:imc_track/screens/createdbeatsscreen/controller/created_beat_controller.dart';
import 'package:imc_track/screens/wardwisebeats/controller/ward_beat_controller.dart';

class WardWiseBeatBinding extends Bindings{
  @override
  void dependencies() {
    // Register CreatedBeatController here because WardWiseBeatScreen needs it
    Get.lazyPut<CreatedBeatController>(() => CreatedBeatController());

    // Also register WardWiseBeatController
    Get.lazyPut<WardWiseBeatController>(() => WardWiseBeatController());
  }

}