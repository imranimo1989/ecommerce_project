import 'package:ecommerce_project/ui/widgets/common_elevated_button_widget.dart';
import 'package:ecommerce_project/ui/widgets/common_text_form_field_widget.dart';
import 'package:flutter/material.dart';
class CreateReviewScreen extends StatelessWidget {
  const CreateReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
      ),body: Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextFromField(labelText: "First Name",
                hintText: "Mohammed",
                textInputType: TextInputType.name,
                maxLines: 1,
                controller: TextEditingController(),
                validator: (String? value)
                { },),
              const SizedBox(height: 16,),
              CommonTextFromField(labelText: "Last Name",
                hintText: "Imran",
                textInputType: TextInputType.name,
                maxLines: 1,
                controller: TextEditingController(),
                validator: (String? value)
                { },),
              const SizedBox(height: 16,),
              CommonTextFromField(labelText: "Write Review",
                hintText: "Sample Review: I recently purchased a pair of Nike Air Max 270 sneakers, and I have to say, they left me thoroughly impressed from the moment I laced them up. These shoes are nothing short of excellent in terms of comfort, style, and overall performance.",
                textInputType: TextInputType.name,
                maxLines: 5,
                controller: TextEditingController(),
                validator: (String? value)
                { },),
              const SizedBox(height: 24,),
              CommonElevatedButton(title: "Submit", onTap: (){}),
            ],
          ),
        ),
      ),
    ),

    );
  }
}
