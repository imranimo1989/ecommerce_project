import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class RemarksTitleWidget extends StatelessWidget {


  final String remarksTitle;
  final VoidCallback onTapSeeAll;

  const RemarksTitleWidget({super.key, required this.remarksTitle, required this.onTapSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(remarksTitle,style: titleTextStyle.copyWith(fontSize: 18,fontWeight: FontWeight.w600),),
        TextButton(onPressed: onTapSeeAll, child:const  Text("See all"))

      ],
    );
  }
}
