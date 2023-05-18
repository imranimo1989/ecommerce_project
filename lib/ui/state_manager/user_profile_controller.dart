import 'package:ecommerce_project/data/model/user_profile_model.dart';
import 'package:ecommerce_project/data/services/network_caller.dart';
import 'package:ecommerce_project/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  bool _getUserProfileIsLoader = false;
  bool get getUserProfileIsLoading => _getUserProfileIsLoader;

  Future<bool> getUserProfile() async {
    _getUserProfileIsLoader = true;
    update();

    final response = await NetworkCaller.getRequest(url: "/ReadProfile");

    _getUserProfileIsLoader = false;
    if (response.isSuccess) {

      UserProfileModel userProfileModel = UserProfileModel.fromJson(response.responseBody);

     if(userProfileModel.profileData != null){
       Get.find<AuthController>().saveUserProfileData(userProfileModel.profileData!.first);
     }
     else{
       Get.to(()=>const CompleteProfileScreen());
     }

      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
