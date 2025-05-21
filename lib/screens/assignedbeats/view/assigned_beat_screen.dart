import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_track/network/responses/assignedbeats/assigned_beats_response.dart';
import 'package:imc_track/screens/assignedbeats/controller/assigned_beat_controller.dart';

import '../../../utils/appfonts.dart';
import '../../../widgets/drawer_nav.dart';

class AssignedBeatScreen extends StatelessWidget {
  final AssignedBeatController assignedBeatController =
  Get.put(AssignedBeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assigned Beats"),
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  assignedBeatController.filterBeatsByName(value);
                },
                decoration: InputDecoration(
                  hintText: "Search here",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
               /* if (assignedBeatController.loading.value) {
                  return const Center(child: CircularProgressIndicator());
                }*/

                if (assignedBeatController.beatListAll.isEmpty) {
                  return const Center(child: Text("No Beats found."));
                }
                return ListView.builder(
                    itemCount: assignedBeatController.filteredList.length,
                    itemBuilder: (context, index) {
                      return BeetCard(
                          assignedBeatData: assignedBeatController.filteredList[index]);
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }


}
class BeetCard extends StatelessWidget {
  final AssignedBeatData assignedBeatData;

  const BeetCard({Key? key, required this.assignedBeatData}) : super(key: key);

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
          color: hexToColor(assignedBeatData.color.toString()),
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
                  getAssetForColor(assignedBeatData.color),
                  width: 24,
                  height: 24,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${assignedBeatData.distance.toString()} Mtrs",
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


            Row(
              children: [
                Text(
                  "Main Beat Name: ",
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${assignedBeatData.mainBeetName}",
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "Sub-Beat Number: ",
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${assignedBeatData.subBeetName}",
                  style: AppFonts.Montserrat.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

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
                    "${assignedBeatData.beetName}",
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
                    "${assignedBeatData.startLocation}",
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
                    "${assignedBeatData.endLocation}",
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
