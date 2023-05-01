import 'package:ecommerce_project/ui/utils/styles.dart';
import 'package:flutter/material.dart';
import '../widgets/common_elevated_button.dart';
import '../widgets/common_text_form_field.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
            Text("Welcome Back", style: titleTextStyle),
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
                validator: (String? value) {}),
            const SizedBox(
              height: 12,
            ),
            CommonElevatedButton(title: "Next", onTap: () {})
          ],
        ),
      ),
    );
  }
}
