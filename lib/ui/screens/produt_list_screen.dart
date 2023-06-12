import 'package:ecommerce_project/ui/state_manager/product_controller.dart';
import 'package:ecommerce_project/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductListScreen extends StatefulWidget {
  
  final int categoryId;
   const ProductListScreen({super.key, required this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
   Get.find<ProductController>().getProductsByCategory(widget.categoryId);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: GetBuilder<ProductController>(
        builder: (productController) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
          child: productController.getProductsByCategoryInProgress
              ? (const Center(
                  child: CircularProgressIndicator(),
                ))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: .75,
            ),
                itemCount: productController.productByCategoryModel.productList!.length,
                itemBuilder: (context, index){
                    return ProductCardWidget(
                        productList: productController
                            .productByCategoryModel.productList![index]);
                  }),
          );
        }
      ),
    );
  }
}
