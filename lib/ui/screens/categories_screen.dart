import 'package:ecommerce_project/ui/state_manager/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_project/ui/state_manager/categories_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/category_card_widget.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.find<BottomNavigationBarController>().backToHome();
        }, icon: const Icon(Icons.arrow_back, color: Colors.black87,),

        ),
        title: const Text("Categories"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CategoriesController>(
          builder: (categoriesController) {

            final categories = categoriesController.categoriesModel.categories!;

            return categoriesController.getCategoriesInProgress ? (const Center(
              child: CircularProgressIndicator(),)): RefreshIndicator(
                onRefresh: () async {
                  Get.find<CategoriesController>().getCategories();
                },
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return  CategoryCardWidget(
                      categoryName: categories[index].categoryName.toString(),
                      imageUrl: categories[index].categoryImg.toString(),
                      id: categories[index].id!,
                    );
            }),
              );
          }
        ),
      ));
  }
}
