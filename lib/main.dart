import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_project/ui/state_manager/otp_timer_controller.dart';
import 'package:ecommerce_project/ui/state_manager/user_profile_controller.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:ecommerce_project/ui/utils/theme_builder.dart';
import 'package:get/get.dart';
import 'ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'ui/state_manager/user_auth_controller.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: ( context, brightness) {
        return GetMaterialApp(
          initialBinding: GetXBindings(),
          debugShowCheckedModeBanner: false,
          //themeMode: ThemeMode.light,

     /*     darkTheme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black45,
            ),
             brightness: brightness,
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            primaryColorDark: Colors.white,
            primaryColor: Colors.white,

            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              backgroundColor: blueBlack,
            )),
            // colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.white, primary: draculaBlack),
          ),*/

          theme: ThemeData(
            appBarTheme:   const AppBarTheme(
              elevation: 1,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              titleTextStyle: TextStyle(
                color: blackLight,fontSize: 16,fontWeight: FontWeight.w500
              )
            ),
            brightness: brightness,
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            textTheme: const TextTheme(

            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            )),
            //colorScheme: ThemeData().colorScheme.copyWith(secondary: primaryColor, primary: primaryColor),
          ),

          darkTheme: ThemeData(
            appBarTheme:   const AppBarTheme(
                elevation: 1,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                titleTextStyle: TextStyle(
                    color: blackLight,fontSize: 16,fontWeight: FontWeight.w500
                )
            ),
            brightness: brightness,
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            textTheme: const TextTheme(

            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                )),
            //colorScheme: ThemeData().colorScheme.copyWith(secondary: primaryColor, primary: primaryColor),
          ),







          ///======================
          home: const SplashScreen(),
        );
      },
    );
  }
}

class GetXBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(OtpTimerController());
    Get.put(AuthController());
    Get.put(UserProfileController());

  }


}