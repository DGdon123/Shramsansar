import 'dart:developer';

import 'package:dio/dio.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../utils/Apis.dart';

class LocationRepo {
  final DioClient dioClient;
  LocationRepo({required this.dioClient});

  Future<ApiResponse> getPradesh() async {
    try {
      Response? response = await dioClient.get(
        Apis.PRODESH,
      );

      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getDistricts(int id) async {
    log('fetching districts');
    try {
      Response? response = await dioClient.get(
        '${Apis.DISTRICTS}$id',
      );
      log(response!.data.toString());
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getGender() async {
    try {
      Response? response = await dioClient.get(
        Apis.GENSER,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getWard() async {
    try {
      Response? response = await dioClient.get(
        Apis.WARD,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getMunicipalities(int id) async {
    try {
      Response? response = await dioClient.get(
        Apis.MUNICIPALITIES + '$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getMunicipalitiesAll() async {
    try {
      Response? response = await dioClient.get(
        Apis.MUNICIPALITIES_All,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getNotification() async {
    try {
      Response? response = await dioClient.get(
        Apis.NOTIFICATION_URI,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getJobCategory() async {
    try {
      Response? response =
          await dioClient.get('${Apis.VIEW_ALL_JOBS_CACEGORY}');
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getDocomentType() async {
    try {
      Response? response = await dioClient.get('${Apis.DOCOMENT_TYPE}');
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCast() async {
    try {
      Response? response = await dioClient.get('${Apis.GET_CAST}');
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
