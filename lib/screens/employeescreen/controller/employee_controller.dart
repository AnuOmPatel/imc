import 'dart:convert';

import 'package:get/get.dart';
import 'package:imc_track/network/requests/emp_list_request.dart';
import 'package:imc_track/network/responses/emp_list_response/emp_list_response.dart';
import 'package:imc_track/utils/dialog_helper.dart';

import '../../../network/retrofit/api_client.dart';
import '../../../session_manager.dart';

class EmployeesController extends GetxController {
  var zoneId = ''.obs;
  var wardId = ''.obs;
  RxBool loading = false.obs;
 RxList<Employee> empListAll =<Employee>[].obs;
  RxList<Employee> filteredEmpList =<Employee>[].obs;
  @override
  void onInit() {
    super.onInit();
    getStoredZoneAndWard();
  }

  Future<void> getStoredZoneAndWard() async {
    final storedZoneId = await SessionManager.getZoneId();
    final storedWardId = await SessionManager.getWardId();

    zoneId.value = storedZoneId ?? '';
    wardId.value = storedWardId ?? '';

    print('Zone ID: $zoneId, Ward ID: $wardId');

    if (zoneId.isNotEmpty && wardId.isNotEmpty) {
      fetchEmpList(int.parse(zoneId.value), int.parse(wardId.value));
    }
  }

  Future<void> fetchEmpList(int zoneId, int wardId) async {
    try {
      loading.value = true;
      DialogHelper.showLoading();
      final request = EmployeeListRequest(
          action: "employee_list", zoneId: zoneId, wardId: wardId);

      final response = await ApiClient.apiService.viewAllEmpWard(request);
      final jsonData = response is String ? jsonDecode(response) : response;
      final employeeListResponse = EmployeeListResponse.fromJson(jsonData);
      final List<Employee> empListAllReceived =
          employeeListResponse.result?.employeeList ?? [];

      if(empListAllReceived!=null){
        empListAll.assignAll(empListAllReceived);
        filteredEmpList.assignAll(empListAllReceived);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch beats: $e");
    } finally {
      loading.value = false;
      DialogHelper.dismissDialog();
    }
  }

  void filterEmpByName(String query) {
    if (query.isEmpty) {
      filteredEmpList.assignAll(empListAll);
    } else {
      final lowerQuery = query.toLowerCase();
      filteredEmpList.assignAll(
          empListAll.where((employee) => (employee.employeeName.toLowerCase().contains(lowerQuery))));
    }
  }
}
