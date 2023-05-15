import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class HomeCarouselSliderWidget extends StatelessWidget {
  HomeCarouselSliderWidget({super.key});

  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              aspectRatio: 16 / 9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.decelerate,
              enlargeCenterPage: true,
              enlargeFactor: 0.5,

              ///OnPage Changed method for carousel control
              onPageChanged: (index, _) {
                // current carousel value notifier
                _currentCarouselIndex.value = index;
              },
              scrollDirection: Axis.horizontal,
              height: 180.0),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),

        ///Carousel Point indicator
        const SizedBox(height: 4),
        ValueListenableBuilder(
            valueListenable: _currentCarouselIndex,
            builder: (context, currentValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int value = 0; value < 5; value++)
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: currentValue == value ? primaryColor : null,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: lightGreyColor.withOpacity(.5), width: 1),
                        ),
                      ),
                    )
                ],
              );
            }),
      ],
    );
  }
}
