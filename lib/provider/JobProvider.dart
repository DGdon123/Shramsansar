import 'package:flutter/foundation.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../models/ResponsModels/SinglJobViewModel.dart';
import '../models/ResponsModels/ViewAllJobCategoryModel.dart';
import '../models/ResponsModels/ViewAllJobsModel.dart';
import '../models/response_model.dart';
import '../repository/JobsRepo.dart';

class JobProvider with ChangeNotifier {
  JobRepo jobRepo;
  JobProvider(this.jobRepo);

  ViewAllJobsModel? viewAllJobsModel;
  List<ViewAllJobsData>? viewAllJobsData;

  ViewAllJobCategoryModel? viewAllJobCategoryModel;
  List<ViewAllJobCategoryData>? viewAllJobCategoryDataList;

  Future<ResponseModel> getVewAllJob(int pageId, int? muniId, int? categoryId,
      int? pradeshId, int? districtId) async {
    viewAllJobsData = [];
    notifyListeners();
    ApiResponse apiResponse = await jobRepo.getVewAllJob(
        pageId, muniId, categoryId, pradeshId, districtId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      viewAllJobsModel = ViewAllJobsModel.fromJson(map);

      viewAllJobsData?.addAll(viewAllJobsModel!.data!);

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

  SinglJobViewModel? viewSingJobsModelMain;
  SinglJobViewData? viewSingJobsModel;
  Future<ResponseModel> getSingVewJob(int id) async {
    notifyListeners();
    ApiResponse apiResponse = await jobRepo.getSingVewJob(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      viewSingJobsModelMain = SinglJobViewModel.fromJson(map);
      viewSingJobsModel = viewSingJobsModelMain?.data;
      print('jsdgkjhsjkg ${viewSingJobsModel!.id}');

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
    viewAllJobsData = [];
    notifyListeners();
    ApiResponse apiResponse = await jobRepo.getSearchAllJob(url, pageId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      viewAllJobsModel = ViewAllJobsModel.fromJson(map);

      viewAllJobsData?.addAll(viewAllJobsModel!.data!);

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

  Future<ResponseModel> getJobCategory(int pageId) async {
    viewAllJobCategoryDataList = [];
    notifyListeners();
    ApiResponse apiResponse = await jobRepo.getJobCategory();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      viewAllJobCategoryModel = ViewAllJobCategoryModel.fromJson(map);
      viewAllJobCategoryDataList?.addAll(viewAllJobCategoryModel!.data!);
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

  Future<ResponseModel> applyJob(int id) async {
    viewAllJobCategoryDataList = [];

    notifyListeners();
    ApiResponse apiResponse = await jobRepo.applyJob(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
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
