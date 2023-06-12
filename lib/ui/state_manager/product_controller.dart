import 'package:ecommerce_project/data/model/product_by_category_model.dart';
import 'package:ecommerce_project/data/services/network_caller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool _getProductsByCategoryInProgress = true;

  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();

  ProductByCategoryModel get productByCategoryModel => _productByCategoryModel;

  bool get getProductsByCategoryInProgress => _getProductsByCategoryInProgress;

  Future<bool> getProductsByCategory(productId) async {
    _getProductsByCategoryInProgress = true;
    update();

    final response =
        await NetworkCaller.getRequest(url: "/ProductDetailsById/$productId");
    _getProductsByCategoryInProgress = true;

    if (response.isSuccess) {
      _productByCategoryModel =
          ProductByCategoryModel.fromJson(response.responseBody);

      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
