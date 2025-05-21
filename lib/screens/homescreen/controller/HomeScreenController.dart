import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_track/network/requests/dash_board_data_request.dart';
import 'package:imc_track/network/requests/ward_master_request.dart';
import 'package:imc_track/network/responses/dash_board_data_response.dart';
import 'package:imc_track/network/retrofit/api_client.dart';

import '../../../network/responses/login_response/login_response.dart';
import '../../../network/responses/ward_master_response/ward_master_response_by_zones.dart';
import '../../../session_manager.dart';
import '../../../utils/dialog_helper.dart';

class HomeScreenController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var position = ''.obs;
  var mobile = ''.obs;

  var zones = <Zones>[].obs;
  var selectedZone = Rx<Zones?>(null);

  RxBool loading = false.obs;

  var wards = <Ward>[].obs;
  var selectedWard = Rx<Ward?>(null);
  var dashboardData = DashboardData().obs;
  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    try {
      print("inside load user data");
      final data = await SessionManager.getLoginData();

      name.value = data['full_name'] ?? '';
      email.value = data['email'] ?? '';
      position.value = data['position'] ?? '';
      mobile.value = data['mobile_no'] ?? '';

      print("Raw zones data: ${data['zones']}");
      print("Zones type: ${data['zones']?.runtimeType}");

      if (data['zones'] is List<Zones>) {
        zones.assignAll(data['zones']);
        selectedZone.value = zones.isNotEmpty ? zones.first : null;
        if (selectedZone.value != null) {
          await SessionManager.setZoneId(selectedZone.value!.zoneId!.toString());
          await getWardList(selectedZone.value!.zoneId!.toString());
        }
      } else {
        print("Zones data is not a List<Zones>");
      }
    } catch (e) {
      print("Error in loadUserData: $e");
    } finally {

    }
  }


  Future<void> getWardList(String zone_id) async {

    try {
      print("inside try");
      final request = WardMasterRequestByZone(
        action: 'view_ward_master_by_zone',
        zone_id: zone_id,
      );
      print("calling api for ward");
      print("Sending request: ${jsonEncode(request.toJson())}");
      // Make the API call
      final response = await ApiClient.apiService.viewWardByZones(request);
      print("called api ");
      var decoded;
      if (response is String) {
        decoded = json.decode(response);
      } else {
        decoded = response;
      }

      // Parse the decoded response
      final wardMasterResponse = WardMasterResponseByZone.fromJson(decoded);

      if (wardMasterResponse.status == true &&
          wardMasterResponse.result != null) {
        //SnackbarHelper.showSnackbar(title: "Success", message: wardMasterResponse.message ?? "Login successful");
        final wardList = wardMasterResponse.result?.data ?? [];
        wards.assignAll(wardList);
        selectedWard.value = wardList.isNotEmpty ? wardList.first : null;
        // selectedWard.value = null;
        if (wardList.isNotEmpty) {
          selectedWard.value = wardList.first;
          await SessionManager.setWardId(selectedWard.value!.wardId!.toString());
          // Automatically trigger the dashboard API here
          getDashboardData(
            selectedZone.value?.zoneId ?? 0,
            selectedWard.value?.wardId ?? 0,
          );
        }

        // Now you can use wards list however you want
       /* for (var ward in wards) {
          print("Ward ID: ${ward.wardId}, Ward Name: ${ward.wardName}");
        }*/
      } else {
        Get.snackbar("Error", wardMasterResponse.message ?? "No data received");
      }
    } catch (e) {
      print("Error occurred: $e");
      Get.back();
      Get.defaultDialog(
        title: "Error",
        content: Text("Login failed: ${e.toString()}"),
      );
    }
  }

  Future<void> getDashboardData(int zoneId, int wardId) async {
    loading.value = true;
    DialogHelper.showLoading();

    try {
      print("inside dash board api try");
      final request = DashBoardDataRequest(
        action: 'dashboard_data',
        zoneId: zoneId,
        wardId: wardId,
        employeeId: 1,
      );
      print("Sending request dash board api : ${jsonEncode(request.toJson())}");
      // Make the API call
      final response = await ApiClient.apiService.viewDashboardData(request);
      print("called api dash board api");
      var decoded;
      if (response is String) {
        decoded = json.decode(response);
      } else {
        decoded = response;
      }

      // Parse the decoded response
      final dashboardResponse = DashBoardDataResponse.fromJson(decoded);

      if (dashboardResponse.status == true &&
          dashboardResponse.result != null) {
        //SnackbarHelper.showSnackbar(title: "Success", message: wardMasterResponse.message ?? "Login successful");
        final dashBoardData = dashboardResponse.result?.dashboardData ?? [];
        dashboardData.value = dashboardResponse.result?.dashboardData?.first ?? DashboardData();

      } else {
        Get.snackbar("Error", dashboardResponse.message ?? "No data received");
      }
    } catch (e) {
      print("Error occurred: $e");
      Get.back();
      Get.defaultDialog(
        title: "Error",
        content: Text("failed: ${e.toString()}"),
      );
    }
    finally {
      loading.value = false;
      DialogHelper.dismissDialog();
    }
  }
}
