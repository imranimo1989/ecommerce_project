
import 'package:ecommerce_project/ui/screens/produt_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_manager/product_controller.dart';
import '../utils/app_colors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key, required this.categoryName, required this.imageUrl, required this.id,
  });
  final String categoryName;
  final String imageUrl;
  final int  id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<ProductController>().getProductsByCategory(id);
        Get.to(()=>ProductListScreen(categoryId: id,));
      },
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration:
              BoxDecoration(color: primaryColor.withOpacity(.1), borderRadius: BorderRadius.circular(8)),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(imageUrl,width: 40,)
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            categoryName,
            textAlign: TextAlign.center,
            style: const TextStyle(color: primaryColor, fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0.6),
          )
        ],
      ),
    );
  }
}
