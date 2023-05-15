import 'package:ecommerce_project/ui/utils/styles.dart';
import 'package:ecommerce_project/ui/widgets/product_stepper_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/product_details_widget/product_image_carousel_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> productColor = const [
    Color(0xFF000000),
    Color(0xFF85BEA3),
    Color(0xFFBE2323),
    Color(0xFFF1EEC6),
    Color(0xFFF68107),
  ];

  Color _selectedColor = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageCarouselWidget(),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nike Super Quality M120A, Super Quality M120A",
                            style: titleTextStyle.copyWith(
                                color: Colors.black.withOpacity(.7), fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black.withOpacity(.7), fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Reviews",
                                  style: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                height: 24,
                                width: 24,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(3)),
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const ProductStepperWidget(),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Color",
                  style: titleTextStyle.copyWith(
                      color: Colors.black.withOpacity(.7), fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: productColor.map((color) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          if (_selectedColor != color) {
                            _selectedColor = color;
                            if (mounted) {
                              setState(() {});
                            }
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: color,
                          radius: 16,
                          child: Visibility(
                              visible: color == _selectedColor,
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Size",
                  style: titleTextStyle.copyWith(
                      color: Colors.black.withOpacity(.7), fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: productColor.map((color) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () {
                          if (_selectedColor != color) {
                            _selectedColor = color;
                            if (mounted) {
                              setState(() {});
                            }
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: color,
                          radius: 16,
                          child: Visibility(
                              visible: color == _selectedColor,
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
