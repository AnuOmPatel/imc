
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController{
  var address = "Fetching location...".obs;
  var isFetching = false.obs;
  var isLoading = true.obs;
  var currentPosition = Rx<LatLng>(LatLng(37.7749, -122.4194)); // Default: San Francisco
  GoogleMapController? mapController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      fetchLocation();
    } else {
      address.value = "Location permission denied";
      isLoading.value = false;
    }
  }

  Future<void> fetchLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentPosition.value = LatLng(position.latitude, position.longitude);
      await getAddressFromCoordinates(position.latitude, position.longitude);
      isLoading.value = false;
      mapController?.animateCamera(CameraUpdate.newLatLng(currentPosition.value));
    } catch (e) {
      address.value = "Failed to fetch location";
      isLoading.value = false;
    }
  }

  Future<void> getAddressFromCoordinates(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address.value = "${place.street}, ${place.locality}, ${place.country}";
      }
    } catch (e) {
      address.value = "Failed to fetch address";
    }
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }
}