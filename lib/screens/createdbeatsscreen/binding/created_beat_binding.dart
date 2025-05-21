import 'package:get/get.dart';
import 'package:imc_track/screens/createdbeatsscreen/controller/created_beat_controller.dart';

class CreatedBeatBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreatedBeatController());
  }

}