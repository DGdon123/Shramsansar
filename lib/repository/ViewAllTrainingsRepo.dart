import 'package:dio/dio.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../utils/Apis.dart';

class ViewAllTrainingsRepo {
  final DioClient dioClient;
  ViewAllTrainingsRepo({required this.dioClient});

  Future<ApiResponse> getVewAllTraining(int pageId, int? categoryId,
      int? pradeshId, int? districtId, int? muniId) async {
    var mid = muniId == null ? '' : muniId;
    var catId = categoryId == null ? '' : categoryId;
    var pId = pradeshId == null ? '' : pradeshId;
    var dId = districtId == null ? '' : districtId;

    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_SEARCH_TRAINING}?muni_id=$mid&category_id=$catId&pradesh_id=$pId&district_id=$dId&page=$pageId',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getVewSingleTraining(int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_SINGLE_TRAININGS}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTrainingCategory() async {
    try {
      Response? response = await dioClient.get(
        Apis.TRAININGS_CATEGORY,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSearchAllJob(String url, int pageId) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_SEARCH_TRAINING}$pageId$url',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> apllayTraining(int pageId) async {
    try {
      Response? response = await dioClient.post(
        '${Apis.TRAINING_APPLLAY_F}$pageId${Apis.TRAINING_APPLLAY_L}',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
