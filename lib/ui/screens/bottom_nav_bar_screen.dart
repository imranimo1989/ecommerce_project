import 'package:ecommerce_project/ui/screens/cart_screen.dart';
import 'package:ecommerce_project/ui/screens/categories_screen.dart';
import 'package:ecommerce_project/ui/screens/home_screen.dart';
import 'package:ecommerce_project/ui/screens/wishlist_screen.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  
  
  final List<Widget> navScreenItem =[
    const HomeScreen(),const CategoriesScreen(),const CartScreen(),const WishlistScreen()
  ];

  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (value){

            if(mounted){
              selectedIndex=value;
              setState(() {

              });
            }

          },
        selectedItemColor: primaryColor,
        unselectedItemColor: lightGreyColor,
        showUnselectedLabels: true,
        elevation: 16,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Wishlist"),

        ],


      ),
      body: navScreenItem.elementAt(selectedIndex),

    );
  }
}
