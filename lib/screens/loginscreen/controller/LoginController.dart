// login_controller.dart
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../network/requests/login_request.dart';
import '../../../network/responses/login_response/login_response.dart';
import '../../../network/retrofit/ApiEndPoints.dart';
import '../../../network/retrofit/api_client.dart';
import '../../../session_manager.dart';
import '../../../utils/dialog_helper.dart';
import '../../../utils/snackbar_helper.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController {
  // Create observables for username and password
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var username = ''.obs;
  var password = ''.obs;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  RxBool loading = false.obs;
  // Create a form key for validation


  // Validation function
  String? validateUsername(String value) {
    if(!GetUtils.isEmail(value)){
      return 'Please enter a valid Email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }



  Future<void> loginApi(String username, String password) async {
    // Validate form
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      loading.value = false;
      DialogHelper.dismissDialog();
      return;
    }
    formKey.currentState!.save();

    try {
      final request = LoginRequest(
        action: 'imc_login',
        username: username,
        password: password,
      );

      // Make the API call
      final response = await ApiClient.apiService.login(request);
      print("Response received: $response");

      // Check if response is a string and decode it, otherwise use the response directly
      var decoded;

      if (response is String) {
        decoded = json.decode(response);
      } else {
        decoded = response;
      }

      // Parse the decoded response
      final loginResponse = LoginResponse.fromJson(decoded);
      print("Parsed Response: ${loginResponse.message}");

      loading.value = false;
      DialogHelper.dismissDialog();

      if (loginResponse.status!) {
        SnackbarHelper.showSnackbar(title: "Success", message: loginResponse.message ?? "Login successful");

        if (loginResponse.result != null && loginResponse.result!.isNotEmpty) {
          final user = loginResponse.result![0];
          List<Zones> zones = user.zones!;

          await SessionManager.saveLoginData(
            name: user.fullName ?? '',
            email: user.email ?? '',
            position: user.position?? '',
            mobile: user.mobileNo.toString(),
            zones: zones,
          );
          Get.toNamed('/homeScreen');
        } else {
          Get.snackbar("Error", loginResponse.message ?? "Login failed: No data received");
        }
      } else {
        Get.snackbar("Error", loginResponse.message ?? "Login failed");
      }

    } catch (e) {
      print("Error occurred: $e");
      loading.value = false;
      DialogHelper.dismissDialog();
      Get.back();
      Get.defaultDialog(
        title: "Error",
        content: Text("Login failed: ${e.toString()}"),
      );
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
