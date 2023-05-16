import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class ProductStepperWidget extends StatefulWidget {
  const ProductStepperWidget({Key? key}) : super(key: key);

  @override
  State<ProductStepperWidget> createState() => _ProductStepperWidgetState();
}

class _ProductStepperWidgetState extends State<ProductStepperWidget> {


  int currentValue =1;

  TextEditingController textEditingController = TextEditingController(text: "01");

  @override
  Widget build(BuildContext context) {
    return          Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap:(){

            if(currentValue>1){
              currentValue--;
              textEditingController.text = currentValue.toString();
            }else{
              Get.snackbar("Warning!", "Minimum Product Quantity is 1",duration: const Duration(milliseconds: 1000));
            }




          },
          child: Container(
            alignment: Alignment.center,
            decoration:  BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),width: 24,height:24,
            child: const Icon(Icons.remove,color: Colors.white,size: 20,),
          ),
        ),
        SizedBox(width: 40,
          child: TextField(
              controller: textEditingController,
              readOnly: true,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )
              )
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap:(){
            if(currentValue<20){
              currentValue++;
              textEditingController.text = currentValue.toString();
            }else{
              Get.snackbar("Warning!", "Minimum Product Quantity is 20 only",duration: const Duration(milliseconds: 1000));
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration:  BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),width: 24,height:24,
            child: const Icon(Icons.add,color: Colors.white,size: 20,),
          ),
        ),
      ],
    );

  }
}
