

class ResponseModel{

  final int statusCode;
  final dynamic responseBody;
  final bool isSuccess;

  ResponseModel({required this.isSuccess, required this.statusCode, required this.responseBody, });


}