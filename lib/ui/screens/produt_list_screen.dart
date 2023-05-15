import 'package:ecommerce_project/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';


class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: .65,
        ),
            itemCount: 20,
            itemBuilder: (context, index){
          return const ProductCardWidget();
            }),
      ),
    );
  }
}
