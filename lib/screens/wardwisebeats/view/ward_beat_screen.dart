import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc_track/screens/createdbeatsscreen/controller/created_beat_controller.dart';
import 'package:imc_track/screens/wardwisebeats/controller/ward_beat_controller.dart';
import 'package:imc_track/widgets/drawer_nav.dart';

class WardWiseBeatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final WardWiseBeatController wardWiseBeatController =
        Get.put(WardWiseBeatController());
    // final BeatPageController beatController = Get.find<BeatPageController>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Beats in the Ward"),
        ),
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Obx(() {
            return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(22.7196, 75.8577),
                  zoom: 20,
                ),
                onMapCreated: (controller) {
                  wardWiseBeatController.setMapController(controller);

                  // Move the camera after map is created and center is ready
                  final center = wardWiseBeatController.mapCenter.value;
                  if (center != null) {
                    controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(target: center, zoom: 18),
                      ),
                    );
                  }
                },
                onTap: (_) {
                  // Clear selection on map tap
                },
                polylines: wardWiseBeatController.beatPolylines,
            markers: {
            ...wardWiseBeatController.beatMarkers.value,
            });
          }),
        ));
  }
}
