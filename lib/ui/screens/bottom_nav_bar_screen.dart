import 'package:ecommerce_project/ui/screens/cart_screen.dart';
import 'package:ecommerce_project/ui/screens/categories_screen.dart';
import 'package:ecommerce_project/ui/screens/home_screen.dart';
import 'package:ecommerce_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_project/ui/state_manager/home_slider_controller.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> navScreenItem = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishlistScreen()
  ];

  @override
  void initState() {
     super.initState();
     Get.find<HomeSliderController>().getCarouselSlider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
          builder: (bottomNavigationBarController) {
        return BottomNavigationBar(
          currentIndex: bottomNavigationBarController.selectedIndex,
          onTap: (value) {
            bottomNavigationBarController.changeIndex(value);
          },
          selectedItemColor: primaryColor,
          unselectedItemColor: lightGreyColor,
          showUnselectedLabels: true,
          elevation: 16,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Wishlist"),
          ],
        );
      }),
      body: GetBuilder<BottomNavigationBarController>(
          builder: (bottomNavigationBarController) {
        return navScreenItem
            .elementAt(bottomNavigationBarController.selectedIndex);
      }),
    );
  }
}
