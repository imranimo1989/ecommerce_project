import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("My Wish List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: .82,mainAxisSpacing: 4,crossAxisSpacing: 4


        ),
            itemCount: 10,
            itemBuilder: (context, index){
              return const ProductCardWidget();
            }),
      ),
    );
  }
}
