import 'package:ecommerce_project/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:ecommerce_project/ui/utils/styles.dart';
import 'package:ecommerce_project/ui/widgets/common_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 80,
            ),
            const SizedBox(height: 16,),
            Text("Enter OTP Code",style: titleTextStyle,),
            const SizedBox(height: 4,),
            Text("A 4 digit OTP code has been sent",style: subTextStyle,),
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
              controller: TextEditingController(),
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
              }, appContext: context,
            ),
            const SizedBox(height: 24,),
            CommonElevatedButton(title: "Next", onTap: (){
              Get.to(const CompleteProfileScreen());
            }),
            const SizedBox(height: 24,),
            RichText(
              text:  TextSpan(text: 'This code will expired in ',style: subTextStyle, children: const [
                TextSpan(text: '120s', style: TextStyle(fontWeight: FontWeight.w500, color: primaryColor))
              ]),
            ),
            const SizedBox(height: 4,),
            TextButton( onPressed: () {  }, child: const Text("Resend Code",style: TextStyle(color: Colors.grey,fontSize: 16),),),



          ],
        ),
      ),
    );
  }
}
