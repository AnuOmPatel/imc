import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../network/requests/near_by_employees_with_beat_request.dart';
import '../../../network/responses/near_by_emp/near_by_employees_with_beat_response.dart';

import '../../../network/retrofit/api_client.dart';
import '../../homescreen/location/location_controller.dart';
import 'package:imc_track/network/responses/nearest_beats/near_by_beats_response.dart'
as beats;
class NearestEmpAndBeatController extends GetxController{
  final locationController = Get.find<LocationController>();

  RxBool isLoading = false.obs;
  RxList<BeetData> beats = <BeetData>[].obs;
  //RxSet<Polyline> polylines = <Polyline>{}.obs;
  final RxList<BeetData> myEmpList = <BeetData>[].obs;
  BitmapDescriptor? beatMarkerIcon;
  //to draw polylines
  final RxSet<Polyline> beatPolylines = <Polyline>{}.obs;
  RxSet<Marker> beatMarkers = <Marker>{}.obs;
  @override
  void onInit() {
    super.onInit();
    ever(locationController.currentPosition, (position){
      if (position != null) {
        fetchNearbyBeatsWithEmployees(
          lat: position.latitude,
          lng: position.longitude,
        );
      }
    });
  }


  Future<void> fetchNearbyBeatsWithEmployees({
    required double lat,
    required double lng,
  }) async {
    isLoading.value = true;

    final coordinates = [
      [
        [
          [lng, lat]
        ]
      ]
    ];
    final request = NearByEmployeesWithBeatRequest(
      action: "view_employee_with_nearest_beet",
      coordinates: coordinates,
    );

    final response =
    await ApiClient.apiService.getNearestEmpandBeats(request);
    final jsonData = response is String ? jsonDecode(response) : response;
    final nearByEmpResponse =
    NearByEmployeesWithBeatResponse.fromJson(jsonData);
    if (nearByEmpResponse.status == true) {
      final List<BeetData>? empList = nearByEmpResponse.result!.data;

      // String imageUrl=empList![0].empData![0].employeePhoto.toString();
      if (empList != null) {
        myEmpList.assignAll(empList);
        loadCustomMarker(empList);
        drawBeatPolylinesAndMarkers();
      } else {
        Get.snackbar("Info", "No beats available nearby.");
      }
    }
    // ... your API logic ...
    isLoading.value = false;
  }
  Future<void> drawBeatPolylinesAndMarkers() async {
    Set<Polyline> polylines = {};
    Set<Marker> markers = {};

    for (var beat in myEmpList) {
      final coordinates = beat.latLngData?.coordinates;
      if (coordinates != null && coordinates.isNotEmpty) {
        final List<LatLng> points = coordinates
            .expand((a) => a)
            .expand((b) => b)
            .map((point) => LatLng(point[1], point[0]))
            .toList();

        if (points.isNotEmpty) {
          print("inside draw polyline");
          // Add polyline
          polylines.add(
            Polyline(
              polylineId: PolylineId("beat_${beat.beetId}"),
              points: points,
              width: 8,
              color: hexToColor(beat.color ?? "#FF0000"),
            ),
          );

          // Compute midpoint for marker
          final midpointIndex = (points.length / 2).floor();
          final midpoint = points[midpointIndex];

          if (beatMarkerIcon != null) {
            print("inside draw marker");
            markers.add(
              Marker(
                markerId: MarkerId("midpoint_${beat.beetId}"),
                position: midpoint,
                icon: beatMarkerIcon!,
                infoWindow: InfoWindow(title: "Beat ${beat.beetId}"),
              ),
            );
          } else {
            print("Error: Marker icon is null");
          }
        }
      }
    }

    // Debug: Print the markers to ensure they are being created
    print("Markers count: ${markers.length}");

    beatPolylines.value = polylines;
    beatMarkers.value = markers; // Update the beatMarkers observable
  }

  Future<void> loadCustomMarker(List<BeetData> empList) async {
    try {
      for (var empDataList in empList) {
        final empData = empDataList.empData;

        if (empData != null && empData.isNotEmpty) {
          for (var emp in empData) {
            if (emp.workingStatus == "Current Beat" && emp.employeePhoto != null) {
              //String imageUrl = emp.employeePhoto!.toString();
              String imageUrl="https://ezismartswitch.com/imc/assets/profile_photo/default_avatar.png".toString();
              print("Loading custom marker for employee: ${emp.employeeName}");

              beatMarkerIcon = await getMarkerIconFromUrl(imageUrl);
              if (beatMarkerIcon != null) {
                print("Custom marker loaded successfully");
                return; // Load only one marker for now. Remove this if you want multiple unique markers per beat.
              }
            }
          }
        }
      }


      beatMarkerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(100, 100)),
        "assets/user.png", // Ensure path is correct
      );
      // Ensure that the icon is not null before using it in the marker
      if (beatMarkerIcon == null) {
        print("Error: The marker icon is null");
      }
    } catch (e) {
      print("Error loading marker icon: $e");
    }
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

  Future<BitmapDescriptor> getMarkerIconFromUrl(String url, {int size = 100}) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final codec = await ui.instantiateImageCodec(bytes, targetWidth: size);
    final frame = await codec.getNextFrame();
    final byteData = await frame.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}