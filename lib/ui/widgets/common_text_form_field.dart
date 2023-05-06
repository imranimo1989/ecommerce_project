import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CommonTextFromField extends StatelessWidget {
   CommonTextFromField({
    super.key, this.labelText, required this.controller, required this.validator, this.hintText,  this.textInputType, this.maxLines
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final Function(String?) validator;
  final TextInputType? textInputType;
  int?  maxLines;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      maxLines: maxLines,

      validator: (value) => validator(value),
      decoration:  InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: lightGreyColor),
          labelText: labelText,
          border:  const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor)),
          enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
          focusedBorder:  const OutlineInputBorder(borderSide: BorderSide(color: primaryColor,width: 2)),
          // contentPadding:  const EdgeInsets.symmetric(
          //   vertical: 4, horizontal: 16,
          // )
      ),
    );
  }
}