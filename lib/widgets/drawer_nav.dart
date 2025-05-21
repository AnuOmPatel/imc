// drawer_widget.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_track/screens/homescreen/controller/HomeScreenController.dart';
import 'package:imc_track/session_manager.dart';

import '../routes/routes.dart';
import '../utils/appfonts.dart';

class DrawerWidget extends StatelessWidget {
  final HomeScreenController homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                accountName: Obx(
                  () => Text(
                    "${homeController.name}",
                    style: AppFonts.Montserrat.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                accountEmail: Obx(
                  () => Text(
                    "${homeController.email}",
                    style: AppFonts.Montserrat.copyWith(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildDrawerItem(
                          assetPath: 'assets/Home.png',
                          title: 'Home',
                          onTap: () {
                            Get.back();
                            Get.toNamed('/homeScreen');
                          }),
                      _buildDrawerItem(
                          assetPath: 'assets/Profile.png',
                          title: 'Profile',
                          onTap: () {
                            Get.back();
                            Get.toNamed(Routes.profileScreen);
                          }),
                      _buildDrawerItem(
                          assetPath: 'assets/view_ward.png',
                          title: 'View Ward',
                          onTap: () {
                            Get.back();
                            Get.toNamed(Routes.wardBeatScreen);
                          }),
                      _buildDrawerItem(
                        assetPath: 'assets/near_by_beats.png',
                        title: 'Nearest Beats',
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.nearestBeatScreen);
                        }
                      ),
                      _buildDrawerItem(
                        assetPath: 'assets/log_out.png',
                        title: 'Logout',
                        onTap: () {
                          SessionManager.clearSession();
                          Get.offAllNamed(Routes.loginScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String assetPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Image.asset(
                assetPath,
                width: 24,
                height: 24,
                color: Colors.grey
                    .shade700, // Optional: apply color if image is monochrome
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
