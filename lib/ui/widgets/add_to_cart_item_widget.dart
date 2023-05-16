import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';
import 'product_stepper_widget.dart';

class AddToCartItemWidget extends StatelessWidget {
  const AddToCartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://freepngimg.com/save/27428-nike-shoes-transparent-background/800x587",
                  height: 70,
                  width: 85,
                  scale: 1,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nike Air Max 270",style: titleTextStyle.copyWith(color: Colors.black.withOpacity(.75),fontSize: 16)),
                          const SizedBox(height: 4,),
                          Text("Color: Red  Size: X",style: TextStyle(fontSize: 12,color: Colors.grey.shade600),)
                        ],
                      ),

                      const SizedBox(width: 80,),

                      IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.grey,))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("\$100",style: TextStyle(color: primaryColor,fontSize: 18,fontWeight: FontWeight.w500),),
                      SizedBox(width: 120,),
                      ProductStepperWidget(),
                    ],

                  ),
                ],
              ),



            ],
          ),
        ],
      ),
    );
  }
}