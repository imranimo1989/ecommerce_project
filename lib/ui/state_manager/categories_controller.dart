import 'package:ecommerce_project/data/model/categories_model.dart';
import 'package:get/get.dart';

import '../../data/services/network_caller.dart';

class CategoriesController extends GetxController{
  bool _getCategoriesInProgress = false;
  bool get getCategoriesInProgress => _getCategoriesInProgress;

  CategoriesModel _categoriesModel = CategoriesModel();
  CategoriesModel get categoriesModel => _categoriesModel;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/CategoryList");
    _getCategoriesInProgress = false;
    if (response.isSuccess) {
      _categoriesModel = CategoriesModel.fromJson(response.responseBody);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}