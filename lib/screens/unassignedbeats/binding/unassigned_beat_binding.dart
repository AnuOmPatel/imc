import 'package:get/get.dart';

import '../controller/unassigned_beat_controller.dart';

class UnAssignedBeatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> UnAssignedBeatController());
  }

}