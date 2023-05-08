import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/home_screen_widgets/appbar_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int>_currentCarouselIndex = ValueNotifier(0);

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

      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: (value){},
              decoration: InputDecoration(
                  fillColor: lightGreyColor.withOpacity(0.1),
                  filled: true,
                  hintText: 'Search',
                  prefixIcon:const Icon(Icons.search,color:lightGreyColor,),

                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)

                  ),
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
            ),
            const SizedBox(height: 16,),
            CarouselSlider(
              options: CarouselOptions(height: 180.0,viewportFraction: 1,autoPlay: true,
                  onPageChanged:(index ,_){
                    _currentCarouselIndex.value = index;
                  }
              ),
              items: [1,2,3,4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber
                        ),
                        alignment: Alignment.center,
                        child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8,),
            ValueListenableBuilder(
                valueListenable: _currentCarouselIndex,
                builder: (context, currentValue,_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i = 0; i < 4; i++)
                        Padding(
                            padding: const EdgeInsets.all(2.0),

                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: currentValue == i ?primaryColor:null ,
                                  border: Border.all(color:lightGreyColor.withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            )
                        ),

                    ],
                  );
                }
            )



          ],
        ),
      ) ,


    );
  }
}

