import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc_track/network/requests/near_by_beat_request.dart';
import 'package:imc_track/network/requests/near_by_employees_with_beat_request.dart';
import 'package:imc_track/network/responses/near_by_emp/near_by_employees_with_beat_response.dart';
import 'package:imc_track/network/responses/nearest_beats/near_by_beats_response.dart'
    as beats;

import '../../../models/emp_with_beat_model.dart';
import '../../../network/retrofit/api_client.dart';
import '../../../utils/dialog_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;
import 'dart:math' as math;
class LocationController extends GetxController {
  var address = "Fetching location...".obs;
  var isFetching = false.obs;
  RxBool loading = false.obs;
  var currentPosition = Rx<LatLng>(gmaps.LatLng(22.7196, 75.8577));
  GoogleMapController? mapController;

  final RxList<beats.Data> myDataList = <beats.Data>[].obs;
  final RxList<beats.Beet> nearestBeets = <beats.Beet>[].obs;
  StreamSubscription<Position>? _positionStream;
  Timer? _apiTimer;
  final Map<int, BitmapDescriptor> employeeIconCache = {};

  final RxList<BeetData> myBeatDataList = <BeetData>[].obs;
  final RxSet<Polyline> beatPolylines = <Polyline>{}.obs;
  RxSet<Marker> beatMarkers = <Marker>{}.obs;
  BitmapDescriptor? beatMarkerIcon;
  final RxList<EmployeeData> selectedEmpList = <EmployeeData>[].obs;

  final Map<PolylineId, BeetData> polylineToBeatMap = {};

  final Rxn<BeetData> selectedBeatData = Rxn<BeetData>();
  Rxn<PolylineId> highlightedPolylineId = Rxn<PolylineId>();

  @override
  void onInit() {
    super.onInit();
    print("location controller initialized");
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    print("requestLocationPermission initialized");
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      fetchLocation();
    } else {
      address.value = "Location permission denied";
      loading.value = false;
    }
  }

  Future<void> fetchLocation() async {
    print("fetchLocation initialized");

    try {
      _positionStream = Geolocator.getPositionStream(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      ).listen((Position position) {
        currentPosition.value = LatLng(position.latitude, position.longitude);
        getAddressFromCoordinates(position.latitude, position.longitude);
      });
// Get current location once immediately
      final Position initialPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentPosition.value =
          LatLng(initialPosition.latitude, initialPosition.longitude);
      await getAddressFromCoordinates(
          initialPosition.latitude, initialPosition.longitude);
      await requestNearestBeets();

      // Start periodic API call
      _apiTimer = Timer.periodic(Duration(seconds: 100000), (timer) {
        print("calling api for near by beats");
        requestNearestBeets(); // Call your API every 15 seconds
      });

      mapController
          ?.animateCamera(CameraUpdate.newLatLng(currentPosition.value));
    } catch (e) {
      address.value = "Please Turn On GPS";
      loading.value = false;
    }
    finally{
      loading.value = false;
    }
  }

  Future<void> fetchLocationForEmployees() async {
   /* if (loading.value) return;
    loading.value = true;

    if (!DialogHelper.isDialogOpen) DialogHelper.showLoading();*/
    try {
      print("inside fetchLocationForEmployees try");
      _positionStream = Geolocator.getPositionStream(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10, // minimum distance change in meters
        ),
      ).listen((Position position) {
        currentPosition.value = LatLng(position.latitude, position.longitude);
        getAddressFromCoordinates(position.latitude, position.longitude);
      });

      final Position initialPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentPosition.value =
          LatLng(initialPosition.latitude, initialPosition.longitude);
      await getAddressFromCoordinates(initialPosition.latitude, initialPosition.longitude);

      await requestNearestEmployees();

      _apiTimer = Timer.periodic(Duration(seconds: 15), (timer) {
        print("calling api for near by beats");
        requestNearestEmployees(); // Call your API every 15 seconds
      });

      mapController
          ?.animateCamera(CameraUpdate.newLatLng(currentPosition.value));
    } catch (e) {
      print("inside fetchLocationForEmployees catch");
      address.value = "Please Turn On GPS";
      loading.value = false;
    }
    finally{
      loading.value = false;
      DialogHelper.dismissDialog();
    }
  }

  Future<void> getAddressFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address.value = "${place.street}, ${place.subLocality}, ${place.locality}";


        String fullAddress =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
        String? subThoroughfare = place.subThoroughfare;

       //print("Full Address: $fullAddress");
       //print("SubThoroughfare: $subThoroughfare");

        // Example: updating a UI element (like a GetX observable)
        // addressText.value = subThoroughfare ?? "Unknown";


      }
    } catch (e) {
      address.value = "Failed to fetch address";
    }
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> requestNearestBeets() async {

    print("inside requestNearestBeets");
    try {
      loading.value = true;
      DialogHelper.showLoading();
      final coordinates = [
        [
          [
            [currentPosition.value.longitude, currentPosition.value.latitude]
          ]
        ]
      ];

      final request = NearByBeatRequest(
        action: "view_beet_by_lat_lng",
        coordinates: coordinates,
      );

      final response = await ApiClient.apiService.getNearestBeats(request);
      final jsonData = response is String ? jsonDecode(response) : response;
      final beetResponse = beats.NearByBeatsResponse.fromJson(jsonData);

      if (beetResponse.status == true) {
        final List<beats.Data>? dataList = beetResponse.result?.data;
        final List<beats.Beet>? beetList = beetResponse.result?.beet;
        if (dataList != null) {
          myDataList.assignAll(dataList);
        }

        if (beetList != null) {
          nearestBeets.assignAll(beetList);
        }
      } else {
        Get.snackbar("Info", "No beets available nearby.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch nearby beets: $e");
      print("Failed to fetch nearby beets: $e");
    } finally {
      loading.value = false;
      DialogHelper.dismissDialog();
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

  Future<void> requestNearestEmployees() async {
    loading.value = true;
    DialogHelper.showLoading();
    try {
      final coordinates = [
        [
          [
            [currentPosition.value.longitude, currentPosition.value.latitude]
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
        final List<BeetData>? beatDataList = nearByEmpResponse.result!.data;

       // String imageUrl=empList![0].empData![0].employeePhoto.toString();
        if (beatDataList != null) {
          myBeatDataList.assignAll(beatDataList);
          //loadCustomMarker(empList);
          drawBeatPolylinesAndMarkers();
        } else {
          Get.snackbar("Info", "No beats available nearby.");
        }
        loading.value = false;
        DialogHelper.dismissDialog();
      }
    } catch (e) {
      loading.value = false;
      DialogHelper.dismissDialog();
      Get.snackbar("Error", "Failed to fetch nearby beats: $e");
      print("Failed to fetch nearby beets: $e");
    } finally {
      loading.value = false;
      DialogHelper.dismissDialog();
    }
  }


/*  void drawBeatPolylines() {
    Set<Polyline> polylines = {};
    Set<Marker> markers = {};

    for (var beat in myEmpList) {
      final coordinates = beat.latLngData?.coordinates;

      if (coordinates != null && coordinates.isNotEmpty) {
        final List<LatLng> points = coordinates
            .expand((a) => a)
            .expand((b) => b)
            .map((point) => LatLng(point[1], point[0])) // [lng, lat] → [lat, lng]
            .toList();

        if (points.isNotEmpty) {
          // Add polyline
          polylines.add(
            Polyline(
              polylineId: PolylineId("beat_${beat.beetId}"),
              points: points,
              width: 4,
              color: hexToColor(beat.color ?? "#FF0000"),
            ),
          );

          // Add marker at midpoint
          if (beatMarkerIcon != null) {
            final midpoint = points[points.length ~/ 2];
            markers.add(
              Marker(
                markerId: MarkerId("midpoint_${beat.beetId}"),
                position: midpoint,
                icon: beatMarkerIcon!,
                infoWindow: InfoWindow(title: "Beat ${beat.beetId}"),
              ),
            );
          }
        }
      }
    }

    beatPolylines.value = polylines;
    beatMarkers.value = markers;
  }*/


  Future<void> drawBeatPolylinesAndMarkers() async {
    Set<Polyline> polylines = {};
    Set<Marker> markers = {};
    final List<EmployeeWithBeat> empList = [];

    for (var beat in myBeatDataList) {
      final coordinates = beat.latLngData?.coordinates;
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
                selectedEmpList.assignAll(beat.empData ?? []);
                drawBeatPolylinesAndMarkers();
                //highlightedPolylineId.value=polylineId;

              /*
                locationController.selectedBeatData.value = selectedBeat;
                locationController.selectedEmpList.value = selectedBeat?.empData ?? [];*/
              },
            ),
          );
          final midpoint = getMidPoint(points);
          final empDataList=beat.empData??[];
          String imgUrl="https://ezismartswitch.com/imc/assets/profile_photo/default_avatar.png";


          if (empDataList.isNotEmpty) {
            print("Employee Name: ${empDataList[0].employeeName}");
            for (int i = 0; i < empDataList.length; i++) {
              final emp = empDataList[i];
              final offsetPosition = getOffsetLatLng(midpoint, i, empDataList.length);
              final imageUrl = emp.employeePhoto?.isNotEmpty == true
                  ? emp.employeePhoto!
                  : "https://ezismartswitch.com/imc/assets/profile_photo/default_avatar.png";

              final icon = await getMarkerIconFromUrl(imageUrl);
              markers.add(
                Marker(
                  markerId: MarkerId("emp_${emp.empId}"),
                  position: offsetPosition,
                  icon: icon,
                  infoWindow: InfoWindow(title: emp.employeeName, snippet: emp.subBeatName),
                ),
              );
            }
           // imgUrl = empDataList[0].employeePhoto ?? "https://ezismartswitch.com/imc/assets/profile_photo/15096.jpg";
          } else {
            print("No employees found");
            //imgUrl = "https://ezismartswitch.com/imc/assets/profile_photo/15096.jpg";
          }

        }
      }
    }

    print("Markers count: ${markers.length}");

    beatPolylines.value = polylines;
    beatMarkers.value = markers; // Update the beatMarkers observable
    //selectedBeatData.value = empList;
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


  Future<BitmapDescriptor> getMarkerIconFromUrl1(String url, {int size = 100}) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final codec = await ui.instantiateImageCodec(bytes, targetWidth: size);
    final frame = await codec.getNextFrame();
    final byteData = await frame.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }


  Future<BitmapDescriptor> getMarkerIconFromUrl(String url, {int size = 180}) async {
   /* if (empId != null && employeeIconCache.containsKey(empId)) {
      return employeeIconCache[empId]!;
    }*/

    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final codec = await ui.instantiateImageCodec(bytes, targetWidth: size);
    final frame = await codec.getNextFrame();
    final image = frame.image;

    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint()..isAntiAlias = true;

    final radius = size / 2.0;
    final rect = Rect.fromCircle(center: Offset(radius, radius), radius: radius);

    canvas.drawCircle(Offset(radius, radius), radius, paint);
    paint.blendMode = BlendMode.srcIn;
    canvas.drawImageRect(image, Offset.zero & Size(image.width.toDouble(), image.height.toDouble()), rect, paint);

    final circularImage = await pictureRecorder.endRecording().toImage(size, size);
    final byteData = await circularImage.toByteData(format: ui.ImageByteFormat.png);
    final icon = BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());

  /*  if (empId != null) {
      employeeIconCache[empId] = icon;
    }
*/
    return icon;
  }


  LatLng getOffsetLatLng(LatLng base, int index, int total) {
    const double radiusInMeters = 10;
    double angle = (360 / total) * index;
    double dx = radiusInMeters * math.cos(angle * math.pi / 180);
    double dy = radiusInMeters * math.sin(angle * math.pi / 180);

    double newLat = base.latitude + (dy / 111111);
    double newLng = base.longitude + (dx / (111111 * math.cos(base.latitude * math.pi / 180)));

    return LatLng(newLat, newLng);
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



}
