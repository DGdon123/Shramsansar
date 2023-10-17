
import 'package:dio/dio.dart';
import 'package:lmiis/models/SendDataModels/UserLogin.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../models/SendDataModels/ChangePasswordSendModel.dart';
import '../models/SendDataModels/ForegetPasswordSendModel.dart';
import '../models/SendDataModels/RegistationSendModel.dart';
import '../utils/Apis.dart';

class AuthRepo {
  final DioClient dioClient;
  AuthRepo({required this.dioClient});

  Future<ApiResponse> login(UserLogin userLogin) async {
    try {
      Response? response = await dioClient.post(
        Apis.LOGIN_URI,
        data: userLogin.toJson(),
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> register(RegistationSendModel registerSendModel) async {
    try {
      Response? response = await dioClient.post(
        Apis.REGISTER,
        data: registerSendModel.toJson(),
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> logOut() async {
    try {
      Response? response = await dioClient.get(
        Apis.LOG_OUT_URI,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }




  Future<ApiResponse> forgetPassword(ForgetPasswordSendModel forgetPasswordSendModel) async {
    try {
      Response? response = await dioClient.post(
        Apis.FOR_GET_PASSWORD,
        data: forgetPasswordSendModel.toJson(),
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> changePassword(ChangePasswordSendModel changePasswordSendModel) async {
    try {
      Response? response = await dioClient.post(
        Apis.CHNAGE_PASSWORD,
        data: changePasswordSendModel.toJson(),
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}