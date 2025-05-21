import 'package:get/get.dart';

import '../controller/assigned_beat_controller.dart';

class AssignedBeatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AssignedBeatController());
  }

}