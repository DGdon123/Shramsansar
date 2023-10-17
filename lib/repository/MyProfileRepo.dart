import 'package:dio/dio.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/datasource/remote/exception/api_error_handler.dart';
import '../models/SendDataModels/profile/AboutMeModelSend.dart';
import '../models/SendDataModels/profile/AddEducationModel.dart';
import '../utils/Apis.dart';

class MyProfileRepo{
  final DioClient dioClient;
  MyProfileRepo({required this.dioClient});



  Future<ApiResponse> getMyProfile() async {
    try {
      Response? response = await dioClient.get(
        Apis.MY_PROFILE,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  Future<ApiResponse> getSkills() async {
    try {
      Response? response = await dioClient.get(
        Apis.SKILLS,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getEducationLevel() async {
    try {
      Response? response = await dioClient.get(
        Apis.EDUCATION,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }




  Future<ApiResponse> postAboutMe(AboutMeModelSend aboutMeModelSend) async {
    try {
      Response? response = await dioClient.post(
        Apis.POST_ABOUT_ME,
        data: aboutMeModelSend.toJson()
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }





  ///Education
  Future<ApiResponse> postEducation(AddEducationModel addEducationModel) async {
    try {
      Response? response = await dioClient.post(
        Apis.POST_EDUCATION,
        data: addEducationModel.toJson()
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateEducation(int id, AddEducationModel addEducationModel) async {
    try {
      Response? response = await dioClient.post(
        '${Apis.UPDATE_EDUCATION}$id',
        data: addEducationModel.toJson()
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteEducation(int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.DELETE_EDUCATION}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ///experience
  ///
  Future<ApiResponse> postExperience(FormData formData) async {
    try {
      Response? response = await dioClient.post(
          Apis.POST_EXPERINCE,
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateExperience(FormData formData) async {
    try {
      Response? response = await dioClient.post(
          Apis.POST_EXPERINCE,
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> deleteExperience(int id) async {
    try {
      Response? response = await dioClient.get(
          '${Apis.DELETE_EXPERINCE}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  ///Tranining
  Future<ApiResponse> postTraning(FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.POST_TRANINGS}',
         data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateTraning(int id,FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.UPDATE_TRANINGS}$id',
         data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteTraning(int id) async {
    try {
      Response? response = await dioClient.get(
          '${Apis.DELETE_TRANINGS}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///SKILL
  Future<ApiResponse> postSkills(FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.POST_SKILL}',
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteSkills(int id) async {
    try {
      Response? response = await dioClient.get(
          '${Apis.DELETE_SKILL}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  ///language
  Future<ApiResponse> postLanguage(FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.POST_LAMGUAGE}',
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> updateLanguage(int id,FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.UPDATE_LAMGUAGE}$id',
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteLanguage(int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.DELETE_LAMGUAGE}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }




  Future<ApiResponse> getPradesh() async {
    try {
      Response? response = await dioClient.get(
        Apis.PRODESH_EM,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getDistricts() async {
    try {
      Response? response = await dioClient.get(
        Apis.DISTRICTS_EM,
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

  Future<ApiResponse> postPreferenceLocation(FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.POST_LOCATION}',
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  Future<ApiResponse> updatePreferenceLocation(int id,FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.UPDATE_LOCATION}$id',
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteLocation(int id) async {
    try {
      Response? response = await dioClient.get(
        '${Apis.DELETE_LOCATION}$id',
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  /// Special
  Future<ApiResponse> postSpecialAdd(FormData formData) async {
    try {
      Response? response = await dioClient.post(
          '${Apis.SPESIAL_ADD}',
          data: formData
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> getSocial() async {
    try {
      Response? response = await dioClient.get(
        Apis.GET_SOCIAL_NAME,
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> deleteSocial(String id) async {
    try {
      Response? response = await dioClient.get(
        "${Apis.DELETE_SOCIAL}$id",
      );
      return ApiResponse.withSuccess(response!);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}