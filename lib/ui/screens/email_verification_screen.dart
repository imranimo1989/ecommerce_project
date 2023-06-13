import 'package:ecommerce_project/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_project/ui/state_manager/otp_timer_controller.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:ecommerce_project/ui/utils/styles.dart';
import 'package:flutter/material.dart';
import '../state_manager/user_auth_controller.dart';
import '../utils/theme_builder.dart';
import '../widgets/common_elevated_button_widget.dart';
import '../widgets/common_text_form_field_widget.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

/*
  final List<Widget> themeMode = <Widget>[
    const Text('Light'),
    const Text('Dark'),
    ];
*/

  final List<bool> _selectedMode = <bool>[true, false,];
  bool vertical = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder<UserAuthController>(
        builder: (userAuthController) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
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
                    style: regularTextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextFromField(
                      labelText: "Email Address",
                      hintText: "example@gmail.com",
                      textInputType: TextInputType.emailAddress,
                      controller: _textEditingController,
                      validator: (String? value) {

                        if(value?.isEmpty??true){
                          return "Enter a valid email address";
                        }

                      }),
                  const SizedBox(
                    height: 12,
                  ),
                 userAuthController.emailVerificationInProgress? const CircularProgressIndicator() : CommonElevatedButton(title: "Next", onTap: () async {

                   if(_formKey.currentState!.validate()){
                     final bool response = await userAuthController.emailVerification(_textEditingController.text);
                     if(response){
                       Get.to( OtpVerificationScreen( userEmail: _textEditingController.text));
                       Get.find<OtpTimerController>().startTimer();
                     }else{
                       Get.showSnackbar(const GetSnackBar(title: "Error",message: "Email verification failed! try again.",));
                     }
                   }

                  }
                  ),
                  const SizedBox(height: 24,),

                /*  ToggleButtons(
                    //direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {



                      ThemeBuilder.of(context)?.changeTheme();

                      setState(() {

                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedMode.length; i++) {
                          ThemeBuilder.of(context)?.changeTheme();

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
                  ),*/

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
