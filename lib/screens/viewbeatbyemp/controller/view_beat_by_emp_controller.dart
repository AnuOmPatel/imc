import 'dart:convert';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc_track/network/requests/view_beat_by_emp_request.dart';
import 'package:imc_track/network/responses/view_beet_emp_wise_response/view_beats_by_emp_response.dart';

import '../../../network/retrofit/api_client.dart';

class ViewBeatByEmpController extends GetxController{
  RxBool loading = false.obs;
  RxSet<Polyline> beatPolylines = <Polyline>{}.obs;
  GoogleMapController? mapController;

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void onInit() {
    super.onInit();
    final empId = Get.arguments['empid'];
    if (empId != null) {
      fetchBeatsForEmployee(empId);
    }
  }

  Future<void> fetchBeatsForEmployee(int empId) async {
    try {
      loading.value = true;

      final request = ViewBeatsByEmpRequest(
        action: "view_beets_by_employee",
        employeeId: empId,
      );



      final response = await ApiClient.apiService.getBeatsByEmpliyee(request);
      final jsonData = response is String ? jsonDecode(response) : response;
      final beatsByEmpResponse= ViewBeatsByEmpResponse.fromJson(jsonData);
      final List<BeatData> beatDataList = beatsByEmpResponse.result?.data ?? [];

      drawPolylines(beatDataList);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch beats: $e");
    } finally {
      loading.value = false;
    }
  }

  void drawPolylines(List<BeatData> beats) {
    Set<Polyline> newPolylines = {};
    for (var beat in beats) {
      final coordinates = beat.latLngData?.coordinates;
      if (coordinates != null && coordinates.isNotEmpty) {
        final List<LatLng> points = coordinates
            .expand((a) => a)
            .expand((b) => b)
            .map((point) => LatLng(point[1], point[0]))
            .toList();

        if (points.isNotEmpty) {
          newPolylines.add(
            Polyline(
              polylineId: PolylineId("beat_${beat.beetId}_${beat.shiftStartTime}"),
              points: points,
              width: 6,
              color: hexToColor(beat.color ?? "#FF0000"),
            ),
          );
        }
      }
    }
    beatPolylines.value = newPolylines;
  }

  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse('0x$hex'));
  }
}