import 'package:dio/dio.dart';

class ApiResponse {
   Response? response;
   dynamic error;
  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue) : response = null, error = errorValue;

  ApiResponse.withSuccess(Response responseValue) : response = responseValue, error = null;
}
