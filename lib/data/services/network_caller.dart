import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_project/data/model/response_model.dart';
import 'package:http/http.dart';
import '../utils/urls.dart';

class NetworkCaller {
  //singleTon
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response = await get(Uri.parse(Urls.baseUrl + url));
      log("Request Url: ${Urls.baseUrl + url}");
      log("Get request response: ${response.body}");

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
