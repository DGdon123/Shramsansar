import 'package:flutter/foundation.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../models/ResponsModels/SingleTraningModel.dart';
import '../models/ResponsModels/TrainingCategoryModel.dart';
import '../models/ResponsModels/ViewAllTrainingsModel.dart';
import '../models/response_model.dart';
import '../repository/ViewAllTrainingsRepo.dart';

class TrainingsProvider with ChangeNotifier {
  ViewAllTrainingsRepo viewAllTrainingsRepo;
  TrainingsProvider(this.viewAllTrainingsRepo);

  ViewAllTrainingsModel? viewAllTrainingsModel;
  List<ViewAllTrainingsData>? viewAllTrainingsDataList;

  TrainingCategoryModel? trainingCategoryModel;
  List<TrainingCategoryData>? trainingCategoryData;

  Future<ResponseModel> getVewAllTraining(int pageId, int? categoryId,
      int? pradeshId, int? districtId, int? muniId) async {
    viewAllTrainingsDataList = [];
    notifyListeners();
    ApiResponse apiResponse = await viewAllTrainingsRepo.getVewAllTraining(
        pageId, categoryId, pradeshId, districtId, muniId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      viewAllTrainingsModel = ViewAllTrainingsModel.fromJson(map);

      viewAllTrainingsDataList?.addAll(viewAllTrainingsModel!.data!);

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

  SingleTraningModel? singleTraningModel;
  SingleTraningData? singleTraningData;

  Future<ResponseModel> getVewSingleTraining(int id) async {
    notifyListeners();
    ApiResponse apiResponse =
        await viewAllTrainingsRepo.getVewSingleTraining(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      singleTraningModel = SingleTraningModel.fromJson(map);
      singleTraningData = singleTraningModel?.data;
      ;

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

  Future<ResponseModel> getTrainingCategory(int pageId) async {
    trainingCategoryData = [];
    notifyListeners();
    ApiResponse apiResponse = await viewAllTrainingsRepo.getTrainingCategory();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      trainingCategoryModel = TrainingCategoryModel.fromJson(map);
      trainingCategoryData?.addAll(trainingCategoryModel!.data!);

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

  Future<ResponseModel> getSearchAllJob(String url, int pageId) async {
    viewAllTrainingsDataList = [];
    notifyListeners();
    ApiResponse apiResponse =
        await viewAllTrainingsRepo.getSearchAllJob(url, pageId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      viewAllTrainingsModel = ViewAllTrainingsModel.fromJson(map);

      viewAllTrainingsDataList?.addAll(viewAllTrainingsModel!.data!);

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

  Future<ResponseModel> applayTraining(int pageId) async {
    notifyListeners();
    ApiResponse apiResponse = await viewAllTrainingsRepo.apllayTraining(pageId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      print('hghsdgh ${map['message']}');

      responseModel = ResponseModel(true, map['message'], responseCode!);
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
