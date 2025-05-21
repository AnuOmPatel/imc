// login_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appfonts.dart';
import '../../../utils/dialog_helper.dart';
import '../controller/LoginController.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Gradient background
          Container(
            width: double.infinity,
            // height: 337,
            decoration: BoxDecoration(
              color: Color(0xFF3B31A1),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "IMC Track",
                    style: AppFonts.Montserrat.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),

          // Content below the gradient
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 660,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
                child: SingleChildScrollView(
                  child: Form(
                    key: loginController.formKey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Text(
                                'Welcome',
                                style: AppFonts.Montserrat.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff4B4C4C),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),
                        // Company Code Field
                        // Username Field
                        TextFormField(
                          controller: loginController.usernameController,
                          onSaved: (value){
                            loginController.username.value = value ?? '';
                          },
                          validator: (value){
                            return loginController.validateUsername(value ?? '');
                          },
                          decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                "assets/user.png",
                                width: 2,
                                height: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Password Field
                        TextFormField(
                          controller: loginController.passwordController,
                          onSaved: (value){
                            loginController.password.value = value ?? '';
                          },
                          validator: (value){
                            return loginController.validatePassword(value ?? '');
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                "assets/lock.png",
                                width: 2,
                                height: 2,
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: Color(0xffA3A3A3),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        // Login Button
                        GestureDetector(
                          onTap: () {
                            if (loginController.formKey.currentState!
                                .validate()) {
                              DialogHelper.showLoading();
                              print("calling method inside screen");
                              //  Get.toNamed(Routes.homeScreen);
                              //Get.toNamed('/homeScreen');
                              loginController.loginApi(
                                  loginController.usernameController.text.trim(),
                                  loginController.passwordController.text.trim());
                              //print("calling method");
                            } else {
                              print("Validation failed!");
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 51,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6540C3), // #6540C3
                                    Color(0xFF3E30A2), // #3E30A2
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                "Login",
                                style: AppFonts.Montserrat.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
