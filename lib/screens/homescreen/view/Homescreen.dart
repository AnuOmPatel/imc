import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../location/location_controller.dart';

class Homescreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());

  //const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: locationController.currentPosition.value,
                  zoom: 14.0,
                ),
                onMapCreated: locationController.setMapController,
                markers: {
                  Marker(
                    markerId: MarkerId("Current Location"),
                    position: locationController.currentPosition.value,
                  )
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Current Location",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Obx(() => Text(
                          locationController.address.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        )),
                    SizedBox(height: 10),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Dummy count
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.all(5),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_pin,
                                      size: 30, color: Colors.red),
                                  SizedBox(height: 5),
                                  Text("Place ${index + 1}"),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: locationController.fetchLocation,
                      child: Text("Refresh Location"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      /*body: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                'Your Current Location',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.drkblue),
              ),
              SizedBox(height: 10,),
              Text(
                'Address',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.blue),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),*/
    );
  }
}
