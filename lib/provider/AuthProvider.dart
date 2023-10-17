import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../models/ResponsModels/LoginToken.dart';
import '../models/SendDataModels/ChangePasswordSendModel.dart';
import '../models/SendDataModels/ForegetPasswordSendModel.dart';
import '../models/SendDataModels/RegistationSendModel.dart';
import '../models/SendDataModels/UserLogin.dart';
import '../models/response_model.dart';
import '../repository/AuthRepo.dart';
import '../utils/AppConstants.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});
  LoginToken? loginToken;

  Future<ResponseModel> login(UserLogin userLogin) async {
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(userLogin);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;
    print('code      ${apiResponse.response?.statusCode}');

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 201) {
      Map map = apiResponse.response?.data;
      loginToken = LoginToken.fromJson(map);
      final box = GetStorage();
      box.write(AppConstants.TOKEN, loginToken?.token!);
      responseModel = ResponseModel(true, 'successful', responseCode!);
    } else if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 500) {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    } else {
      Map map = apiResponse.response?.data;
      String errorMessage = map["message"];
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    }

    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> register(RegistationSendModel registerSendModel) async {
    notifyListeners();
    ApiResponse apiResponse = await authRepo.register(registerSendModel);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;
    print('code      ${apiResponse.response?.statusCode}');

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 201) {
      Map map = apiResponse.response?.data;
      loginToken = LoginToken.fromJson(map);
      final box = GetStorage();
      box.write(AppConstants.TOKEN, loginToken?.token!);
      responseModel = ResponseModel(true, 'successful', responseCode!);
    } else if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 500) {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    } else {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    }

    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> forgetPassword(
      ForgetPasswordSendModel forgetPasswordSendModel) async {
    notifyListeners();
    ApiResponse apiResponse =
        await authRepo.forgetPassword(forgetPasswordSendModel);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;
    print('code      ${apiResponse.response?.statusCode}');

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;

      responseModel = ResponseModel(true, 'successful', responseCode!);
    } else if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 500) {
      log(apiResponse.response!.statusCode!.toString());
      String errorMessage = 'Server Errorb';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    } else {
      String errorMessage =
          apiResponse.response!.data!["errors"]["email"][0].toString();
      log(apiResponse.response!.data!["errors"]["email"].toString());
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    }

    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> changePassword(
      ChangePasswordSendModel changePasswordSendModel) async {
    notifyListeners();
    ApiResponse apiResponse =
        await authRepo.changePassword(changePasswordSendModel);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;
    print('code ${apiResponse.response?.statusCode}');

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      print(map['message']);

      if (map['message'] == 'Password not match') {
        responseModel =
            ResponseModel(false, '${map['message']}', responseCode!);
      } else if (map['message'] == 'Password is not same as old password') {
        responseModel =
            ResponseModel(false, '${map['message']}', responseCode!);
      } else {
        responseModel = ResponseModel(true, '${map['message']}', responseCode!);
      }
    } else if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 500) {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    } else {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    }

    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> logOut() async {
    notifyListeners();
    ApiResponse apiResponse = await authRepo.logOut();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;
    print('code      ${apiResponse.response?.statusCode}');

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      //Map map = apiResponse.response?.data;

      responseModel = ResponseModel(true, 'successful', responseCode!);
    } else if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 500) {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    } else {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    }

    notifyListeners();
    return responseModel;
  }
}
