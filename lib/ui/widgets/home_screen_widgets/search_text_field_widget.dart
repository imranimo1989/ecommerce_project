import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {},
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
          hintText: "Search",
          prefixIcon: const Icon(Icons.search),
          fillColor: lightGreyColor.withOpacity(.2),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8))),
    );
  }
}
