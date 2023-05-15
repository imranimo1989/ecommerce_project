
import 'package:flutter/material.dart';
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
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person,
              onTap: () {},
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
                onTapSeeAll: () {},
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

