import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ProductImageCarouselWidget extends StatelessWidget {
  ProductImageCarouselWidget({super.key});

  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    decoration: BoxDecoration(
                      color: lightGreyColor.withOpacity(.3),
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
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
                valueListenable: _currentCarouselIndex,
                builder: (context, currentValue, _) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int value = 0; value < 5; value++)
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              height: 11,
                              width: 11,
                              decoration: BoxDecoration(
                                color: currentValue == value ? primaryColor : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
