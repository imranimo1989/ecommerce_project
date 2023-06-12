import 'package:ecommerce_project/data/model/user_profile_model.dart';
import 'package:ecommerce_project/data/services/network_caller.dart';
import 'package:ecommerce_project/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:get/get.dart';


class UserProfileController extends GetxController {




  // Create User Profile form api=================================================
/*
  bool _createUserProfileIsLoader = false;
  //getter _createUserProfileIsLoader
  bool get createUserProfileIsLoader => _createUserProfileIsLoader;

  Future<bool> createUserProfile({
    required firstName,
    required lastName,
    required mobile,
    required city,
    required shippingAddress,
  }) async {
    _createUserProfileIsLoader = true;
    update();

    final response = await NetworkCaller.postRequest(url: "/CreateProfile",
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        city: city,
        shippingAddress: shippingAddress);

    _createUserProfileIsLoader = false;

    if (response.isSuccess) {


      Get.offAll(()=>const BottomNavBarScreen());


    */
/*  UserProfileModel userProfileModel = UserProfileModel.fromJson(response.responseBody);

      if(userProfileModel.profileData != null){

        Get.find<AuthController>().saveUserProfileData(userProfileModel.profileData!.first);
      }
      else{
        Get.to(()=>const CompleteProfileScreen());
      }*//*


      update();
      return true;
    } else {
      update();
      return false;
    }
  }//end===========



*/


  // Get User Profile form api=================================================
  bool _getUserProfileIsLoader = false;
  //getter _getUserProfileIsLoader
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
  }//end===
}
