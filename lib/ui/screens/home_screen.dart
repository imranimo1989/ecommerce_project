import 'dart:developer';

import 'package:ecommerce_project/ui/screens/email_verification_screen.dart';
import 'package:ecommerce_project/ui/screens/produt_list_screen.dart';
import 'package:ecommerce_project/ui/screens/profile_screen.dart';
import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_project/ui/state_manager/categories_controller.dart';
import 'package:ecommerce_project/ui/state_manager/home_slider_controller.dart';
import 'package:ecommerce_project/ui/state_manager/product_by_category_controller.dart';
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
                //User login state check

                Get.find<AuthController>().isLoggedIn().then((value) {
                  if (value) {
                    log(value.toString());
                    Get.to(() => const EmailVerificationScreen());
                  } else {
                    Get.offAll(() => const ProfileScreen());
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Home Main Search Bar //
              const SearchTextFieldWidget(),
              const SizedBox(
                height: 16,
              ),

              /// Home Carousel Slider Widget
              GetBuilder<HomeSliderController>(
                  builder: (carouselSliderController) {
                return carouselSliderController
                        .getCarouselSliderControllerIsLoading
                    ? const SizedBox(
                        height: 180,
                        child: Center(child: (CircularProgressIndicator())))
                    : HomeCarouselSliderWidget(
                        homeSliderModel:
                            carouselSliderController.homeSliderModel,
                      );
              }),
              //=========================================================================
              const SizedBox(
                height: 16,
              ),

              ///categories=============================================================================================
              RemarksTitleWidget(
                remarksTitle: 'Categories',
                onTapSeeAll: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              GetBuilder<CategoriesController>(builder: (categoriesController) {
                return categoriesController.getCategoriesInProgress
                    ? const SizedBox(
                        height: 100,
                        child: Center(child: (CircularProgressIndicator())))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                              categoriesController.categoriesModel.categories!
                                  .map(
                                    (e) => CategoryCardWidget(
                                      categoryName: e.categoryName.toString(),
                                      imageUrl: e.categoryImg.toString(),
                                      id: e.id!,
                                    ),
                                  )
                                  .toList(),
                        ),
                      );
              }),

              ///====================================================================================================
              const SizedBox(
                height: 16,
              ),

              RemarksTitleWidget(
                remarksTitle: 'Popular',
                onTapSeeAll: () {
                 // Get.to(() =>  ProductListScreen(categoryId: null,));
                },
              ),
              GetBuilder<PopularProductByRemarkController>(
                  builder: (productByRemarkController) {
                return productByRemarkController
                        .getPopularProductByRemarkIsLoader
                    ? const SizedBox(
                        height: 100,
                        child: Center(child: (CircularProgressIndicator())))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: productByRemarkController
                              .popularProductByRemarkModel.productList!
                              .map(
                                (product) => ProductCardWidget(
                                  productList: product,
                                ),
                              )
                              .toList(),
                        ),
                      );
              }),
              RemarksTitleWidget(
                remarksTitle: 'Special',
                onTapSeeAll: () {},
              ),
              GetBuilder<SpecialProductByRemarkController>(
                  builder: (specialProduct) {
                    return specialProduct.getSpecialProductByRemarkIsLoader
                        ? const SizedBox(
                        height: 100,
                        child: Center(child: (CircularProgressIndicator())))
                        : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: specialProduct
                            .specialProductByRemarkModel.productList!
                            .map(
                              (product) => ProductCardWidget(
                            productList: product,
                          ),
                        )
                            .toList(),
                      ),
                    );
                  }),
              RemarksTitleWidget(
                remarksTitle: 'New',
                onTapSeeAll: () {},
              ),
              GetBuilder<NewProductByRemarkController>(
                  builder: (newProduct) {
                    return newProduct
                        .getNewProductByRemarkIsLoader
                        ? const SizedBox(
                        height: 100,
                        child: Center(child: (CircularProgressIndicator())))
                        : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: newProduct
                            .newProductByRemarkModel.productList!
                            .map(
                              (product) => ProductCardWidget(
                            productList: product,
                          ),
                        )
                            .toList(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
