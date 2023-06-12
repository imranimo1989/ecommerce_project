import 'package:ecommerce_project/data/model/product_by_category_model.dart';
import 'package:ecommerce_project/data/services/network_caller.dart';
import 'package:get/get.dart';

class PopularProductByRemarkController extends GetxController{
  
  bool _getPopularProductByRemarkIsLoader = false;
  bool get  getPopularProductByRemarkIsLoader => _getPopularProductByRemarkIsLoader;

  ProductByCategoryModel _popularProductByRemarkModel = ProductByCategoryModel();

  ProductByCategoryModel get popularProductByRemarkModel =>_popularProductByRemarkModel;
  
  Future<bool> getPopularProductByRemark()async{

    _getPopularProductByRemarkIsLoader = true;
    update();
    
    final response = await NetworkCaller.getRequest(url: "/ListProductByRemark/popular");
    _getPopularProductByRemarkIsLoader = false;

    if(response.isSuccess){
      _popularProductByRemarkModel = ProductByCategoryModel.fromJson(response.responseBody);
      update();
      return true;
    }else{

      update();
      return false;

    }
    
  }
}



class NewProductByRemarkController extends GetxController{

  bool _getNewProductByRemarkIsLoader = false;
  bool get  getNewProductByRemarkIsLoader => _getNewProductByRemarkIsLoader;

  ProductByCategoryModel _newProductByRemarkModel = ProductByCategoryModel();

  ProductByCategoryModel get newProductByRemarkModel =>_newProductByRemarkModel;

  Future<bool> getNewProductByRemark()async {
    _getNewProductByRemarkIsLoader = true;
    update();

    final response = await NetworkCaller.getRequest(
        url: "/ListProductByRemark/new");
    _getNewProductByRemarkIsLoader = false;

    if (response.isSuccess) {
      _newProductByRemarkModel =
          ProductByCategoryModel.fromJson(response.responseBody);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}



class SpecialProductByRemarkController extends GetxController{

  bool _getSpecialProductByRemarkIsLoader = false;
  bool get  getSpecialProductByRemarkIsLoader => _getSpecialProductByRemarkIsLoader;

  ProductByCategoryModel _specialProductByRemarkModel = ProductByCategoryModel();

  ProductByCategoryModel get specialProductByRemarkModel =>_specialProductByRemarkModel;

  Future<bool> getSpecialProductByRemark()async {
    _getSpecialProductByRemarkIsLoader = true;
    update();

    final response = await NetworkCaller.getRequest(
        url: "/ListProductByRemark/new");
    _getSpecialProductByRemarkIsLoader = false;

    if (response.isSuccess) {
      _specialProductByRemarkModel =
          ProductByCategoryModel.fromJson(response.responseBody);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}