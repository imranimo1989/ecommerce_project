
import 'package:ecommerce_project/data/services/network_caller.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  
   bool _getUserProfileIsLoader = false;
   bool get getUserProfileIsLoading => _getUserProfileIsLoader;
  
  Future<bool>getUserProfile()async{
    _getUserProfileIsLoader = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/ReadProfile");
    _getUserProfileIsLoader = false;
    if (response.isSuccess) {

      update();
      return true;
    } else {
      update();
      return false;
    }
    
  }
  
  
}