import 'package:ecommerce_project/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/ui/state_manager/otp_timer_controller.dart';
import 'package:ecommerce_project/ui/state_manager/user_auth_controller.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:ecommerce_project/ui/utils/styles.dart';
import 'package:ecommerce_project/ui/widgets/common_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {

  final String userEmail;
  const OtpVerificationScreen({Key? key, required this.userEmail}) : super(key: key);


  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpTEController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(
        builder: (userAuthController) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: GetBuilder<OtpTimerController>(
              builder: (otpTimer) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 80,
                    ),
                    const SizedBox(height: 16,),
                    Text("Enter OTP Code",style: titleTextStyle,),
                    const SizedBox(height: 4,),
                    Text("A 4 digit OTP code has been sent",style: regularTextStyle,),
                    const SizedBox(height: 16,),
                    PinCodeTextField(
                      length:4,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        activeColor: Colors.white,
                        selectedFillColor: Colors.white,
                        errorBorderColor: Colors.red,
                        selectedColor: primaryColor,
                        inactiveFillColor: Colors.white,
                        inactiveColor: primaryColor,

                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: otpTEController,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      onChanged: (value) {
                      }, appContext: context,
                    ),
                    const SizedBox(height: 24,),
                userAuthController.otpVerificationInProgress
                    ? const CircularProgressIndicator()
                    : CommonElevatedButton(
                        title: "Next",
                        onTap: () async {
                          final bool response =
                              await userAuthController.otpVerification(
                                  widget.userEmail, otpTEController.text);
                          if(response){
                        Get.to(()=>const CompleteProfileScreen());
                      }else{
                            Get.showSnackbar(const GetSnackBar(
                              title: "Error",
                              message: "OTP verification failed! try again.",
                            ));
                          }

                    }),
                    const SizedBox(height: 24,),
                    RichText(
                  text: TextSpan(
                      text: 'This code will expired in ',
                      style: regularTextStyle,
                      children: [
                        TextSpan(
                            text: "${otpTimer.start} seconds",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: primaryColor))
                      ]),
                        ),

                    const SizedBox(height: 4,),
                TextButton(
                  onPressed: otpTimer.isTimerEnd == true ? () async {
                          final bool response = await userAuthController
                              .emailVerification(widget.userEmail);
                          if(response){
                            Get.showSnackbar(const GetSnackBar(
                              title: "Success",
                              message: "OTP Verification Code Send Successful.",
                            ));
                            Get.find<OtpTimerController>().startTimer();

                    }else{
                            Get.showSnackbar(const GetSnackBar(
                              duration: Duration(seconds: 5),
                              title: "Error",
                              message: "Email verification failed! try again.",
                            ));
                          }
                  } : null,
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                        color: otpTimer.isTimerEnd == true
                            ? primaryColor
                            : Colors.grey,
                        fontSize: 16),
                  ),
                ),
              ],
                );
              }
            ),
          );
        }
      ),
    );
  }
}

