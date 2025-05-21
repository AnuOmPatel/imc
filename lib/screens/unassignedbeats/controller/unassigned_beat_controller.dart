import 'dart:convert';

import 'package:get/get.dart';
import 'package:imc_track/network/requests/unassigned_beat_request.dart';
import 'package:imc_track/network/responses/unassignedbeatresponse/un_assigned_beat_response.dart';
import 'package:imc_track/utils/dialog_helper.dart';

import '../../../network/retrofit/api_client.dart';
import '../../../session_manager.dart';

class UnAssignedBeatController extends GetxController{
  var zoneId = ''.obs;
  var wardId = ''.obs;
  RxBool loading = false.obs;
  RxList<UnAssignedBeetData> beatListAll =<UnAssignedBeetData>[].obs;
  RxList<UnAssignedBeetData> filteredList =<UnAssignedBeetData>[].obs;
  final RxInt totalDistance = 0.obs;
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
      final request = UnAssignedBeatRequest(
          action: "view_unassigned_beets", zoneId: zoneId, wardId: wardId);

      final response = await ApiClient.apiService.viewUnAssignedBeats(request);
      final jsonData = response is String ? jsonDecode(response) : response;
      final beatListResponse = UnAssignedBeatResponse.fromJson(jsonData);
      final List<UnAssignedBeetData> beatListAllReceived =
          beatListResponse.result?.data ?? [];

      if(beatListAllReceived!=null){

        beatListAll.assignAll(beatListAllReceived);
        filteredList.assignAll(beatListAllReceived);

        final int total = beatListAllReceived.fold(
          0,
              (prev, element) => prev + (element.distance ?? 0),
        );
        print("disatance is: ${total}");
        totalDistance.value = total;
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