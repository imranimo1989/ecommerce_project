import 'package:ecommerce_project/data/services/network_caller.dart';
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
  }//========================End Email Verification=============================

  bool _otpVerificationInProgress = false;
  bool get otpVerificationInProgress => _otpVerificationInProgress;

  Future<bool> otpVerification(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: "/VerifyLogin/$email/$otp");
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }//========================End Otp Verification===============================
}
