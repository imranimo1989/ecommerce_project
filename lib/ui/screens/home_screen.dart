
import 'package:ecommerce_project/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/ui/screens/email_verification_screen.dart';
import 'package:ecommerce_project/ui/screens/produt_list_screen.dart';
import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/home_screen_widgets/appbar_icon_button_widget.dart';
import '../widgets/home_screen_widgets/home_carousal_slider_widget.dart';
import '../widgets/home_screen_widgets/remarks_title_widgets.dart';
import '../widgets/home_screen_widgets/search_text_field_widget.dart';
import '../widgets/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        title: Row(
          children: [
            //app logo
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            //show user profile screen if not update or not registered
            AppBarIconButton(
              iconData: Icons.person,
              onTap: () {
                Get.find<AuthController>().isLoggedIn().then((value)  {
                  if(!value){
                    Get.to(()=>const EmailVerificationScreen());
                  }else{
                    Get.to(()=>const CompleteProfileScreen());

                  }
                });

              },
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: () {},
            ),
            AppBarIconButton(
              iconData: Icons.notifications_active_rounded,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ///Home Main Search Bar //
              const SearchTextFieldWidget(),
              const SizedBox(
                height: 16,
              ),

              /// Home Carousel Slider Widget
              HomeCarouselSliderWidget(),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarksTitle: 'Categories',
                onTapSeeAll: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryCardWidget(
                      categoryName: 'Computer',
                    ),
                    CategoryCardWidget(
                      categoryName: 'Food',
                    ),
                    CategoryCardWidget(
                      categoryName: 'Fashion',
                    ),
                    CategoryCardWidget(
                      categoryName: 'Furniture',
                    ),
                    CategoryCardWidget(
                      categoryName: 'Automobile',
                    ),
                    CategoryCardWidget(
                      categoryName: 'Electronics',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarksTitle: 'Popular',
                onTapSeeAll: () {
                  Get.to(()=>const ProductListScreen());
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              RemarksTitleWidget(
                remarksTitle: 'Special',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              RemarksTitleWidget(
                remarksTitle: 'New',
                onTapSeeAll: () {},
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

