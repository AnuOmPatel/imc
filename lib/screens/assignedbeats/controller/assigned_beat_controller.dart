import 'dart:convert';

import 'package:get/get.dart';
import 'package:imc_track/network/requests/assigned_beat_request.dart';
import 'package:imc_track/network/responses/assignedbeats/assigned_beats_response.dart';import '../../../network/retrofit/api_client.dart';


import '../../../session_manager.dart';
import '../../../utils/dialog_helper.dart';

class AssignedBeatController extends GetxController{
  var zoneId = ''.obs;
  var wardId = ''.obs;
  RxBool loading = false.obs;
  RxList<AssignedBeatData> beatListAll =<AssignedBeatData>[].obs;
  RxList<AssignedBeatData> filteredList =<AssignedBeatData>[].obs;

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
//action: view_beet_master_by_zone_and_ward
    print('Zone ID: $zoneId, Ward ID: $wardId');

    if (zoneId.isNotEmpty && wardId.isNotEmpty) {
      fetchAssignedBeats(int.parse(zoneId.value), int.parse(wardId.value));
    }
  }

  void fetchAssignedBeats(int zoneId, int wardId) async{
    try {
      loading.value = true;
      DialogHelper.showLoading();
      final request = AssignedBeatRequest(
          action: "view_assigned_beets", zoneId: zoneId, wardId: wardId);

      final response = await ApiClient.apiService.viewAssignedBeats(request);
      final jsonData = response is String ? jsonDecode(response) : response;
      final beatListResponse = AssignedBeatResponse.fromJson(jsonData);
      final List<AssignedBeatData> beatListAllReceived =
          beatListResponse.result?.data ?? [];

      if(beatListAllReceived!=null){
        beatListAll.assignAll(beatListAllReceived);
        filteredList.assignAll(beatListAllReceived);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch beats: $e");
    } finally {
      loading.value = false;
      DialogHelper.dismissDialog();
    }
  }

  void filterBeatsByName(String query) {
    if (query.isEmpty) {
      filteredList.assignAll(beatListAll);
    } else {
      final lowerQuery = query.toLowerCase();
      filteredList.assignAll(
        beatListAll.where((beat) => (beat.beetName.toLowerCase().contains(lowerQuery)) ||
            (beat.startLocation.toLowerCase().contains(lowerQuery)) ||
            (beat.endLocation.toLowerCase().contains(lowerQuery))),
      );
    }
  }

}