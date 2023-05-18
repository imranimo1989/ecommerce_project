import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? token;

  Future<bool> isLoggedIn() async {
   await getToken();
    return token != null; //best way
    // if(token==null){
    //   return false;
    // }else{
    //   return true;
    // }
  } //===========================End Is logged In Method ====================================

  Future<void> saveToken(String userToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = userToken;
    await sharedPreferences.setString("craftyToken", userToken);
  } //===========================End Save Token Method ======================================

  Future<void> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("craftyToken");
  } //===========================End Get Token Method =======================================

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  } //===========================End Clear User Data Method ================================
}
