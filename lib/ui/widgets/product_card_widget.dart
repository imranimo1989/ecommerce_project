import 'package:ecommerce_project/data/model/product.dart';
import 'package:ecommerce_project/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key, required Product productList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: ()=>Get.to(()=>const ProductDetailsScreen()),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.only(right: 4,top: 4,bottom: 4,left: 4),
          elevation: 2,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8))
                ),
                child: Image.network(
                  "https://freepngimg.com/save/27428-nike-shoes-transparent-background/800x587",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      "New Year Special Nike Shoes AB023",
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500, color: Colors.black54, height: 1.5),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          "\$100",
                          style: TextStyle(color: primaryColor, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "4.8",
                              style: TextStyle(fontSize: 12, color: Colors.black87),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 18,
                          width: 18,
                          alignment: Alignment.center,
                          decoration:
                          BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(3)),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        )
                      ],
                    ),
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
