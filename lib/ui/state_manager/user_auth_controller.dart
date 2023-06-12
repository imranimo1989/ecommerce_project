import 'dart:developer';

import 'package:ecommerce_project/data/services/network_caller.dart';
import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:ecommerce_project/ui/state_manager/user_profile_controller.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  bool _emailVerificationInProgress = false;

  bool get emailVerificationInProgress => _emailVerificationInProgress;

  Future<bool> emailVerification(String email) async {
    _emailVerificationInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/UserLogin/$email");
    _emailVerificationInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  } //========================End Email Verification=============================

  //OTP verification
  bool _otpVerificationInProgress = false;

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  Future<bool> otpVerification(String email, String otp) async {
    //inProgress loader update
    _otpVerificationInProgress = true;
    update();

    //call api to verify otp
    final response = await NetworkCaller.getRequest(url: "/VerifyLogin/$email/$otp");//end

    //inProgress loader update
    _otpVerificationInProgress = false;

    if (response.isSuccess) {

      //save token data to shared preferences from api
      await Get.find<AuthController>().saveToken(response.responseBody["data"]);

      //get user profile data when otp verified from api
      Get.find<UserProfileController>().getUserProfile();

      //Checking token saved or not
      final String craftyUserToken = AuthController.token.toString();
      log("Crafty User Token: $craftyUserToken"); //===========end

      update();
      return true;
    } else {
      update();
      return false;
    }
  } //========================End Otp Verification===============================
}
