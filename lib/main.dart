import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:get/get.dart';

import 'ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.white,
        primaryColor: Colors.white,


        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: blueBlack,
        )),
       // colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.white, primary: draculaBlack),

              ),


      theme: ThemeData(
        textTheme:  const TextTheme(
          displayLarge: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
        )),
        colorScheme: ThemeData().colorScheme.copyWith(secondary: primaryColor, primary: primaryColor),
      ),
      home: const SplashScreen(),
    );
  }
}
