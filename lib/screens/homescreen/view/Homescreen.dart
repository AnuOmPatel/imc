import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_track/network/responses/login_response/login_response.dart';
import 'package:imc_track/network/responses/ward_master_response/ward_master_response_by_zones.dart';
import 'package:imc_track/routes/routes.dart';
import 'package:imc_track/screens/homescreen/controller/HomeScreenController.dart';

import '../../../utils/appfonts.dart';
import '../../../widgets/drawer_nav.dart';
import '../location/location_controller.dart';

class Homescreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  final HomeScreenController homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            //decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 8.0),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Name:",
                            style: AppFonts.Montserrat.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Obx(() => Text(
                                "${homeController.name}",
                                style: AppFonts.Montserrat.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Zones:",
                            style: AppFonts.Montserrat.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: Obx(() {
                              return DropdownButton2<Zones>(
                                isExpanded: true,
                                hint: Text(
                                  "Select a zone",
                                  style: AppFonts.Montserrat.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                underline: SizedBox(),
                                value: homeController.selectedZone.value,
                                items: homeController.zones.map((zone) {
                                  return DropdownMenuItem<Zones>(
                                      value: zone,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                        child: Text(
                                          zone.zoneName ?? 'Unnamed',
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ));
                                }).toList(),
                                onChanged: (newZone) {
                                  if (newZone != null) {
                                    homeController.selectedZone.value = newZone;
                                    homeController.getWardList(homeController
                                        .selectedZone.value!.zoneId!
                                        .toString());
                                  }
                                },
                              );
                            }),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Wards:",
                            style: AppFonts.Montserrat.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: Obx(() {
                              return DropdownButton2<Ward>(
                                isExpanded: true,
                                hint: Text(
                                  "Select a ward",
                                  style: AppFonts.Montserrat.copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                underline: SizedBox(),
                                value: homeController.selectedWard.value,
                                items: homeController.wards.map((ward) {
                                  return DropdownMenuItem<Ward>(
                                      value: ward,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                        child: Text(
                                          ward.wardName ?? 'Unnamed',
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ));
                                }).toList(),
                                onChanged: (newWard) {
                                  if (newWard != null) {
                                    homeController.selectedWard.value = newWard;
                                    homeController.getDashboardData(
                                        homeController
                                            .selectedZone.value!.zoneId!,
                                        homeController
                                            .selectedWard.value!.wardId!);
                                  }
                                },
                              );
                            }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Colors.black26,
                      ),
                  child: Obx(() {
                    final wardDetails = homeController.dashboardData.value;
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.employeeScreen);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 4.0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff046279),
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Total Employees",
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${wardDetails.totalEmployees ?? 0}",
                                              style:
                                                  AppFonts.Montserrat.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50.0,
                                            ),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/emp_count.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 4.0),
                                // height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff44164A),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Total Relievers",
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // marginOnly(left: 4.0,right: 4.0),
                                          Text(
                                            "${wardDetails.totalRelivers ?? 0}",
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50.0,
                                          ),
                                          //Spacer(),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/emp_count.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.createdBeatScreen);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 4.0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xffCB4101),
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Created Sub-Beats",
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${wardDetails.totalBeetsCreated ?? 0}",
                                              style:
                                                  AppFonts.Montserrat.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50.0,
                                            ),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/created_beats.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 4.0),
                                // height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff542807),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Third Party Beats",
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // marginOnly(left: 4.0,right: 4.0),
                                          Text(
                                            "${wardDetails.totalThirdPartyBeets ?? 0}",
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50.0,
                                          ),
                                          //Spacer(),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/marker.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.assignedBeatScreen);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 4.0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff076505),
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Assigned Beats",
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${wardDetails.totalAssignedBeets ?? 0}",
                                              style:
                                                  AppFonts.Montserrat.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50.0,
                                            ),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/assigned.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.unassignedBeatScreen);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 4.0),
                                  // height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff953721),
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Un-assigned Sub-Beats",
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            // marginOnly(left: 4.0,right: 4.0),
                                            Text(
                                              "${wardDetails.totalUnassignedBeets ?? 0}",
                                              style:
                                                  AppFonts.Montserrat.copyWith(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50.0,
                                            ),
                                            //Spacer(),
                                            Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/blank.png'),
                                                  //fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 4.0),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff182B51),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Smallest/Largest Beat",
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${wardDetails.miniLengthBeet ?? 0}/${wardDetails.maxLengthBeet ?? 0}",
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/min_max_length_beat.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 4.0),
                                // height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff44164A),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Covered Area(KM)",
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // marginOnly(left: 4.0,right: 4.0),
                                          Text(
                                            "${wardDetails.totalDistanceCovered ?? 0}",
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50.0,
                                          ),
                                          //Spacer(),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/marker_area.png'),
                                                //fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  //height: 20.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    "Nearest Beats Found",
                    style: AppFonts.Montserrat.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Obx(() {
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: locationController.nearestBeets.length,
                      itemBuilder: (context, index) {
                        final beat = locationController.nearestBeets[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: locationController
                                  .hexToColor(beat.color.toString()),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        maxLines: null,
                                        beat.beetName ?? 'No name',
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 14,
                                          color: Colors.blue[400],
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      maxLines: null,
                                      beat.distance.toString() + ' mtrs' ?? '0',
                                      style: AppFonts.Montserrat.copyWith(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await Get.toNamed(
                                            Routes.nearestBeatScreen);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xff1681A4),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              blurRadius: 10,
                                              spreadRadius: 5,
                                              offset: Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(4.0),
                                        margin: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Show on Map',
                                          style: AppFonts.Montserrat.copyWith(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            maxLines: null,
                                            'Zone: ',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            maxLines: null,
                                            beat.zoneId.toString() ?? '0',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            maxLines: null,
                                            'Ward: ',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            maxLines: null,
                                            beat.wardId.toString() ?? '0',
                                            style: AppFonts.Montserrat.copyWith(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      maxLines: null,
                                      'Start: ',
                                      style: AppFonts.Montserrat.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        maxLines: null,
                                        beat.startLocation.toString() ?? '0',
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      maxLines: null,
                                      'End: ',
                                      style: AppFonts.Montserrat.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        maxLines: null,
                                        beat.endLocation.toString() ?? '0',
                                        style: AppFonts.Montserrat.copyWith(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
