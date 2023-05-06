import 'package:ecommerce_project/ui/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';
import '../widgets/common_elevated_button.dart';
import '../widgets/common_text_form_field.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 80,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text("Complete Profile", style: titleTextStyle),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Get started with us with your details",
                  style: subTextStyle,
                ),
                const SizedBox(
                  height: 16,
                ),
                CommonTextFromField(
                    labelText: "First Name",
                    hintText: "Mohammed",
                    textInputType: TextInputType.name,
                    controller: TextEditingController(),
                    validator: (String? value) {

                    }),
                const SizedBox(
                  height: 12,
                ),
                CommonTextFromField(
                    labelText: "Last Name",
                    hintText: "Imran",
                    textInputType: TextInputType.name ,
                    controller: TextEditingController(),
                    validator: (String? value) {

                    }),
                const SizedBox(
                  height: 12,
                ),
                CommonTextFromField(
                    labelText: "Mobile Number",
                    hintText: "01786114917",
                    textInputType: TextInputType.number,
                    controller: TextEditingController(),
                    validator: (String? value) {

                    }),
                const SizedBox(
                  height: 12,
                ),
                CommonTextFromField(
                    labelText: "City",
                    hintText: "Gulshan",
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    validator: (String? value) {

                    }),
                const SizedBox(
                  height: 12,
                ),
                CommonTextFromField(
                    labelText: "Shipping Address",
                    hintText: "Mannan Vila, Shazadpur, Gulshan, Dhaka",
                    maxLines: 3,
                    textInputType: TextInputType.text,
                    controller: TextEditingController(),
                    validator: (String? value) {

                    }),
                const SizedBox(
                  height: 12,
                ),
                CommonElevatedButton(title: "Next", onTap: () {

                  Get.to(const BottomNavBarScreen());

                }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
