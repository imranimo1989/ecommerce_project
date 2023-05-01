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
    return  GetMaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary:primaryColor,
          primary: primaryColor
        ),
      ),

      home: const SplashScreen(),
    );
  }
}
