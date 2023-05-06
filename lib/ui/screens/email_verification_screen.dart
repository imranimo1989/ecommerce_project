import 'package:ecommerce_project/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:ecommerce_project/ui/utils/styles.dart';
import 'package:flutter/material.dart';
import '../widgets/common_elevated_button.dart';
import '../widgets/common_text_form_field.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final List<Widget> themeMode = <Widget>[
    const Text('Light'),
    const Text('Dark'),
    ];

  final List<bool> _selectedMode = <bool>[true, false,];
  bool vertical = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 80,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Welcome Back",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Please Enter Your Email Address",
              style: subTextStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            CommonTextFromField(
                labelText: "Email Address",
                hintText: "example@gmail.com",
                textInputType: TextInputType.emailAddress,
                controller: TextEditingController(),
                validator: (String? value) {

                }),
            const SizedBox(
              height: 12,
            ),
            CommonElevatedButton(title: "Next", onTap: () {
              Get.to(const OtpVerificationScreen());
            }
            ),
            const SizedBox(height: 24,),

            ToggleButtons(
              //direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {


                setState(() {

                  if(_selectedMode[index]){
                    ThemeMode.light;
                    print("True");

                  }else{
                    ThemeMode.dark;
                    print("false");
                  }
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedMode.length; i++) {
                    _selectedMode[i] = i == index;

                    print(index);
                    print(_selectedMode);
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
             // selectedBorderColor: ,
              selectedColor: Colors.white,
              fillColor: primaryColor,
              color: primaryColor,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedMode,
              children: themeMode,
            ),
            
          ],
        ),
      ),
    );
  }
}
