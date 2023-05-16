import 'package:flutter/material.dart';
import '../widgets/reviews_card_widget.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index){
        return const ReviewsCardWidget();
      })
    );
  }
}


