import 'package:flutter/material.dart';

import '../widgets/product_details_widget/product_image_carousel_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          ProductImageCarouselWidget(),
        ],
      ),
    );

  }
}
