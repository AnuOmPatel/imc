import 'package:get/get.dart';

import '../controller/view_beat_by_emp_controller.dart';

class viewBeatByEmpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ViewBeatByEmpController());
  }

}
