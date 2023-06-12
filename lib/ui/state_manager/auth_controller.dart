import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_project/data/model/user_profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;

  static ProfileData? get userProfileData => _profileData;

  Future<bool> isLoggedIn() async {
    //check user login state
    ///get token
    await getToken();
    log(_token.toString());
    ///get user profile data
    await getUserProfileData();
    log(_profileData.toString());
    return _token != null; //best way
  } //===========================End Is logged In Method ====================================

  Future<void> saveToken(String userToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _token = userToken;
    await sharedPreferences.setString("craftyToken", userToken);
  } //===========================End Save Token Method ======================================

  Future<void> saveUserProfileData(ProfileData profileData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _profileData = userProfileData;
    await sharedPreferences.setString("userProfileData", userProfileData!.toJson().toString());
  } //===========================End Save User Profile Data ==================================

  Future<void> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _token = sharedPreferences.getString("craftyToken");
  } //===========================End Get Token Method =======================================

  Future<void> getUserProfileData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(jsonDecode(sharedPreferences.getString("userProfileData") ?? "{}"));
  } //===========================End Get User Profiled Data Method ==========================

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  } //===========================End Clear User Data Method =================================
}

