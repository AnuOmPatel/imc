import 'package:get/get.dart';
import 'package:imc_track/screens/homescreen/location/location_controller.dart';

import '../../../session_manager.dart';
import 'dart:convert';
class NearestBeatController extends GetxController{
  final LocationController locationController = Get.find<LocationController>();
  @override
  void onInit() {
    super.onInit();
    print("Nearest controller initialized");
   // await locationController.loadCustomMarker();
    locationController.fetchLocationForEmployees();

  /*  locationController.loadCustomMarker().then((_) {
      locationController.fetchLocationForEmployees();
    });*/
  }


}