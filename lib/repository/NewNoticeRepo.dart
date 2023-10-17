import 'package:dio/dio.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../utils/Apis.dart';

class NewsNoticeRepo{
  final DioClient dioClient;
  NewsNoticeRepo({required this.dioClient});

  Future<ApiResponse> getNewNotice(int pageId) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.NEW_NOTICE}$pageId',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  Future<ApiResponse> getNewNoticeSingle(int? id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.NEW_NOTICE_SINGLE}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> searchNewNotice(String title,int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.SEARCH_NEW_NOTICE_F}$title${Apis.SEARCH_NEW_NOTICE_L}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }




}