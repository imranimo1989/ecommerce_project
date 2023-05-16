import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_project/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/add_to_cart_item_widget.dart';
import '../widgets/common_elevated_button_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.find<BottomNavigationBarController>().backToHome();
          }, icon: const Icon(Icons.arrow_back)
        ),title: const Text("Cart"),
      ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 6,itemBuilder: (context, index) {
                return const AddToCartItemWidget();
      }),
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
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Total Price",style: TextStyle(
                            color: lightGreyColor,fontSize: 12,letterSpacing: .5
                        ),),SizedBox(height: 4,),
                        Text("\$10,000.00",style: TextStyle(
                            color: primaryColor,fontSize: 16,fontWeight: FontWeight.w600,letterSpacing: .5
                        ),),
                      ],
                    ),
                    SizedBox(
                      width: 130,
                      height: 40,
                      child: CommonElevatedButton(onTap: () {  }, title: 'Checkout',

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


