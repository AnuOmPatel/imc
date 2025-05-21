import 'dart:convert';

import 'package:get/get.dart';

import '../../../session_manager.dart';

class ProfileController extends GetxController{
  var name = ''.obs;
  var email = ''.obs;
  var position = ''.obs;
  var mobile = ''.obs;
  var zones = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    final data = await SessionManager.getLoginData();
    name.value = data['full_name'] ?? '';
    email.value = data['email'] ?? '';
    position.value = data['position'] ?? '';
    mobile.value = data['mobile_no'] ?? '';

    // Fix: decode JSON string into List<Map<String, dynamic>>
    if (data['zones'] != null && data['zones'] is String) {
      zones.value = List<Map<String, dynamic>>.from(json.decode(data['zones']!));
    } else {
      zones.clear();
    }

  }
}