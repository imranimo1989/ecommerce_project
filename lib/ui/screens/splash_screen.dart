import 'dart:developer';

import 'package:ecommerce_project/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce_project/ui/screens/email_verification_screen.dart';
import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 1)).then((value) async {

      final bool loginState = await Get.find<AuthController>().isLoggedIn();

      //User login state check
      log("User Login State: ${loginState.toString()}");
      if (loginState) {
        Get.off(() => const BottomNavBarScreen());
      } else {
        Get.off(() => const EmailVerificationScreen());
      }//end
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Center(
                  child: Image.asset(
            "assets/images/logo.png",
            width: 110,
          ))),
          Column(
            children: const [
              CircularProgressIndicator(
                color: primaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  "Version  1.0 ",
                  style: TextStyle(color: lightGreyColor, letterSpacing: 1),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
