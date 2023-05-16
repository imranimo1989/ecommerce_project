import 'package:ecommerce_project/ui/utils/styles.dart';
import 'package:ecommerce_project/ui/widgets/common_elevated_button_widget.dart';
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

  List<String> productSize = const [
    "S",
    "L",
    "M",
    "XL",
    "XXL",
  ];

  Color _selectedColor = const Color(0xFF000000);
  String _selectedSize = "L";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
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
                                  "Nike Air Max 270",
                                  style: titleTextStyle.copyWith(
                                      color: Colors.black.withOpacity(.7),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
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
                                              fontSize: 18,
                                              color: Colors.black.withOpacity(.7),
                                              fontWeight: FontWeight.w500),
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
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      height: 24,
                                      width: 24,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(3)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                          size: 16,
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
                            color: Colors.black.withOpacity(.7),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
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
                            color: Colors.black.withOpacity(.7),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: productSize.map((size) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              onTap: () {
                                if (_selectedSize != size) {
                                  _selectedSize = size;
                                  if (mounted) {
                                    setState(() {});
                                  }
                                }
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          size == _selectedSize ? primaryColor : null,
                                      border: Border.all(
                                          color: size == _selectedSize
                                              ? primaryColor
                                              : lightGreyColor),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: size == _selectedSize
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                  )),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Description",
                        style: titleTextStyle.copyWith(
                            color: Colors.black.withOpacity(.7),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "The Nike Air Max 270 features a sleek and modern silhouette with a low-top design. Its upper is made of a breathable mesh material that helps keep your feet cool and comfortable during wear. The shoe incorporates a large, visible Air Max unit in the heel, providing excellent cushioning and impact absorption with each step.",
                        style: subTextStyle.copyWith(fontSize: 14,height: 1.2)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


          
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Price",style: TextStyle(
                        color: lightGreyColor,fontSize: 14,letterSpacing: .5
                      ),),
                      Text("\$100",style: TextStyle(
                        color: primaryColor,fontSize: 16,fontWeight: FontWeight.w600,letterSpacing: .5
                      ),),
                    ],
                  ),
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: CommonElevatedButton(onTap: () {  }, title: 'Add to cart',

                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
