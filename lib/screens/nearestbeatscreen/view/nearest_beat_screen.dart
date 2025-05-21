import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:imc_track/screens/nearestbeatscreen/controller/nearest_beat_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/appfonts.dart';
import '../../../widgets/drawer_nav.dart';
import '../../homescreen/location/location_controller.dart';

class NearestBeatScreen extends StatelessWidget {
  //final LocationController locationController = Get.put(LocationController());
  final NearestBeatController nearestBeatController =
      Get.put(NearestBeatController());
  final locationController = Get.find<LocationController>();

  NearestBeatScreen({super.key});

  String getBeatIcon(String areaType) {
    if (areaType == "Residencial") {
      return 'assets/r.png';
    } else if (areaType == "Commercial") {
      return 'assets/c.png';
    } else if (areaType == "Slum") {
      return 'assets/s.png';
    } else if (areaType == "Back-Lane") {
      return 'assets/b.png';
    } else if (areaType == "Industrial") {
      return 'assets/i.png';
    } else if (areaType == "Mechanical") {
      return 'assets/o.png';
    } else if (areaType == "Mixed") {
      return 'assets/h.png';
    } else if (areaType == "Hybrid") {
      return 'assets/h.png';
    } else {
      return 'assets/o.png';
    }
  }

  String getEmpIcon(String empType) {
    if (empType == "Permanent") {
      return 'assets/emp_p.png';
    } else if (empType == "Muster") {
      return 'assets/emp_m.png';
    } else if (empType == "Viniyamit") {
      return 'assets/emp_v.png';
    } else {
      return 'assets/emp_o.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearest Beats",style: AppFonts.Montserrat.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,))
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: locationController.currentPosition.value,
                  zoom: 18.0,
                ),
                onMapCreated: locationController.setMapController,
                onTap: (_) {
                  // Clear selection on map tap
                  locationController.selectedEmpList.clear();
                  locationController.selectedBeatData.value = null;
                },
                polylines: locationController.beatPolylines,
                markers: {
                  Marker(
                    markerId: MarkerId("Current Location"),
                    position: locationController.currentPosition.value,
                  ),
                  ...locationController.beatMarkers.value,
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
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
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 16,
                     fontWeight: FontWeight.bold,

                     // textAlign: TextAlign.center,
                    ),
                      textAlign: TextAlign.center,
                    ),
                    // SizedBox(height: 5),
                    Obx(() => Text(
                          locationController.address.value,
                          textAlign: TextAlign.center,
                      style: AppFonts.Montserrat.copyWith(
                        fontSize: 14,

                        // textAlign: TextAlign.center,
                      ),

                        )),
                    //  SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Obx(() => locationController.selectedEmpList.isNotEmpty
                  ? Container(
                      height: 300,
                      margin: EdgeInsets.all(10),
                      //padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 5),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: locationController.selectedEmpList.length,
                        itemBuilder: (context, index) {
                          final emp = locationController.selectedEmpList[index];
                          return InkWell(
                            onTap: (){
                              Get.toNamed('/viewBeatByEmpScreen', arguments: {'empid':emp.empId});
                            },
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: emp.workingStatus == "Current Beat"
                                      ? Colors.green.shade700
                                      : Colors.grey.shade700,
                                  // Change color based on condition
                                  width: 3,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 10.0,
                                    top: 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // padding: EdgeInsets.only(left: -16, right: -16),
                                        Image.asset(
                                          getBeatIcon(locationController
                                                  .selectedBeatData
                                                  .value
                                                  ?.areaType
                                                  ?.toString() ??
                                              'Other'),
                                          width: 24,
                                          height: 24,
                                        ),
                                        SizedBox(width: 6),
                                        Text(emp.employeeId ?? '',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 16,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,

                                              // textAlign: TextAlign.center,
                                            ),
                                        ),
                                        Spacer(),
                                        Text(
                                            "${locationController.selectedBeatData.value?.distance?.toString()} Mtrs",
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,

                                              // textAlign: TextAlign.center,
                                            ),
                                        ),
                                        Image.asset(
                                          getEmpIcon(
                                              emp.employeeType?.toString() ??
                                                  'Muster'),
                                          width: 30,
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                    //SizedBox(height: 6),
                                    Row(children: [
                                      Text("Name: ",
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                            // textAlign: TextAlign.center,
                                          ),

                                      ),
                                      Expanded(
                                          child: Text(
                                        "${emp.employeeName} / ${emp.fatherName}" ??
                                            '',
                                        style: TextStyle(fontSize: 12),
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ]),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Zone/Ward: ",
                                                  style: AppFonts.Montserrat.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  ),
                                              Text(
                                                  "${locationController.selectedBeatData.value?.zoneId?.toString()}/${locationController.selectedBeatData.value?.wardId?.toString()}" ??
                                                      '',
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              print("calling dialer");
                                              final number =
                                                  emp.mobileNo?.toString();
                                              print("calling dialer" +
                                                  number.toString());
                                              if (number != null &&
                                                  number.isNotEmpty) {
                                                final Uri url =
                                                    Uri.parse('tel:$number');
                                                if (await canLaunchUrl(url)) {
                                                  await launchUrl(url,
                                                      mode: LaunchMode
                                                          .externalApplication);
                                                } else {
                                                  print(
                                                      "Cannot launch phone dialer");
                                                }
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/phone.png',
                                                  width: 24,
                                                  height: 24,
                                                ),
                                                //Text("Mobile: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                                Text(
                                                    emp.mobileNo?.toString() ??
                                                        '',
                                                  style: AppFonts.Montserrat.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Main beat: ",
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              Text(emp.mainBeatName ?? '',
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Sub-Beat: ",
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              Text(emp.subBeatName ?? '',
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(children: [
                                      Text("Beat Name: ",
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      Expanded(
                                          child: Text(
                                        "${locationController.selectedBeatData.value!.beetName}" ??
                                            '',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ]),
                                    Row(children: [
                                      Text("Start: ",
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      Expanded(
                                          child: Text(
                                        locationController.selectedBeatData.value!
                                                .startLocation! ??
                                            '',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ]),
                                    Row(children: [
                                      Text("End: ",
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      Expanded(
                                          child: Text(
                                        locationController.selectedBeatData.value!
                                                .endLocation! ??
                                            '',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                    ]),
                                    //SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Time: ",
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              Text(
                                                  "${locationController.selectedBeatData.value?.shiftStartTime?.toString()}-${locationController.selectedBeatData.value?.shiftEndTime?.toString()}" ??
                                                      '',
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Status: ",
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              Text(emp.workingStatus ?? '',
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Shift: ",
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              Text(emp.workingShift ?? '',
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text("Week Off: ",
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              Text(emp.weekOffDay ?? '',
                                                style: AppFonts.Montserrat.copyWith(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Working Days: ",
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                       Expanded(child: Text(
                                         (emp.workingDay ?? []).join(', '),
                                         style: AppFonts.Montserrat.copyWith(
                                           fontSize: 12,
                                           color: Colors.black,
                                         ),
                                         softWrap: true,
                                       ))
                            
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox()),
            )
          ],
        ),
      ),
    );
  }
}
