import 'package:get/get.dart';

import '../../createdbeatsscreen/controller/created_beat_controller.dart';
import '../../wardwisebeats/controller/ward_beat_controller.dart';
import '../controller/employee_controller.dart';

class EmployeesBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeesController());
    Get.lazyPut<CreatedBeatController>(() => CreatedBeatController());

    // Also register WardWiseBeatController
    Get.lazyPut<WardWiseBeatController>(() => WardWiseBeatController());
  }

}