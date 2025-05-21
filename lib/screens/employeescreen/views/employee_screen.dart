import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:imc_track/network/responses/emp_list_response/emp_list_response.dart';
import 'package:imc_track/screens/employeescreen/controller/employee_controller.dart';

import '../../../routes/routes.dart';
import '../../../utils/appfonts.dart';
import '../../../widgets/drawer_nav.dart';

class EmployeesScreen extends StatelessWidget {
  EmployeesScreen({super.key});
  final EmployeesController empController = Get.put(EmployeesController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text("All Employees"),
    ),
    drawer: DrawerWidget(),
    body: SafeArea(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              empController.filterEmpByName(value);
            },
            decoration: InputDecoration(
              hintText: "Search here",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        Expanded(
          child: Obx((){
          /*  if (empController.loading.value) {
              return const Center(child: CircularProgressIndicator());
            }*/

            if (empController.empListAll.isEmpty) {
              return const Center(child: Text("No employees found."));
            }

            return ListView.builder(
              itemCount: empController.filteredEmpList.length,
              itemBuilder: (context, index) {
                //final emp = empController.empListAll[index];
                return EmployeeCard(employee: empController.filteredEmpList[index]);

              },
            );
          }

          ),
        ),
      ],
    ),
    ),
     /* bottomNavigationBar: Padding(
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
              Get.toNamed(Routes.wardBeatScreen);
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
      ),*/

    );
    }


}

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.viewBeatByEmpScreen, arguments: {'empid':employee.id});

      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(employee.employeePhoto),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Image.asset('assets/emp_p.png', width: 30, height: 30),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${employee.employeeName} / ${employee.fatherName}", style: AppFonts.Montserrat.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 4),

                        Text("Emp Id: ${employee.employeeId}", style: AppFonts.Montserrat.copyWith(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),),
                        Row(
                          children: [
                            Text("Main Beat: ",
                              style: AppFonts.Montserrat.copyWith(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                            Text("${employee.mainBeetName}" ?? '',
                              style: AppFonts.Montserrat.copyWith(
                                fontSize: 12,
                                color: Colors.black,
                              ),),
                          ],
                        ),

                      ],
                    ),
                  ),

                ],
              ),
             // const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text("Assigned Sub-Beats: ",
                          style: AppFonts.Montserrat.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("${employee.totalAssignedBeets}" ?? '',
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
                        Text("Total Length: ",
                          style: AppFonts.Montserrat.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("${employee.totalDistance} Mtrs" ?? '',
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
                        Text("Min Length: ",
                          style: AppFonts.Montserrat.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("${employee.minDistance} Mtrs" ?? '',
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
                        Text("Max Length: ",
                          style: AppFonts.Montserrat.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("${employee.maxDistance} Mtrs" ?? '',
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
                        Text("Week Off: ",
                          style: AppFonts.Montserrat.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        Expanded(
                          child: Text("${employee.weekOffDay}" ?? '',
                            style: AppFonts.Montserrat.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          softWrap: true,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        print("calling dialer");
                        final number =89789798778;
                        //emp.mobileNo?.toString();
                        print("calling dialer" +
                            number.toString());
                        /*if (number != null &&
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
                          }*/
                       // }
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
                              "${employee.mobileNo}",
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

              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 20,
                  child: Transform.scale(
                    scale: 0.8,
                    child: RatingBarIndicator(
                      rating: employee.employeeRating,
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                ),
              )
            ],
          ),
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

