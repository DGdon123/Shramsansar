import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../data/datasource/remote/base/api_response.dart';
import '../models/ResponsModels/DistrictsModel.dart';
import '../models/ResponsModels/MunicipalitiesModel.dart';
import '../models/ResponsModels/MyProfileModel.dart';
import '../models/ResponsModels/PradeshModel.dart';
import '../models/ResponsModels/SelectSkillModel.dart';
import '../models/ResponsModels/SkilsModel.dart';
import '../models/ResponsModels/SocialNameModel.dart';
import '../models/SendDataModels/profile/AboutMeModelSend.dart';
import '../models/SendDataModels/profile/AddEducationModel.dart';
import '../models/SendDataModels/profile/EducationLevelModel.dart';
import '../models/response_model.dart';
import '../repository/MyProfileRepo.dart';
import '../utils/AppConstants.dart';

class MyProfileProvider with ChangeNotifier {
  final MyProfileRepo myProfileRepo;
  MyProfileProvider(this.myProfileRepo);

  MyProfileModel? myProfileModel;
  List<Skills>? skills;
  List<dynamic>? selectSkillsModel;
  List<Educations>? educations;
  List<Experiences>? experiences;
  List<Trainings>? trainings;
  List<Languages>? languages;
  List<Locations>? locations;
  List<SocialAccounts>? socialAccounts;
  Specialization? specialization;
  AboutYourself? aboutYourself;

  ///SkilsModel
  SkilsModel? skilsModel;
  List<SkilsData>? skilsData = [];
  List<String>? skilsDataString = [];
  List<int>? skilsDataInt = [0];

  ///UTILS

  setSkillRemove(Skills skillsw) {
    // int? id = skills?.indexOf(skills!!);
    // print(id)
    skills?.remove(skillsw);
    notifyListeners();
  }

  Future<ResponseModel> getMyProfile() async {
    skills = [];
    educations = [];
    experiences = [];
    trainings = [];
    languages = [];
    locations = [];
    socialAccounts = [];
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.getMyProfile();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      myProfileModel = MyProfileModel.fromJson(map);

      educations?.addAll(myProfileModel!.data!.educations!);
      experiences?.addAll(myProfileModel!.data!.experiences!);
      trainings?.addAll(myProfileModel!.data!.trainings!);
      languages?.addAll(myProfileModel!.data!.languages!);
      locations?.addAll(myProfileModel!.data!.locations!);
      socialAccounts?.addAll(myProfileModel!.data!.socialAccounts!);

      if (myProfileModel?.data?.specialization != null) {
        specialization = myProfileModel?.data?.specialization;
      }
      if (myProfileModel?.data?.aboutYourself != null) {
        aboutYourself = myProfileModel!.data!.aboutYourself!;
      }
      var seen = Set<String>();
      List<Skills> uniquelist = myProfileModel!.data!.skills!
          .where((student) => seen.add(student.skillName!))
          .toList();
      skills?.addAll(uniquelist);

      print('my profile');
      responseModel = ResponseModel(true, 'successful', responseCode!);
    } else if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 500) {
      print('my eeee 1');
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    } else {
      print('my eeee 2');
      String errorMessage = 'Server Errors';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    }

    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> getSkills() async {
    skilsData = [];
    selectSkillsModel = [];

    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.getSkills();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      skilsModel = SkilsModel.fromJson(map);
      // skilsData?.addAll(skilsModel!.data!);
      var seen = Set<String>();
      List<SkilsData> uniquelist = skilsModel!.data!
          .where((student) => seen.add(student.name!))
          .toList();
      skilsData?.addAll(uniquelist);
      uniquelist.forEach((element) {
        selectSkillsModel?.add({
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

  Future<ResponseModel> postAboutMe(AboutMeModelSend aboutMeModelSend) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.postAboutMe(aboutMeModelSend);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  ///Add Education

  String passingDate = 'mm/dd/yyyy';
  var educationLevelValueWord = AppConstants.please_state_channuhos;
  String educationLevelHintValueword = AppConstants.please_state_channuhos;
  int educationLevelHintValuewordId = 0;

  setPassingDate(String passingDate) {
    this.passingDate = passingDate;
    notifyListeners();
  }

  setEducationLavelDrobTitle(String educationLevelValueWord,
      String educationLevelHintValueword, int educationLevelHintValuewordId) {
    this.educationLevelValueWord = educationLevelValueWord;
    this.educationLevelHintValueword = educationLevelHintValueword;
    this.educationLevelHintValuewordId = educationLevelHintValuewordId;
    notifyListeners();
  }

  EducationLevelModel? educationLevelModel;
  List<EducationLevelData>? educationLevelDataList;
  List<String>? educationLevelDataListS;
  List<int>? educationLevelDataListId;

  getEducationLevelName(int id) {
    educationLevelDataList?.forEach((element) {
      if (element.id! == id) {
        educationLevelValueWord = element.name!;
        educationLevelHintValueword = element.name!;
        educationLevelHintValuewordId = id;
      }
    });

    notifyListeners();
  }

  Future<ResponseModel> getEducationLevel() async {
    educationLevelDataList = [];
    educationLevelDataListS = [AppConstants.please_state_channuhos];
    educationLevelDataListId = [0];

    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.getEducationLevel();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      educationLevelModel = EducationLevelModel.fromJson(map);
      educationLevelDataList?.addAll(educationLevelModel!.data!);
      educationLevelDataList?.forEach((element) {
        educationLevelDataListS?.add(element.name!);
        educationLevelDataListId?.add(element.id!);
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

  Future<ResponseModel> postEducation(
      AddEducationModel addEducationModel) async {
    notifyListeners();
    ApiResponse apiResponse =
        await myProfileRepo.postEducation(addEducationModel);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> updateEducation(
      int id, AddEducationModel addEducationModel) async {
    notifyListeners();
    ApiResponse apiResponse =
        await myProfileRepo.updateEducation(id, addEducationModel);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> deleteEducation(int id) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.deleteEducation(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  ///experience
  String startDateExperience = 'yyyy/mm/dd';
  String endDateExperience = 'yyyy/mm/dd';
  String imageNameEx = '';
  String imagePathEx = '';
  bool currentlyWorking = false;

  setStartDateEx(String startDateExperience) {
    this.startDateExperience = startDateExperience;
    notifyListeners();
  }

  setEndDateEx(String endDateExperience) {
    this.endDateExperience = endDateExperience;
    notifyListeners();
  }

  setImageInfoEx(String imageNameEx, imagePathEx) {
    this.imageNameEx = imageNameEx;
    this.imagePathEx = imagePathEx;
    notifyListeners();
  }

  bool isClickOnImage = false;

  isClickOnImageP(bool isClickOnImage) {
    this.isClickOnImage = isClickOnImage;
    notifyListeners();
  }

  setCurrentWorkingEx(bool currentlyWorking) {
    this.currentlyWorking = currentlyWorking;
    notifyListeners();
  }

  Future<ResponseModel> postExperice(FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.postExperience(formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> updateExperience(FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.updateExperience(formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> deleteExperience(int id) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.deleteExperience(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  ///Training
  String startDateTraining = 'yyyy/mm/dd';

  setStartDateTraining(String startDateTraining) {
    this.startDateTraining = startDateTraining;
    notifyListeners();
  }

  String imageNameTraining = '';
  String imagePathTraining = '';

  setImageInfoTraining(String imageNameTraining, imagePathTraining) {
    this.imageNameTraining = imageNameTraining;
    this.imagePathTraining = imagePathTraining;
    notifyListeners();
  }

  Future<ResponseModel> postTraning(FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.postTraning(formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> updateTraning(int id, FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.updateTraning(id, formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> deleteTraning(int id) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.deleteTraning(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  ///Skilss

  Future<ResponseModel> postSkills(FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.postSkills(formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      responseModel = ResponseModel(true, 'successful', responseCode!);
    } else if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 500) {
      String errorMessage = 'Server Error';
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    } else {
  Map map = apiResponse.response?.data;
      String errorMessage = map["errors"]["skill_id"][0];
      responseModel = ResponseModel(false, errorMessage, responseCode!);
    }

    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> deleteSkills(int id) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.deleteSkills(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  ///Language
  String readingValueWord = AppConstants.Select_Rating;
  String readingHintValueword = AppConstants.Select_Rating;

  String listeningValueWord = AppConstants.Select_Rating;
  String listeningHintValueword = AppConstants.Select_Rating;

  String writingValueWord = AppConstants.Select_Rating;
  String writingHintValueword = AppConstants.Select_Rating;

  String speackingValueWord = AppConstants.Select_Rating;
  String speackingHintValueword = AppConstants.Select_Rating;

  List<String> readingword = [
    AppConstants.Select_Rating,
    "1",
    "2",
    "3",
    "4",
    "5"
  ];

  setReading(String readingValueWord, String readingHintValueword) {
    this.readingValueWord = readingValueWord;
    this.readingHintValueword = readingHintValueword;
    notifyListeners();
  }

  setListening(String listeningValueWord, String writingHintValueword) {
    this.listeningValueWord = listeningValueWord;
    this.writingHintValueword = writingHintValueword;
    notifyListeners();
  }

  setWriting(String writingValueWord, String listeningHintValueword) {
    this.writingValueWord = writingValueWord;
    this.listeningHintValueword = listeningHintValueword;
    notifyListeners();
  }

  setSpeacking(String speackingValueWord, String speackingHintValueword) {
    this.speackingValueWord = speackingValueWord;
    this.speackingHintValueword = speackingHintValueword;
    notifyListeners();
  }

  resetLan() {
    readingValueWord = AppConstants.Select_Rating;
    readingHintValueword = AppConstants.Select_Rating;
    listeningValueWord = AppConstants.Select_Rating;
    listeningHintValueword = AppConstants.Select_Rating;
    writingValueWord = AppConstants.Select_Rating;
    writingHintValueword = AppConstants.Select_Rating;
    speackingValueWord = AppConstants.Select_Rating;
    speackingHintValueword = AppConstants.Select_Rating;
    notifyListeners();
  }

  setAllLan(
      String readingValueWord,
      String readingHintValueword,
      String listeningValueWord,
      String listeningHintValueword,
      String writingValueWord,
      String writingHintValueword,
      String speackingValueWord,
      String speackingHintValueword) {
    this.readingValueWord = readingValueWord;
    this.readingHintValueword = readingHintValueword;
    this.listeningValueWord = listeningValueWord;
    this.listeningHintValueword = listeningHintValueword;
    this.writingValueWord = writingValueWord;
    this.writingHintValueword = writingHintValueword;
    this.speackingValueWord = speackingValueWord;
    this.speackingHintValueword = speackingHintValueword;
    notifyListeners();
  }

  Future<ResponseModel> postLanguage(FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.postLanguage(formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> updateLanguage(int id, FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.updateLanguage(id, formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> deleteLanguage(int id) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.deleteLanguage(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  ///Add Employment Location

  ///PradeshModel
  PradeshModel? pradeshModel;
  List<PradeshData>? pradeshDataList;
  List<String> pradashWords = [AppConstants.Province2];
  List<int> pradashWordsIdList = [0];

  String pradeshName = AppConstants.Province2;
  int pradeshId = 0;
  setPradesh(String pradeshName, int pradeshId) {
    this.pradeshName = pradeshName;
    this.pradeshId = pradeshId;
    notifyListeners();
  }

  DistrictsModel? districtsModel;
  List<DistrictsData>? pleaseTheDistrictWordsFullData;
  List<String> pleaseTheDistrictWords = [
    AppConstants.Please_enter_the_district
  ];
  List<int> pleaseTheDistrictWordsIdList = [0];

  String districtsName = AppConstants.Please_enter_the_district;
  int districtsId = 0;

  setDistricts(String districtsName, int districtsId) {
    this.districtsName = districtsName;
    this.districtsId = districtsId;
    notifyListeners();
  }

  MunicipalitiesModel? municipalitiesModelAll;
  List<MunicipalitiesData>? municipalitiesDataAll;
  List<String> pleaseMunicipalityWordsAll = [AppConstants.Village_Municipality];
  List<int> pleaseMunicipalityWordsIdListAll = [0];

  String municipalitiesName = AppConstants.Village_Municipality;
  int municipalitiesId = 0;

  setMunicipalities(String municipalitiesName, int municipalitiesId) {
    this.municipalitiesName = municipalitiesName;
    this.municipalitiesId = municipalitiesId;
    notifyListeners();
  }

  Future<ResponseModel> getPradesh() async {
    pradeshDataList = [];
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.getPradesh();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      pradeshModel = PradeshModel.fromJson(map);
      pradeshDataList?.addAll(pradeshModel!.data!);
      pradeshDataList?.forEach((element) {
        pradashWords.add(element.name!);
        pradashWordsIdList.add(element.id!);
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

  Future<ResponseModel> getDistricts() async {
    pleaseTheDistrictWordsFullData = [];
    pleaseTheDistrictWords = [AppConstants.Please_enter_the_district];
    pleaseTheDistrictWordsIdList = [0];
    notifyListeners();

    ApiResponse apiResponse = await myProfileRepo.getDistricts();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      districtsModel = DistrictsModel.fromJson(map);

      var seen = Set<String>();
      List<DistrictsData> uniquelist = districtsModel!.data!
          .where((student) => seen.add(student.name!))
          .toList();
      pleaseTheDistrictWordsFullData?.addAll(uniquelist);

      pleaseTheDistrictWordsFullData?.forEach((element) {
        pleaseTheDistrictWords.add(element.name!);
        pleaseTheDistrictWordsIdList.add(element.id!);
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

  Future<ResponseModel> getMunicipalities() async {
    municipalitiesDataAll = [];
    pleaseMunicipalityWordsAll = [];
    pleaseMunicipalityWordsIdListAll = [];

    pleaseMunicipalityWordsAll = [AppConstants.Village_Municipality];
    pleaseMunicipalityWordsIdListAll = [0];
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.getMunicipalitiesAll();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      municipalitiesModelAll = MunicipalitiesModel.fromJson(map);

      //var cleanList =  municipalitiesModel!.data!.removeWhere((element) => element.districtName == element.districtName!.codeUnitAt(1));
      var seen = Set<String>();
      List<MunicipalitiesData> uniquelist = municipalitiesModelAll!.data!
          .where((student) => seen.add(student.districtName!))
          .toList();
      municipalitiesDataAll?.addAll(uniquelist);
      uniquelist.forEach((element) {
        pleaseMunicipalityWordsAll.add(element.districtName!);
        pleaseMunicipalityWordsIdListAll.add(element.id!);
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

  Future<ResponseModel> postPreferenceLocation(FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse =
        await myProfileRepo.postPreferenceLocation(formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  setAllUpdateLocation(
    String pradeshName,
    int pradeshId,
    String districtsName,
    int districtsId,
    String municipalitiesName,
    int municipalitiesId,
  ) {
    this.pradeshName = pradeshName;
    this.pradeshId = pradeshId;
    this.districtsName = districtsName;
    this.districtsId = districtsId;
    this.municipalitiesName = municipalitiesName;
    this.municipalitiesId = municipalitiesId;
    notifyListeners();
  }

  Future<ResponseModel> updatePreferenceLocation(
      int id, FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse =
        await myProfileRepo.updatePreferenceLocation(id, formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  Future<ResponseModel> deleteLocation(int id) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.deleteLocation(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  ///Special
  Future<ResponseModel> postSpecialAdd(FormData formData) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.postSpecialAdd(formData);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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

  SocialNameModel? socialNameModel;
  List<SocialNameData>? socialNameDataLst;
  Future<ResponseModel> getSocial() async {
    socialNameDataLst = [];

    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.getSocial();
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
      socialNameModel = SocialNameModel.fromJson(map);
      socialNameDataLst?.addAll(socialNameModel!.data!);

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

  Future<ResponseModel> deleteSocial(String id) async {
    notifyListeners();
    ApiResponse apiResponse = await myProfileRepo.deleteSocial(id);
    ResponseModel responseModel;
    int? responseCode = apiResponse.response?.statusCode;

    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      Map map = apiResponse.response?.data;
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
