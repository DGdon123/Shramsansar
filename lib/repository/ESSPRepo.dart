import 'package:dio/dio.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../utils/Apis.dart';

class ESSPRepo {
  final DioClient dioClient;
  ESSPRepo({required this.dioClient});

  Future<ApiResponse> getVewAllESSP(int pageId) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_ALL_Essp}$pageId',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getVewAllTsp(int pageId) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.VIEW_ALL_Tsp}$pageId',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getServiceProvider(int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.ESSP_SERVICE_PROVIDER_DETAILS}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getTsspDetails(int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.TSP_DETAILS}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
