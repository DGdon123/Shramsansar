import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmiis/models/ResponsModels/latest_job..dart';
import 'package:lmiis/models/ResponsModels/training_category_model.dart';
import 'package:lmiis/models/district_new_model.dart';
import 'package:lmiis/models/new_grade_model.dart';
import 'package:lmiis/models/new_muni_model.dart';
import 'package:lmiis/models/pradeshModel.dart';
import 'package:lmiis/views/about_us/data/model/about_us_model.dart';

import '../../../../models/ResponsModels/caste_model.dart';
import '../../../../models/ResponsModels/latest_training_model.dart';
import '../../../../utils/AppConstants.dart';
import '../../../../views/download_screen/data/model/download_model.dart';
import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor? loggingInterceptor;

  Dio? dio;
  String? token;

  DioClient(this.baseUrl, Dio? dioC, {this.loggingInterceptor}) {
    dio = dioC ?? Dio();
    dio?.options.baseUrl = baseUrl;
    Duration timeoutDuration = const Duration(seconds: 60);
    dio?.options.connectTimeout = timeoutDuration;
    dio?.options.receiveTimeout = timeoutDuration;
    dio?.httpClientAdapter = IOHttpClientAdapter();
    dio?.interceptors.add(loggingInterceptor!);
  }

  Future<Response?> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final box = GetStorage();
      token = box.read(AppConstants.TOKEN);
      dio?.options.headers = {'Authorization': 'Bearer $token'};
      var response = await dio?.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      log(e.message.toString());
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      print('===============${e.toString()}');
      rethrow;
    }
  }

  Future<Response?> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final box = GetStorage();
      token = box.read(AppConstants.TOKEN);
      dio?.options.headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      dio?.options.followRedirects = true;
      dio?.options.validateStatus = (status) => true;

      var response = await dio?.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final box = GetStorage();
      token = box.read(AppConstants.TOKEN);
      dio?.options.headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };

      var response = await dio?.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response?> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final box = GetStorage();
      token = box.read(AppConstants.TOKEN);
      dio?.options.headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      var response = await dio?.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

class ApiClient {
  final dio = Dio();

  Future<List<NewPradeshModel>> getPradeshData() async {
    final result = await dio.get("http://shramsansar.koshi.gov.np/api/pradesh");
    final responseData = result.data;
    return List.from(responseData['data'])
        .map((e) => NewPradeshModel.fromMap(e))
        .toList();
  }

  Future<List<DistrictNewModel>> getDistricts() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/districts");
    final responseData = result.data;
    return List.from(responseData['data'])
        .map((e) => DistrictNewModel.fromMap(e))
        .toList();
  }

  Future<List<NewMuniModel>> getMunicipalities() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/municipalities");
    final responseData = result.data;
    return List.from(responseData['data'])
        .map((e) => NewMuniModel.fromMap(e))
        .toList();
  }

  Future<List<NewGradeModel>> getGrades() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/category");
    final responseData = result.data;
    return List.from(responseData['data'])
        .map((e) => NewGradeModel.fromMap(e))
        .toList();
  }

  Future<List<NewTrainingCategoryModel>> getTrainingCategory() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/training/category");
    final responseData = result.data;

    return List.from(responseData["data"])
        .map((e) => NewTrainingCategoryModel.fromMap(e))
        .toList();
  }

  Future<List<LatestTrainingModel>> newgetLatestTraining() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/latest/trainings");
    final responseData = result.data;
    // log("${result.data}sss");
    return List.from(responseData["data"])
        .map((e) => LatestTrainingModel.fromJson(e))
        .toList();
  }

  Future<List<LatestJobModel>> newgetLatestJobs() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/latest/jobs");

    log("${result.data}Surathg");
    final responseData = result.data;

    return List.from(responseData["data"])
        .map((e) => LatestJobModel.fromJson(e))
        .toList();
  }

  Future<List<NewCasteModel>> newsCasteList() async {
    final result = await dio.get("http://shramsansar.koshi.gov.np/api/cast");

    // log(result.data.toString());
    final responseData = result.data;
    List value = responseData["data"];
    return value.map((e) => NewCasteModel.fromMap(e)).toList();

    // return List.from(responseData["data"])
    //     .map((e) => fromMap.fromJson(e))
    //     .toList();
  }

  Future<AboutUsModel> aboutUs() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/about-us");

    // log(result.data.toString());
    final responseData = result.data;
    var value = responseData["data"];
    return AboutUsModel.fromJson(value);

    // return List.from(responseData["data"])
    //     .map((e) => fromMap.fromJson(e))
    //     .toList();
  }

  Future<List<DownloadModel>> downloadFile() async {
    final result =
        await dio.get("http://shramsansar.koshi.gov.np/api/download");

    // log(result.data.toString());
    final responseData = result.data;
    List value = responseData["data"];
    return value.map((e) => DownloadModel.fromJson(e)).toList();

    // return List.from(responseData["data"])
    //     .map((e) => fromMap.fromJson(e))
    //     .toList();
  }
}
