import 'package:dio/dio.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../utils/Apis.dart';

class JobRepo {
  final DioClient dioClient;
  JobRepo({required this.dioClient});

  Future<ApiResponse> getVewAllJob(int pageId, int? muniId, int? categoryId,
      int? pradeshId, int? districtId) async {
    var mid = muniId == null ? '' : muniId;
    var catId = categoryId == null ? '' : categoryId;
    var pId = pradeshId == null ? '' : pradeshId;
    var dId = districtId == null ? '' : districtId;

    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_SEARCH_JOBS}muni_id=$mid&category_id=$catId&pradesh_id=$pId&district_id=$dId&page=$pageId',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSingVewJob(int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_SINGLE_JOB}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getSearchAllJob(String url, int pageId) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_SEARCH_JOBS}$pageId$url',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getJobCategory() async {
    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_ALL_JOBS_CACEGORY}',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> applyJob(int id) async {
    try {
      Response? response = await dioClient.post(
        '${Apis.JOB_APPLAY_F}$id${Apis.JOB_APPLAY_L}',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
