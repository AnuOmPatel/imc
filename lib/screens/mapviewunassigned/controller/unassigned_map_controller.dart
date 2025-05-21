import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc_track/network/responses/unassignedbeatresponse/un_assigned_beat_response.dart';
import 'package:imc_track/screens/unassignedbeats/controller/unassigned_beat_controller.dart';

class UnAssignedBeatMapController extends GetxController{
  GoogleMapController? mapController;
  final UnAssignedBeatController unAssignedBeatController =
  Get.find<UnAssignedBeatController>();
  RxList<UnAssignedBeetData> beatListToShow =<UnAssignedBeetData>[].obs;
  final Map<PolylineId, UnAssignedBeetData> polylineToBeatMap = {};
  Rxn<PolylineId> highlightedPolylineId = Rxn<PolylineId>();
  final Rxn<UnAssignedBeetData> selectedBeatData = Rxn<UnAssignedBeetData>();
  final RxSet<Polyline> beatPolylines = <Polyline>{}.obs;
  RxSet<Marker> beatMarkers = <Marker>{}.obs;

  Rxn<LatLng> mapCenter = Rxn<LatLng>();


  @override
  void onInit() {
    super.onInit();
    beatListToShow.assignAll(unAssignedBeatController.beatListAll);
    drawBeatPolylinesAndMarkers();
  }

  Future<void> drawBeatPolylinesAndMarkers() async {
    Set<Polyline> polylines = {};
    Set<Marker> markers = {};
    //final List<EmployeeWithBeat> empList = [];

    for (var beat in beatListToShow) {
      final coordinates = beat.latLng?.coordinates;
      if (coordinates != null && coordinates.isNotEmpty) {
        final List<LatLng> points = coordinates
            .expand((a) => a)
            .expand((b) => b)
            .map((point) => LatLng(point[1], point[0]))
            .toList();

        final polylineId = PolylineId("beat_${beat.beetId}");
        polylineToBeatMap[polylineId] = beat;

        if (points.isNotEmpty) {

          polylines.add(
            Polyline(
              polylineId: PolylineId("beat_${beat.beetId}"),
              points: points,
              //width: highlightedPolylineId.value == polylineId ? 10 : 5,
              width: 8,
              color: highlightedPolylineId.value == polylineId
                  ? Colors.black87 // highlight color
                  : hexToColor(beat.color ?? "#FF0000"),
              //color: hexToColor(beat.color ?? "#FF0000"),
              consumeTapEvents: true,
              onTap: () {
                highlightedPolylineId.value = polylineId;
                selectedBeatData.value = beat;
                drawBeatPolylinesAndMarkers();
              },
            ),
          );
          final midpoint = getMidPoint(points);
          mapCenter.value = midpoint;
          markers.add(
            Marker(
              markerId: MarkerId("marker_${beat.beetId}"),
              position: midpoint,
              infoWindow: InfoWindow(title: beat.beetName ?? '', snippet: "${beat.distance.toString()} Mtrs"),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta), // Optional: custom color
            ),
          );
        }
      }
    }

    print("Markers count: ${markers.length}");

    beatPolylines.value = polylines;
    beatMarkers.value = markers; // Update the beatMarkers observable
    //selectedBeatData.value = empList;
  }

  Color hexToColor(String hex) {
    // Remove the '#' if it exists
    hex = hex.replaceAll('#', '');

    // If it's 3 digits (e.g., 'EEE'), expand to 6 digits (e.g., 'EEEEEE')
    if (hex.length == 3) {
      hex = hex.split('').map((e) => e * 2).join('');
    }

    // Add 'FF' as the alpha value (fully opaque) if not present
    if (hex.length == 6) {
      hex = 'FF' + hex; // Adds full opacity
    }

    // Now parse the hex value into an integer and create a Color object
    return Color(int.parse('0x$hex'));
  }
  LatLng getMidPoint(List<LatLng> polyPoints) {
    double latSum = 0;
    double lngSum = 0;
    int totalPoints = polyPoints.length;

    for (LatLng point in polyPoints) {
      latSum += point.latitude;
      lngSum += point.longitude;
    }

    return LatLng(latSum / totalPoints, lngSum / totalPoints);
  }
  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }
}