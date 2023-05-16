import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.find<BottomNavigationBarController>().backToHome();
          }, icon: const Icon(Icons.arrow_back)
        ),title: const Text("Cart"),
      ),
    );
  }
}
