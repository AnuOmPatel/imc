import 'package:get/get.dart';
import 'package:imc_track/screens/mapviewunassigned/controller/unassigned_map_controller.dart';
import 'package:imc_track/screens/unassignedbeats/controller/unassigned_beat_controller.dart';

class UnAssignedBeatMapBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>UnAssignedBeatController());
    Get.lazyPut(()=>UnAssignedBeatMapController());
  }

}