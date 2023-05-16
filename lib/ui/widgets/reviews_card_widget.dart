import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ReviewsCardWidget extends StatelessWidget {
  const ReviewsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card( margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: lightGreyColor.withOpacity(.3),
                  child: const Icon(Icons.person_outline,color: blackLight,size: 22,),
                ),
                const SizedBox(width: 16,),
                Text("Mohammed Imran",style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black.withOpacity(.8,),letterSpacing: .4
                ),),

              ],
            ),
            const SizedBox(height: 8 ,),
            Text("I recently purchased a pair of Nike Air Max 270 sneakers, and I have to say, they left me thoroughly impressed from the moment I laced them up. These shoes are nothing short of excellent in terms of comfort, style, and overall performance.",style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black.withOpacity(.6,),letterSpacing: .2,height: 1.5
            ),),
          ],
        ),
      ),
    );
  }
}