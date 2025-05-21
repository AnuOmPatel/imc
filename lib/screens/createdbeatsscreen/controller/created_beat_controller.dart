import 'dart:convert';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:imc_track/network/requests/created_beat_list.dart';
import 'package:imc_track/utils/dialog_helper.dart';

import '../../../network/responses/createdbeat/created_beat_response.dart';
import '../../../network/retrofit/api_client.dart';
import '../../../session_manager.dart';

class CreatedBeatController extends GetxController{
  var zoneId = ''.obs;
  var wardId = ''.obs;
  RxBool loading = false.obs;
  RxList<BeatData> beatListAll =<BeatData>[].obs;
  RxList<BeatData> filteredList =<BeatData>[].obs;
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
      fetchCreatedBeats(int.parse(zoneId.value), int.parse(wardId.value));
    }
  }

  void fetchCreatedBeats(int zoneId, int wardId) async{
    try {
      loading.value = true;
      DialogHelper.showLoading();

      final request = CreatedBeatRequest(
          action: "view_beet_master_by_zone_and_ward", zoneId: zoneId, wardId: wardId);

      final response = await ApiClient.apiService.viewCreatedBeats(request);
      final jsonData = response is String ? jsonDecode(response) : response;
      final beatListResponse = BeatResponse.fromJson(jsonData);
      final List<BeatData> beatListAllReceived =
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