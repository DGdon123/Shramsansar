import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../models/ResponsModels/ESSPModel.dart';
import '../models/ResponsModels/EsspServiceDetailsModel.dart';

import '../models/ResponsModels/TspDetailsModel.dart';
import '../models/ResponsModels/TspModel.dart';
import '../models/ResponsModels/ViewAllJobsModel.dart';
import '../models/ResponsModels/ViewAllTrainingsModel.dart';
import '../models/response_model.dart';
import '../repository/ESSPRepo.dart';

class ESSPProvider with ChangeNotifier {
  ESSPRepo esspRepo;
  ESSPProvider(this.esspRepo);

  EsspModel? esspModel;
  List<EsspModelData>? esspModelDataList;

  TspModel? tspModel;
  List<TspData>? tspData;

  EsspServiceDetailsModel? esspServiceDetailsModel;
  List<ViewAllJobsData>? esspServiceDetailsjobs;
  List<ViewAllTrainingsData>? esspServiceDetailstrainings;

  TspDetailsModel? tspDetailsModel;
  List<ViewAllTrainingsData>? tspDetailsTrainings;

  Future<ResponseModel> getVewAllEssp(int pageId) async {
    esspModelDataList = [];
    notifyListeners();
    ApiResponse apiResponse = await esspRepo.getVewAllESSP(pageId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      esspModel = EsspModel.fromJson(map);
      esspModelDataList?.addAll(esspModel!.data!);

      print(map);
      log("Hrello");

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

  Future<ResponseModel> getVewAllTsp(int pageId) async {
    tspData = [];
    notifyListeners();
    ApiResponse apiResponse = await esspRepo.getVewAllTsp(pageId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      tspModel = TspModel.fromJson(map);

      tspData?.addAll(tspModel!.data!);

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

  Future<ResponseModel> getEsspServiceProvider(int id) async {
    esspServiceDetailsjobs = [];
    esspServiceDetailstrainings = [];
    notifyListeners();
    ApiResponse apiResponse = await esspRepo.getServiceProvider(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      esspServiceDetailsModel = EsspServiceDetailsModel.fromJson(map);

      esspServiceDetailsjobs?.addAll(esspServiceDetailsModel!.jobs!);
      esspServiceDetailstrainings?.addAll(esspServiceDetailsModel!.trainings!);

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

  Future<ResponseModel> getTsspDetails(int id) async {
    tspDetailsTrainings = [];
    notifyListeners();
    ApiResponse apiResponse = await esspRepo.getTsspDetails(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      tspDetailsModel = TspDetailsModel.fromJson(map);

      tspDetailsTrainings?.addAll(tspDetailsModel!.trainings!);

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
