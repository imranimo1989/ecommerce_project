import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_project/data/model/response_model.dart';
import 'package:ecommerce_project/ui/state_manager/auth_controller.dart';
import 'package:http/http.dart';
import '../utils/urls.dart';

class NetworkCaller {
  //singleTon
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response = await get(
          Uri.parse(
            Urls.baseUrl + url,
          ),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "token": AuthController.token.toString(),
          });

      log("Request Url: ${Urls.baseUrl + url}"); //print url in console
      log("Get request response: ${response.body}"); //print response data in console

      if (response.statusCode == 200) {
        return ResponseModel(
          isSuccess: true,
          statusCode: response.statusCode,
          responseBody: jsonDecode(response.body),
        );
      } else {
        return ResponseModel(
          isSuccess: false,
          statusCode: response.statusCode,
          responseBody: jsonDecode(response.body),
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        isSuccess: false,
        statusCode: -1,
        responseBody: e.toString(),
      );
    }
  }
}
