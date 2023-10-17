import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../models/ResponsModels/CastModel.dart';
import '../models/ResponsModels/DistrictsModel.dart';
import '../models/ResponsModels/DocumentTypeModel.dart';
import '../models/ResponsModels/GenderModel.dart';
import '../models/ResponsModels/MunicipalitiesModel.dart';
import '../models/ResponsModels/NotificationModel.dart';
import '../models/ResponsModels/PradeshModel.dart';
import '../models/ResponsModels/ViewAllJobCategoryModel.dart';
import '../models/ResponsModels/WardModel.dart';
import '../models/response_model.dart';
import '../repository/LocationRepo.dart';
import '../utils/AppConstants.dart';

class LocationProvider with ChangeNotifier {
  final LocationRepo locationRepo;
  LocationProvider(this.locationRepo);

  ///MunicipalitiesModel All
  MunicipalitiesModel? municipalitiesModelAll;
  List<MunicipalitiesData>? municipalitiesDataAll;
  List<String> pleaseMunicipalityWordsAll = [
    AppConstants.Please_be_a_municipality
  ];
  List<int> pleaseMunicipalityWordsIdListAll = [0];

  ///MunicipalitiesModel
  MunicipalitiesModel? municipalitiesModel;
  List<MunicipalitiesData>? municipalitiesData;
  List<String> pleaseMunicipalityWords = [
    AppConstants.Please_be_a_municipality
  ];
  List<int> pleaseMunicipalityWordsIdList = [0];

  ///DistrictsModel
  DistrictsModel? districtsModel;
  List<DistrictsData>? pleaseTheDistrictWordsFullData;

  List<String> pleaseTheDistrictWords = [
    AppConstants.Please_enter_the_district
  ];
  List<int> pleaseTheDistrictWordsIdList = [0];

  ///PradeshModel
  PradeshModel? pradeshModel;
  List<PradeshData>? pradeshDataList;
  List<String>? pradashWords;
  List<int>? pradashWordsIdList;

  ///Notification
  NotificationModel? notificationModel;
  List<NotificationData>? notificationData;

  ///Ward
  WardModel? wardModel;
  List<WardData>? wardData;
  List<String>? pleaseSeletcWardValueWords = [AppConstants.Please_be_a_ward];
  List<int>? wardDataInt = [0];

  ///Gender
  GenderModel? genderModel;
  List<GenderData>? genderData;
  List<String>? genderWord = [AppConstants.select_gender];
  List<int>? genderDataInt = [0];

  ///Tempo
  ///MunicipalitiesModel tamp
  MunicipalitiesModel? tMunicipalitiesModel;
  List<MunicipalitiesData>? tMunicipalitiesData;
  List<String> tPleaseMunicipalityWords = [
    AppConstants.Please_be_a_municipality
  ];
  List<int> tPleaseMunicipalityWordsIdList = [0];

  ///DistrictsModel   Tamporaly
  DistrictsModel? tDistrictsModel;
  List<DistrictsData>? tPleaseTheDistrictWordsFullData;
  List<String> tPleaseTheDistrictWords = [
    AppConstants.Please_enter_the_district
  ];
  List<int> tPleaseTheDistrictWordsIdList = [0];

  ///PradeshModel
  PradeshModel? tPradeshModel;
  List<PradeshData>? tPradeshDataList;
  List<String> tPradashWords = [
    AppConstants.please_state_channuhos,
  ];
  List<int> tPradashWordsIdList = [0];

  var pleasePradashValueWord = AppConstants.please_state_channuhos;
  int pradashWordsId = 0;

  setPradesh(String pleasePradashValueWord, int pradashWordsId) {
    this.pleasePradashValueWord = pleasePradashValueWord;
    this.pradashWordsId = pradashWordsId;
    notifyListeners();
  }

  Future<ResponseModel> getPradesh() async {
    pradashWordsIdList = [0];
    pradashWords = [
      AppConstants.please_state_channuhos,
    ];
    pradeshDataList = [];

    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getPradesh();
    log('pradesh test : ${apiResponse.response!.data.toString()}');
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      pradeshModel = PradeshModel.fromJson(map);
      pradeshDataList?.addAll(pradeshModel!.data!);
      pradeshDataList?.forEach((element) {
        pradashWords?.add(element.name!);
        pradashWordsIdList?.add(element.id!);
      });
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

  var districtsName = AppConstants.Please_enter_the_district;
  int districtsNameId = 0;
  setDistricName(String districtsName, int districtsNameId) {
    this.districtsName = districtsName;
    this.districtsNameId = districtsNameId;
    notifyListeners();
  }

  Future<ResponseModel> getDistricts(int id) async {
    pleaseTheDistrictWordsFullData = [];
    pleaseTheDistrictWords = [AppConstants.Please_enter_the_district];
    pleaseTheDistrictWordsIdList = [0];
    notifyListeners();

    ApiResponse apiResponse = await locationRepo.getDistricts(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      log("${apiResponse.response!.data}dsd");
      Map map = apiResponse.response?.data;
      districtsModel = DistrictsModel.fromJson(map);
      pleaseTheDistrictWordsFullData?.addAll(districtsModel!.data!);
      pleaseTheDistrictWordsFullData?.forEach((element) {
        pleaseTheDistrictWords.add(element.name!);
        pleaseTheDistrictWordsIdList.add(element.id!);
      });
      log(map.toString());

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

  var municipalitiesName = AppConstants.Please_be_a_municipality;
  int municipalitiesNameId = 0;

  setMunicipalitiesName(String municipalitiesName, int municipalitiesNameId) {
    this.municipalitiesName = municipalitiesName;
    this.municipalitiesNameId = municipalitiesNameId;
    notifyListeners();
  }

  Future<ResponseModel> getMunicipalities(int id) async {
    municipalitiesData = [];
    pleaseMunicipalityWords = [];
    pleaseMunicipalityWordsIdList = [];

    pleaseMunicipalityWords = [AppConstants.Please_be_a_municipality];
    pleaseMunicipalityWordsIdList = [0];
    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getMunicipalities(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      municipalitiesModel = MunicipalitiesModel.fromJson(map);

      //var cleanList =  municipalitiesModel!.data!.removeWhere((element) => element.districtName == element.districtName!.codeUnitAt(1));
      var seen = <String>{};
      List<MunicipalitiesData> uniquelist = municipalitiesModel!.data!
          .where((student) => seen.add(student.districtName!))
          .toList();
      municipalitiesData?.addAll(uniquelist);
      for (var element in uniquelist) {
        pleaseMunicipalityWords.add(element.districtName!);
        pleaseMunicipalityWordsIdList.add(element.id!);
      }

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

  Future<ResponseModel> getMunicipalitiesAll() async {
    municipalitiesDataAll = [];
    pleaseMunicipalityWordsAll = [];
    pleaseMunicipalityWordsIdListAll = [];

    pleaseMunicipalityWordsAll = [AppConstants.Please_be_a_municipality];
    pleaseMunicipalityWordsIdListAll = [0];
    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getMunicipalitiesAll();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      municipalitiesModelAll = MunicipalitiesModel.fromJson(map);

      //var cleanList =  municipalitiesModel!.data!.removeWhere((element) => element.districtName == element.districtName!.codeUnitAt(1));

      print('fgfdgdf ${municipalitiesModelAll!.data!.length}');

      var seen = <String>{};
      List<MunicipalitiesData> uniquelist = municipalitiesModelAll!.data!
          .where((student) => seen.add(student.districtName!))
          .toList();
      municipalitiesDataAll?.addAll(uniquelist);
      for (var element in uniquelist) {
        pleaseMunicipalityWordsAll.add(element.districtName!);
        pleaseMunicipalityWordsIdListAll.add(element.id!);
      }

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

  ///Tempo
  Future<ResponseModel> tGetPradesh() async {
    tPradeshDataList = [];

    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getPradesh();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      tPradeshModel = PradeshModel.fromJson(map);
      tPradeshDataList?.addAll(pradeshModel!.data!);

      tPradeshDataList?.forEach((element) {
        tPradashWords.add(element.name!);
        tPradashWordsIdList.add(element.id!);
      });
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

  Future<ResponseModel> tGetDistricts(int id) async {
    tPleaseTheDistrictWordsFullData = [];
    tPleaseTheDistrictWords = [];
    tPleaseTheDistrictWordsIdList = [];

    tPleaseTheDistrictWords = [AppConstants.Please_enter_the_district];
    tPleaseTheDistrictWordsIdList = [0];
    notifyListeners();

    ApiResponse apiResponse = await locationRepo.getDistricts(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      tDistrictsModel = DistrictsModel.fromJson(map);
      tPleaseTheDistrictWordsFullData?.addAll(tDistrictsModel!.data!);
      var seen = <String>{};
      List<DistrictsData> uniquelist = tPleaseTheDistrictWordsFullData!
          .where((student) => seen.add(student.name!))
          .toList();
      for (var element in uniquelist) {
        tPleaseTheDistrictWords.add(element.name!);
        tPleaseTheDistrictWordsIdList.add(element.id!);
      }

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

  Future<ResponseModel> tGetMunicipalities(int id) async {
    tMunicipalitiesData = [];
    tPleaseMunicipalityWords = [AppConstants.Please_be_a_municipality];
    tPleaseMunicipalityWordsIdList = [0];

    print('sdfhgsjdhgfjh $id');
    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getMunicipalities(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      tMunicipalitiesModel = MunicipalitiesModel.fromJson(map);

      //var cleanList =  municipalitiesModel!.data!.removeWhere((element) => element.districtName == element.districtName!.codeUnitAt(1));
      var seen = <String>{};
      List<MunicipalitiesData> uniquelist = tMunicipalitiesModel!.data!
          .where((student) => seen.add(student.districtName!))
          .toList();

      print('fsdfsdf  ${uniquelist.length}');

      tMunicipalitiesData?.addAll(uniquelist);
      tMunicipalitiesData?.forEach((element) {
        tPleaseMunicipalityWords.add(element.districtName!);
        tPleaseMunicipalityWordsIdList.add(element.id!);
      });

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

  Future<ResponseModel> getNotification() async {
    notificationData = [];

    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getNotification();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      notificationModel = NotificationModel.fromJson(map);

      //var cleanList =  municipalitiesModel!.data!.removeWhere((element) => element.districtName == element.districtName!.codeUnitAt(1));
      notificationData?.addAll(notificationModel!.data!);
      print('22  $notificationModel');
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

  var genderValueWord = AppConstants.select_gender;
  int genderValueWordId = 0;
  setGender(String gender, int id) {
    genderValueWord = gender;
    genderValueWordId = id;
    notifyListeners();
  }

  Future<ResponseModel> getGender() async {
    genderData = [];

    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getGender();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      notificationModel = NotificationModel.fromJson(map);
      genderModel = GenderModel.fromJson(map);
      genderData?.addAll(genderModel!.data!);
      genderData?.forEach((element) {
        genderWord?.add(element.gender!);
        genderDataInt?.add(element.id!);
      });

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

  Future<ResponseModel> getWard() async {
    wardData = [];
    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getWard();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      wardModel = WardModel.fromJson(map);
      wardData?.addAll(wardModel!.data!);
      print('hafgjha ${wardData?.length}');
      wardData?.forEach((element) {
        pleaseSeletcWardValueWords?.add(element.wardNo!);
        wardDataInt?.add(element.id!);
      });
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

  ViewAllJobCategoryModel? viewAllJobCategoryModel;
  List<ViewAllJobCategoryData>? viewAllJobCategoryDataList;
  List<dynamic>? allJobCategoryDataList;
  List<String>? viewAllJobCategoryDataListSting;
  List<int>? viewAllJobCategoryDataListId;

  Future<ResponseModel> getJobCategory() async {
    allJobCategoryDataList = [
      // {
      //   "display": AppConstants.Please_stay,
      //   "value": "${0}",
      // }
    ];
    viewAllJobCategoryDataList = [];
    viewAllJobCategoryDataListSting = [AppConstants.Please_stay];
    viewAllJobCategoryDataListId = [0];

    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getJobCategory();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      viewAllJobCategoryModel = ViewAllJobCategoryModel.fromJson(map);
      viewAllJobCategoryDataList?.addAll(viewAllJobCategoryModel!.data!);
      viewAllJobCategoryDataList?.forEach((element) {
        viewAllJobCategoryDataListSting?.add(element.name!);
        viewAllJobCategoryDataListId?.add(element.id!);
        allJobCategoryDataList?.add({
          "display": "${element.name}",
          "value": "${element.id}",
        });
      });

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

  DocumentTypeModel? documentTypeModel;
  List<DocumentTypeData>? documentTypeDataList;
  List<String>? documentTypeDataListS;
  List<int>? documentTypeDataListId;

  Future<ResponseModel> getDocumentType() async {
    documentTypeDataList = [];
    documentTypeDataListS = [AppConstants.Select_the_type_of_ID_card];
    documentTypeDataListId = [0];

    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getDocomentType();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      documentTypeModel = DocumentTypeModel.fromJson(map);
      documentTypeDataList?.addAll(documentTypeModel!.data!);
      documentTypeDataList?.forEach((element) {
        documentTypeDataListS?.add(element.name!);
        documentTypeDataListId?.add(element.id!);
      });

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

  CastModel? castModel;
  List<CastData>? castDataList;
  List<String>? castDataListString;
  List<int>? castDataListInt;

  Future<ResponseModel> getCast() async {
    castDataList = [];
    castDataListString = [AppConstants.SELECT_CAST];
    castDataListInt = [0];

    notifyListeners();
    ApiResponse apiResponse = await locationRepo.getCast();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      castModel = CastModel.fromJson(map);
      castDataList?.addAll(castModel!.data!);

      castDataList?.forEach((element) {
        castDataListString?.add(element.name!);
        castDataListInt?.add(element.id!);
      });

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
