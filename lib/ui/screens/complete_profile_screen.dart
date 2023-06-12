import 'dart:developer';

import 'package:ecommerce_project/data/services/network_caller.dart';
import 'package:ecommerce_project/ui/screens/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_manager/auth_controller.dart';
import '../state_manager/categories_controller.dart';
import '../state_manager/home_slider_controller.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';
import '../widgets/common_text_form_field_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {

  final _formKey = GlobalKey<FormState>();

  final firstNameEtController = TextEditingController();
  final lastNameEtController = TextEditingController();
  final mobileNumberEtController = TextEditingController();
  final cityEtController = TextEditingController();
  final addressEtController = TextEditingController();






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
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
                    style: regularTextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonTextFromField(
                      labelText: "First Name",
                      hintText: "Mohammed",
                      textInputType: TextInputType.name,
                      controller: firstNameEtController,
                      validator: (String? value) {

                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;


                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  CommonTextFromField(
                      labelText: "Last Name",
                      hintText: "Imran",
                      textInputType: TextInputType.name ,
                      controller: lastNameEtController,
                      validator: (value) {

                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;

                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  CommonTextFromField(
                      labelText: "Mobile Number",
                      hintText: "01786114917",
                      textInputType: TextInputType.number,
                      controller: mobileNumberEtController,
                      validator: (value) {

                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;

                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  CommonTextFromField(
                      labelText: "City",
                      hintText: "Gulshan",
                      textInputType: TextInputType.text,
                      controller: cityEtController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;

                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  CommonTextFromField(
                      labelText: "Shipping Address",
                      hintText: "Mannan Vila, Shazadpur, Gulshan, Dhaka",
                      maxLines: 3,
                      textInputType: TextInputType.text,
                      controller: addressEtController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your shipping address';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                 /* Get.find<UserProfileController>().createUserProfileIsLoader
                      ? (const CircularProgressIndicator())
                      :*/ CommonElevatedButton(
                          title: "Next",
                          onTap: () async {
                            if (_formKey.currentState!.validate()){
                     _formKey.currentState?.save();

                     // Create a map with the request data
                     final Map<String, dynamic> requestData = {
                       "firstName": firstNameEtController.text,
                       "lastName": lastNameEtController.text,
                       "mobile": mobileNumberEtController.text,
                       "city": cityEtController.text,
                       "shippingAddress": addressEtController.text
                     };

                     final response = await NetworkCaller.postRequest(url: "/CreateProfile" , bodyData: requestData);

                     // Handle the response
                     if (response.statusCode == 200) {

                       //save Profile data to shared preferences from api
                       await Get.find<AuthController>().getUserProfileData();



                       // Request successful
                       log('POST request successful');
                       log('Response body: ${response.responseBody}');
                        //go to home dashboard
                       Get.offAll(()=>const BottomNavBarScreen());
                       Get.find<HomeSliderController>().getCarouselSlider();
                       Get.find<CategoriesController>().getCategories();


                       Get.showSnackbar(const GetSnackBar(title: "Success!",message: "Profile Completed Successfully",));


                     } else {
                       // Request failed
                       log('POST request failed');
                       log('Response status code: ${response.statusCode}');
                       Get.showSnackbar(const GetSnackBar(title: "Failed!",message: "Profile Completed failed",));
                     }


             /*        Get.find<UserProfileController>().createUserProfile(
                         firstName: firstNameEtController.text,
                         lastName: lastNameEtController.text,
                         mobile: mobileNumberEtController.text,
                         city: cityEtController.text,
                         shippingAddress: addressEtController.text);*/




                    }





                  }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
