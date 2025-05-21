import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_track/network/responses/unassignedbeatresponse/un_assigned_beat_response.dart';
import 'package:imc_track/screens/unassignedbeats/controller/unassigned_beat_controller.dart';
import 'package:imc_track/widgets/drawer_nav.dart';

import '../../../routes/routes.dart';
import '../../../utils/appfonts.dart';

class UnAssignedBeatScreen extends StatelessWidget {
  final UnAssignedBeatController unAssignedBeatController = Get.put(
      UnAssignedBeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Un-Assigned Beat"),),
      drawer: DrawerWidget(),
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(child: Obx(()=>
                  Text("Total Un-Assigned Length: ${unAssignedBeatController.totalDistance.toString()} Mtrs",style: AppFonts.Montserrat.copyWith(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),),
                ),),
                SizedBox(height: 4.0,),
                Container(
                  child: TextField(
                    onChanged: (value) {
                      unAssignedBeatController.filterBeatsByName(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx((){
            /*  if(unAssignedBeatController.loading.value){
                return const Center(child: CircularProgressIndicator(),);
              }*/
              if(unAssignedBeatController.beatListAll.isEmpty){
                return const Center(child: Text("No Beats Available"),);
              }
              return ListView.builder(
                itemCount: unAssignedBeatController.filteredList.length,
                  itemBuilder: (context, index){
                  return BeetCard(unAssignedBeetData: unAssignedBeatController.filteredList[index]);
                  });
            }),

          ),
        ],
      ),),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity, // Full-width
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0835C9), Color(0xFF0CDEFA)],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.unassignedBeatMapScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Text(
                "Click to Open Map",
                style: AppFonts.Montserrat.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
class BeetCard extends StatelessWidget {
  final UnAssignedBeetData unAssignedBeetData;

  const BeetCard({Key? key, required this.unAssignedBeetData}) : super(key: key);

  String getAssetForColor(String color) {
    switch (color.toUpperCase()) {
      case "#11AB0C":
        return 'assets/r.png';
      case "#2515D0":
        return 'assets/c.png';
      case "#0CC0CA":
        return 'assets/s.png';
      case "#CA8C05":
        return 'assets/b.png';
      case "#800080":
        return 'assets/i.png';
      case "#C71A1A":
        return 'assets/o.png';
      case "#000000":
        return 'assets/h.png';
      default:
        return 'assets/o.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: hexToColor(unAssignedBeetData.color.toString()),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Top Row with Flag and Length
            Row(
              children: [
                Image.asset(
                  getAssetForColor(unAssignedBeetData.color),
                  width: 24,
                  height: 24,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${unAssignedBeetData.distance.toString()} Mtrs",
                      style: AppFonts.Montserrat.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.0,)
              ],
            ),
            const SizedBox(height: 6),

            /// Beat Name
            Row(
              children: [
                Text(
                  "Beat Name: ",
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${unAssignedBeetData.beetName}",
                    style: AppFonts.Montserrat.copyWith(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            /// Start
            Row(
              children: [
                Text(
                  "Start: ",
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${unAssignedBeetData.startLocation}",
                    style: AppFonts.Montserrat.copyWith(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            /// End
            Row(
              children: [
                Text(
                  "End: ",
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${unAssignedBeetData.endLocation}",
                    style: AppFonts.Montserrat.copyWith(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
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

}