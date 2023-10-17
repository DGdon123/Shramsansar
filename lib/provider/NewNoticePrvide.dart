import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../models/ResponsModels/NewNoticeSingleModel.dart';
import '../models/ResponsModels/NewsNoticeModel.dart';
import '../models/ResponsModels/NewsNoticeModelSearch.dart';
import '../models/response_model.dart';
import '../repository/NewNoticeRepo.dart';

class NewsNoticeProvider with ChangeNotifier{

  NewsNoticeRepo newsNoticeRepo;
  NewsNoticeProvider(this.newsNoticeRepo);

  NewsNoticeModel? newsNoticeModel;
  NewNoticeSingleModel? newNoticeSingleModel;
  List<NewsNoticeData>? newsNoticeDataList = [];

  Future<ResponseModel> getNewNotice(int pageId) async {
    newsNoticeDataList = [];

    notifyListeners();
    ApiResponse apiResponse = await newsNoticeRepo.getNewNotice(pageId);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      newsNoticeModel = NewsNoticeModel.fromJson(map);
      newsNoticeDataList?.addAll(newsNoticeModel!.data!);

      responseModel = ResponseModel(true, 'successful',responseCode!);
    } else if (apiResponse.response != null && apiResponse.response?.statusCode == 500) {

      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage,responseCode!);
    }else{
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage,responseCode!);
    }

    notifyListeners();
    return responseModel;
  }






  Future<ResponseModel> getNewNoticeSingle(int? id) async {
    newNoticeSingleModel = null;

    notifyListeners();
    ApiResponse apiResponse = await newsNoticeRepo.getNewNoticeSingle(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      print('sdfds ${map}');
      newNoticeSingleModel = NewNoticeSingleModel.fromJson(map);

      responseModel = ResponseModel(true, 'successful',responseCode!);
    } else if (apiResponse.response != null && apiResponse.response?.statusCode == 500) {

      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage,responseCode!);
    }else{
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage,responseCode!);
    }

    notifyListeners();
    return responseModel;
  }







  NewsNoticeModelSearch? newsNoticeModelSearch;


  Future<ResponseModel> searchNewNotice(String title,int? id) async {
    newsNoticeDataList = [];
    notifyListeners();
    ApiResponse apiResponse = await newsNoticeRepo.searchNewNotice(title,id!);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {

      print('sdsdfd  ${apiResponse.response?.data}');
      Map map = apiResponse.response?.data;
      newsNoticeModel = NewsNoticeModel.fromJson(map);
      newsNoticeDataList?.addAll(newsNoticeModel!.data!);

     // json.decode(apiResponse.response?.data);
     // Map map = apiResponse.response?.data;
     // newsNoticeModelSearch = NewsNoticeModelSearch.fromJson(map);

      responseModel = ResponseModel(true, 'successful',responseCode!);
    } else if (apiResponse.response != null && apiResponse.response?.statusCode == 500) {

      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage,responseCode!);
    }else{
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage,responseCode!);
    }

    notifyListeners();
    return responseModel;
  }



}