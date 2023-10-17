// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:lmiis/provider/MyProfileProvider.dart';
// import 'package:multiselect_formfield/multiselect_formfield.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../models/ResponsModels/MyProfileModel.dart';
// import '../../provider/LocationProvider.dart';
// import '../../utils/Apis.dart';
// import '../../utils/AppConstants.dart';
// import '../../utils/app_images.dart';
// import '../../utils/colors_resource.dart';
// import '../../utils/dimensions.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/custtom_button.dart';
// import '../widgets/showCustomSnackBar.dart';
// import 'EditMyProfileScreen.dart';

// class EditFullProfile extends StatefulWidget {
//   MyProfileModel myProfileModel;
//   EditFullProfile(this.myProfileModel);

//   @override
//   State<EditFullProfile> createState() => _EditFullProfileState();
// }

// class _EditFullProfileState extends State<EditFullProfile> {
//   TextEditingController nameTextEditingController = TextEditingController();
//   TextEditingController mobileNumberTextEditingController =
//       TextEditingController();
//   TextEditingController citizenshipNoTextEditingController =
//       TextEditingController();
//   TextEditingController expectedSummonsTextEditingController =
//       TextEditingController();
//   TextEditingController otherjobTextEditingController = TextEditingController();
//   FocusNode nameFocusNode = FocusNode();
//   FocusNode mobileNumberFocusNode = FocusNode();
//   FocusNode citizenshipNoFocusNode = FocusNode();
//   FocusNode dateOfBirthFocusNode = FocusNode();
//   FocusNode expectedSummonsFocusNode = FocusNode();
//   FocusNode otherJobFocusNode = FocusNode();

//   bool isVisibleTopHint = true;

//   var jobCategoryValueWord = AppConstants.Please_stay;
//   String jobCategoryHintValueWord = AppConstants.Please_stay;
//   int jobCategoryValueWordId = 0;

//   var castValueWord = AppConstants.SELECT_CAST;
//   String castHintValueword = AppConstants.SELECT_CAST;
//   int castValueWordId = 0;

//   var minorGroupValueWord = AppConstants.SELECT_YES_NO;
//   String minorGroupHintValueword = AppConstants.SELECT_YES_NO;
//   List<String> minorGroupklassenword = [
//     AppConstants.SELECT_YES_NO,
//     AppConstants.SELECT_YES,
//     AppConstants.SELECT_NO,
//   ];
//   int minorGroupValueWordId = 0;

//   var migrantWorkersValueWord = AppConstants.SELECT_YES_NO;
//   String migrantWorkersHintValueword = AppConstants.SELECT_YES_NO;
//   List<String> migrantWorkersklassenword = [
//     AppConstants.SELECT_YES_NO,
//     AppConstants.SELECT_YES,
//     AppConstants.SELECT_NO,
//   ];
//   int migrantWorkersValueWordId = 0;

//   var disabledValueWord = AppConstants.SELECT_YES_NO;
//   String disabledHintValueword = AppConstants.SELECT_YES_NO;
//   List<String> disabledklassenword = [
//     AppConstants.SELECT_YES_NO,
//     AppConstants.SELECT_YES,
//     AppConstants.SELECT_NO,
//   ];
//   int disabledValueWordId = 0;

//   //Permanent
//   String? pleasePradashValueWord = AppConstants.please_state_channuhos;
//   String? pleasePradashHintValueWord = AppConstants.please_state_channuhos;
//   int? pradashWordsId = 0;

//   String? pleaseTheDistrictValueWord = AppConstants.Please_enter_the_district;
//   String? pleaseTheDistrictHintValueWord =
//       AppConstants.Please_enter_the_district;
//   int? pleaseTheDistrictWordsId = 0;

//   var pleaseMunicipalityValueWord = AppConstants.Please_be_a_municipality;
//   String? pleaseMunicipalityHintValueWord =
//       AppConstants.Please_be_a_municipality;
//   int? pleaseMunicipalityWordsId = 0;

//   var pleaseSeletcWardValueWord = AppConstants.Please_be_a_ward;
//   String? pleaseSeletcWardHintValueWord = AppConstants.Please_be_a_ward;
//   int? pleaseSeletcWardValueWordsId = 0;

//   //Temporal
//   bool valuefirst = false;

//   String? tPleasePradashValueWord = AppConstants.please_state_channuhos;
//   String? tPleasePradashHintValueWord = AppConstants.please_state_channuhos;
//   int? tPradashWordsId = 0;

//   String? tPleaseTheDistrictValueWord = AppConstants.Please_enter_the_district;
//   String? tPleaseTheDistrictHintValueWord =
//       AppConstants.Please_enter_the_district;
//   int? tPleaseTheDistrictWordsId = 0;

//   String? tPleaseMunicipalityValueWord = AppConstants.Please_be_a_municipality;
//   String? tPleaseMunicipalityHintValueWord =
//       AppConstants.Please_be_a_municipality;
//   int? tPleaseMunicipalityWordsId = 0;

//   String? tPleaseSeletcWardValueWord = AppConstants.Please_be_a_ward;
//   String? tpleaseSeletcWardHintValueWord = AppConstants.Please_be_a_ward;
//   int? tPleaseSeletcWardValueWordsId = 0;

//   bool isLoading = true;
//   String imageName = '';
//   String imageName2 = 'No file Choose ';
//   String? imagePath;
//   String dobDateTime = 'YYY/MM/DD';

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       var myProfile = Provider.of<MyProfileProvider>(context, listen: false);
//       var locationProvider =
//           Provider.of<LocationProvider>(context, listen: false);

//       MyProfileModel? myProfileModel = myProfile.myProfileModel!;
//       MyProfileData? myProfileData = myProfile.myProfileModel!.data;

//       nameTextEditingController.text = myProfileModel.data!.name!;
//       mobileNumberTextEditingController.text = myProfileModel.data!.mobile!;
//       if (myProfileModel.data?.citizenshipNo != null) {
//         citizenshipNoTextEditingController.text =
//             myProfileModel.data!.citizenshipNo!;
//       }
//       if (myProfileModel.data?.dob != null) {
//         dobDateTime = myProfileModel.data!.dob!;
//       }
//       if (myProfileModel.data?.expectedSalary != null) {
//         expectedSummonsTextEditingController.text =
//             myProfileModel.data!.expectedSalary!;
//       }
//       if (myProfileModel.data?.otherSkills != null) {
//         otherjobTextEditingController.text = myProfileModel.data!.otherSkills!;
//       }

//       if (myProfileData?.file != null) {
//         String? fileName = myProfileData?.file!.split('/').last;
//         imageName2 = fileName!;
//       }

//       if (myProfileModel.data!.gender! == 'पुरुष') {
//         locationProvider.setGender(myProfileModel.data!.gender!, 1);
//       } else if (myProfileModel.data!.gender! == 'महिला') {
//         locationProvider.setGender(myProfileModel.data!.gender!, 2);
//       } else if (myProfileModel.data!.gender! == 'अन्य') {
//         locationProvider.setGender(myProfileModel.data!.gender!, 3);
//       }

//       if (myProfileData?.jobseekerPreferenceCategory != null) {
//         if (myProfileData!.jobseekerPreferenceCategory!.length > 0) {
//           String? categoryName = myProfileData
//               .jobseekerPreferenceCategory?[
//                   myProfileData.jobseekerPreferenceCategory!.length - 1]
//               .categoryName;
//           int? id = int.parse(myProfileData
//               .jobseekerPreferenceCategory![
//                   myProfileData.jobseekerPreferenceCategory!.length - 1]
//               .categoryId!);
//           jobCategoryValueWord = categoryName!;
//           jobCategoryHintValueWord = categoryName;
//           jobCategoryValueWordId = id;
//           print('fsfsdf  $id');
//         }
//         setState(() {
//           _myActivitiesString?.clear();
//           _myActivitiesString?.addAll(myProfileData.jobseekerPreferenceCategory!
//               .map((e) => e.categoryName));

//         });
//       }

//       if (myProfileModel.data!.differentlyAble != null) {
//         if (myProfileModel.data!.differentlyAble == 1) {
//           disabledValueWord = AppConstants.SELECT_YES;
//           disabledHintValueword = AppConstants.SELECT_YES;
//           disabledValueWordId = 1;
//         } else if (myProfileModel.data!.differentlyAble == 0) {
//           disabledValueWord = AppConstants.SELECT_NO;
//           disabledHintValueword = AppConstants.SELECT_NO;
//           disabledValueWordId = 0;
//         }
//       }

//       locationProvider.getCast().then((value) {
//         if (myProfileModel.data!.ethnicityType != null) {
//           int? id = int.parse(myProfileModel.data!.ethnicityType!);
//           castValueWordId = id;
//           String castName = locationProvider.castDataListString![
//               locationProvider.castDataListInt!.indexOf(castValueWordId)];
//           castValueWord = castName;
//           castHintValueword = castName;
//         }
//       });
//       if (myProfileModel.data!.migrantWorker != null) {
//         if (myProfileModel.data!.migrantWorker == 1) {
//           migrantWorkersValueWord = AppConstants.SELECT_YES;
//           migrantWorkersHintValueword = AppConstants.SELECT_YES;
//           migrantWorkersValueWordId = 1;
//         } else if (myProfileModel.data!.migrantWorker == 0) {
//           migrantWorkersValueWord = AppConstants.SELECT_NO;
//           migrantWorkersHintValueword = AppConstants.SELECT_NO;
//           migrantWorkersValueWordId = 0;
//         }
//       }

//       if (myProfileModel.data!.minorityGroup != null) {
//         if (myProfileModel.data!.minorityGroup == 1) {
//           minorGroupValueWord = AppConstants.SELECT_YES;
//           minorGroupHintValueword = AppConstants.SELECT_YES;
//           minorGroupValueWordId = 1;
//         } else if (myProfileModel.data!.minorityGroup == 0) {
//           minorGroupValueWord = AppConstants.SELECT_NO;
//           minorGroupHintValueword = AppConstants.SELECT_NO;
//           minorGroupValueWordId = 0;
//         }
//       }

//       locationProvider.getPradesh().then((value) {
//         pleasePradashValueWord = myProfileData?.perPradeshName!;
//         pleasePradashHintValueWord = myProfileData?.perPradeshName!;
//         pradashWordsId = myProfileData!.perPradeshId!;
//         locationProvider.getDistricts(pradashWordsId!).then((value) {
//           pleaseTheDistrictValueWord = myProfileData.perDistrictName!;
//           pleaseTheDistrictHintValueWord = myProfileData.perDistrictName!;
//           pleaseTheDistrictWordsId = myProfileData.perDistrictId!;

//           locationProvider
//               .getMunicipalities(pleaseTheDistrictWordsId!)
//               .then((value) {
//             pleaseMunicipalityValueWord = myProfileData.perMuniName!;
//             pleaseMunicipalityHintValueWord = myProfileData.perMuniName!;
//             pleaseMunicipalityWordsId = myProfileData.perMuniId!;

//             pleaseSeletcWardValueWord = myProfileData.perWard!;
//             pleaseSeletcWardHintValueWord = myProfileData.perWard!;
//             pleaseSeletcWardValueWordsId = int.parse(myProfileData.ward!);
//           });
//         });

//         locationProvider.tGetPradesh().then((value) {
//           tPleasePradashValueWord = myProfileData.tempPradeshName!;
//           tPleasePradashHintValueWord = myProfileData.tempPradeshName!;
//           tPradashWordsId = myProfileData.pradeshId!;
//           locationProvider.tGetDistricts(tPradashWordsId!).then((value) {
//             tPleaseTheDistrictValueWord = myProfileData.tempDistrictName!;
//             tPleaseTheDistrictHintValueWord = myProfileData.tempDistrictName!;
//             tPleaseTheDistrictWordsId = myProfileData.districtId!;
//             locationProvider
//                 .tGetMunicipalities(tPleaseTheDistrictWordsId!)
//                 .then((value) {
//               tPleaseMunicipalityValueWord = myProfileData.tempMuniName!;
//               tPleaseMunicipalityHintValueWord = myProfileData.tempMuniName!;
//               tPleaseMunicipalityWordsId = myProfileData.muniId;

//               tPleaseSeletcWardValueWord = myProfileData.ward;
//               tpleaseSeletcWardHintValueWord = myProfileData.ward;
//               tPleaseSeletcWardValueWordsId = int.parse(myProfileData.ward!);
//             });
//           });
//         });
//       });

//       // // tPleasePradashValueWord = pleasePradashValueWord;
//       // // tPleasePradashHintValueWord = pleasePradashHintValueWord;
//       // // tPradashWordsId = pradashWordsId;
//       //
//       // pleaseTheDistrictValueWord = myProfileData.perDistrictName!;
//       // pleaseTheDistrictHintValueWord = myProfileData.perDistrictName!;
//       // pleaseTheDistrictWordsId = myProfileData.perDistrictId!;
//       //
//       //
//       // // tPleaseTheDistrictValueWord = pleaseTheDistrictValueWord;
//       // // tPleaseTheDistrictHintValueWord = pleaseTheDistrictHintValueWord;
//       // // tPleaseTheDistrictWordsId = pleaseTheDistrictWordsId;
//       //
//       // pleaseMunicipalityValueWord = myProfileData.perMuniName!;
//       // pleaseMunicipalityHintValueWord = myProfileData.perMuniName!;
//       // pleaseMunicipalityWordsId = myProfileData.perMuniId!;
//       //
//       // // tPleaseMunicipalityValueWord = pleaseMunicipalityValueWord;
//       // // tPleaseMunicipalityHintValueWord = pleaseMunicipalityHintValueWord;
//       // // tPleaseMunicipalityWordsId = pleaseMunicipalityWordsId;
//       //
//       // pleaseSeletcWardValueWord = myProfileData.perWard!;
//       // pleaseSeletcWardHintValueWord = myProfileData.perWard!;
//       // pleaseSeletcWardValueWordsId = int.parse(myProfileData.ward!);
//       //
//       // tPleaseSeletcWardValueWord = pleaseSeletcWardValueWord;
//       // tpleaseSeletcWardHintValueWord = pleaseSeletcWardHintValueWord;
//       // tPleaseSeletcWardValueWordsId =pleaseSeletcWardValueWordsId;
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       body: Consumer2<MyProfileProvider, LocationProvider>(
//         builder: (context, myProfileProvider, locationProvider, child) => Stack(
//           children: [
//             Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: ColorsResource.PRAYMERY_COLOR,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.050,
//                     margin: EdgeInsets.only(top: 40, left: 10, right: 10),
//                     child: Column(
//                       children: [
//                         //Toolbar
//                         Row(
//                           children: [
//                             InkWell(
//                                 onHover: (_) {},
//                                 onTap: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child:
//                                     SvgPicture.asset(AppImages.ic_back_blue)),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width - 65,
//                               child: Text(
//                                 AppConstants.Edit_profile,
//                                 style: TextStyle(
//                                     fontSize: Dimensions.BODY_20,
//                                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                                     color: ColorsResource.PRAYMARY_TEXT_COLOR),
//                                 textAlign: TextAlign.center,
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )),
//             Positioned(
//                 top: 100,
//                 left: 0,
//                 right: 0,
//                 bottom: 2,
//                 child: SingleChildScrollView(
//                   child: Container(
//                     margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         CustomTextFieldWithTitle(AppConstants.NAME,
//                             nameTextEditingController, nameFocusNode,
//                             isBold: false, isShowRequrStar: true),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 0, left: 0, bottom: 5),
//                           width: MediaQuery.of(context).size.width,
//                           child: Row(
//                             children: [
//                               Text(
//                                 AppConstants.select_gender,
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                     fontSize: Dimensions.BODY_14,
//                                     color: ColorsResource.TEXT_BLACK_COLOR,
//                                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                               ),
//                               Text(
//                                 ' *',
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                     fontSize: Dimensions.BODY_14,
//                                     color: ColorsResource.TEXT_READ_COLOR,
//                                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                               ),
//                             ],
//                           ),
//                         ),
//                         genderDropdown(),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         CustomTextFieldWithTitle(
//                             AppConstants.mobile_number,
//                             mobileNumberTextEditingController,
//                             mobileNumberFocusNode,
//                             isBold: false,
//                             isShowRequrStar: true),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         CustomTextFieldWithTitle(
//                           AppConstants.Citizenship_no,
//                           citizenshipNoTextEditingController,
//                           citizenshipNoFocusNode,
//                           isBold: false,
//                           isShowRequrStar: true,
//                           inputType: AppConstants.PHONE,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               '${AppConstants.date_of_birth}',
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_14,
//                                   color: ColorsResource.TEXT_BLACK_COLOR,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             ),
//                             Text(
//                               ' *',
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_14,
//                                   color: ColorsResource.TEXT_READ_COLOR,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             ),
//                           ],
//                         ),

//                         InkWell(
//                           onTap: () async {
//                             // var results = await showCalendarDatePicker2Dialog(
//                             //   context: context,
//                             //   config: CalendarDatePicker2WithActionButtonsConfig(),
//                             //   dialogSize: const Size(325, 400),
//                             // );
//                             // if(results != null){
//                             //   print(results[0]);
//                             //   print(results[0]);
//                             //   setState(() {
//                             //     if(results[0] != ''){
//                             //       String date = '${results[0]}';
//                             //       int idx = date.indexOf(" ");
//                             //       List parts = [date.substring(0,idx).trim(), date.substring(idx+1).trim()];
//                             //       print(parts[0]);
//                             //       dobDateTime = '${parts[0]}';
//                             //     }
//                             //
//                             //   });
//                             // }
//                             //

//                             _selectDate(context).then((results) {
//                               if (results != null) {
//                                 final values = results.split(' ');
//                                 dobDateTime = '${values[0]}';
//                               }
//                             });

//                             // showDatePickerF(
//                             //   context: context,
//                             //   initialDate: DateTime.fromMillisecondsSinceEpoch(),
//                             //   firstDate: DateTime(2021),
//                             //   lastDate: DateTime(2022),);
//                           },
//                           child: Container(
//                             height: 44,
//                             width: MediaQuery.of(context).size.width / 1.1,
//                             decoration: myBoxDecoration(),
//                             child: Container(
//                               margin: EdgeInsets.only(top: 15, left: 10),
//                               child: Text(
//                                 '$dobDateTime',
//                               ),
//                             ),
//                           ),
//                         ),

//                         const SizedBox(
//                           height: 5,
//                         ),
//                         CustomTextFieldWithTitle(
//                           AppConstants.expected_summons,
//                           expectedSummonsTextEditingController,
//                           expectedSummonsFocusNode,
//                           isBold: false,
//                           inputType: AppConstants.PHONE,
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),

//                         Text(
//                           AppConstants.Profile_photo,
//                           style: TextStyle(
//                               fontSize: Dimensions.BODY_14,
//                               color: ColorsResource.TEXT_BLACK_COLOR,
//                               fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                         ),
//                         Container(
//                           decoration: myBoxDecoration(),
//                           width: MediaQuery.of(context).size.width,
//                           height: 50,
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: InkWell(
//                                   onTap: () async {
//                                     final ImagePicker _picker = ImagePicker();
//                                     final XFile? photo = await _picker
//                                         .pickImage(source: ImageSource.gallery);
//                                     setState(() {
//                                       imageName = photo!.name;
//                                       imagePath = photo.path;
//                                     });
//                                   },
//                                   child: Container(
//                                     margin:
//                                         EdgeInsets.only(left: 10, right: 10),
//                                     padding: EdgeInsets.all(5),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(3),
//                                       color: ColorsResource.TEXT_GRAY_COLOR,
//                                       border: Border.all(
//                                         color: ColorsResource.TEXT_GRAY_COLOR,
//                                         width: 1,
//                                       ),
//                                     ),
//                                     child: Text(
//                                       ' Choose File',
//                                       style: TextStyle(
//                                           color: ColorsResource.WHAIT),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Text(
//                                     imageName == '' ? imageName2 : imageName),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),

//                         Row(
//                           children: [
//                             Text(
//                               '${AppConstants.Choose_your_area_of_expertise}',
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_14,
//                                   color: ColorsResource.TEXT_BLACK_COLOR,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             ),
//                           ],
//                         ),
//                         // jobCategoryDropdown(),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             multipleJobCategoryAdd();
//                           },
//                           child: Container(
//                               decoration: myBoxDecoration(),
//                               margin: EdgeInsets.only(left: 5, right: 10),
//                               padding: EdgeInsets.only(left: 10),
//                               width: MediaQuery.of(context).size.width,
//                               height: 50,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width - 105,
//                                     child: RichText(
//                                       text: TextSpan(
//                                         text: _myActivitiesString!.length <= 0
//                                             ? 'कृपया छन्नुहोस्'
//                                             : '',
//                                         style: TextStyle(
//                                             fontSize: Dimensions.BODY_14,
//                                             color:
//                                                 ColorsResource.TEXT_BLACK_COLOR,
//                                             fontWeight:
//                                                 Dimensions.FONT_MEDIUM_NORMUL),
//                                         children: _myActivitiesString!.map((e) {
//                                           return TextSpan(text: '${e}, ');
//                                         }).toList(),
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(Icons.arrow_drop_down),
//                                   SizedBox(
//                                     width: 10,
//                                   )
//                                 ],
//                               )),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         LoginTextFormFiled(
//                           AppConstants.enterOtherJobField,
//                           otherjobTextEditingController,
//                           otherJobFocusNode,
//                           isShowRequrStar: false,
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               AppConstants.permanent_Address,
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_14,
//                                   color: ColorsResource.TEXT_BLACK_COLOR,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             ),
//                             Text(
//                               ' *',
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_16,
//                                   color: ColorsResource.TEXT_READ_COLOR,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         pleaseStatePradashDropdown(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         pleaseEnterTheDistrictDropdown(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         pleaseDeaMunicipalityDropdown(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         pleaseSeletcWardDropdown(),

//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               AppConstants.temporary_address,
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_14,
//                                   color: ColorsResource.TEXT_BLACK_COLOR,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             ),
//                             Text(
//                               " *",
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_14,
//                                   color: Colors.redAccent,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             ),
//                             Expanded(child: Container()),
//                             Text(
//                               AppConstants.Permanent_Jas,
//                               style: TextStyle(
//                                   fontSize: Dimensions.BODY_14,
//                                   color: ColorsResource.TEXT_BLACK_COLOR,
//                                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                             ),
//                             Checkbox(
//                               value: valuefirst,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   valuefirst = value!;
//                                   if (valuefirst) {
//                                     tPleasePradashValueWord =
//                                         pleasePradashValueWord;
//                                     tPleasePradashHintValueWord =
//                                         pleasePradashHintValueWord;
//                                     tPradashWordsId = pradashWordsId;

//                                     tPleaseTheDistrictValueWord =
//                                         pleaseTheDistrictValueWord;
//                                     tPleaseTheDistrictHintValueWord =
//                                         pleaseTheDistrictHintValueWord;
//                                     tPleaseTheDistrictWordsId =
//                                         pleaseTheDistrictWordsId;

//                                     tPleaseMunicipalityValueWord =
//                                         pleaseMunicipalityValueWord;
//                                     tPleaseMunicipalityHintValueWord =
//                                         pleaseMunicipalityHintValueWord;
//                                     tPleaseMunicipalityWordsId =
//                                         pleaseMunicipalityWordsId;

//                                     tPleaseSeletcWardValueWord =
//                                         pleaseSeletcWardValueWord;
//                                     tpleaseSeletcWardHintValueWord =
//                                         pleaseSeletcWardHintValueWord;
//                                     tPleaseSeletcWardValueWordsId =
//                                         pleaseSeletcWardValueWordsId;
//                                   } else {
//                                     print("kfjskhfjds 2");
//                                     tPleasePradashValueWord =
//                                         AppConstants.please_state_channuhos;
//                                     tPleasePradashHintValueWord =
//                                         AppConstants.please_state_channuhos;
//                                     tPradashWordsId = 0;

//                                     tPleaseTheDistrictValueWord =
//                                         AppConstants.Please_enter_the_district;
//                                     tPleaseTheDistrictHintValueWord =
//                                         AppConstants.Please_enter_the_district;
//                                     tPleaseTheDistrictWordsId = 0;

//                                     tPleaseMunicipalityValueWord =
//                                         AppConstants.Please_be_a_municipality;
//                                     tPleaseMunicipalityHintValueWord =
//                                         AppConstants.Please_be_a_municipality;
//                                     tPleaseMunicipalityWordsId = 0;

//                                     tPleaseSeletcWardValueWord =
//                                         AppConstants.Please_be_a_ward;
//                                     tpleaseSeletcWardHintValueWord =
//                                         AppConstants.Please_be_a_ward;
//                                     tPleaseSeletcWardValueWordsId = 0;
//                                   }
//                                 });
//                               },
//                             )
//                           ],
//                         ),
//                         tPleasePradashDropdown(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         tPleaseEnterTheDistrictDropdown(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         tPleaseDeaMunicipalityDropdown(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         tPleaseSeletcWardDropdown(),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           '${AppConstants.pmep} ${AppConstants.under}',
//                           style: TextStyle(
//                               fontSize: Dimensions.BODY_14,
//                               color: ColorsResource.TEXT_BLACK_COLOR,
//                               fontWeight: Dimensions.FONT_MEDIUM),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 00),
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.only(top: 20, bottom: 20),
//                                 height: 15,
//                                 width: 20,
//                                 child: Checkbox(
//                                   value: isVisibleTopHint,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       isVisibleTopHint = value!;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 AppConstants.pmep,
//                                 style: TextStyle(
//                                     fontSize: Dimensions.BODY_14,
//                                     color: ColorsResource.TEXT_BLACK_COLOR,
//                                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
//                               ),
//                             ],
//                           ),
//                         ),

//                         Visibility(
//                           visible: isVisibleTopHint,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     '${AppConstants.Ethnicity}',
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_BLACK_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   ),
//                                   Text(
//                                     " *",
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_READ_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   )
//                                 ],
//                               ),
//                               ethnicityDropdown(),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '${AppConstants.minor_group}',
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_BLACK_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   ),
//                                   Text(
//                                     " *",
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_READ_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   )
//                                 ],
//                               ),
//                               minorGroupDropdown2(),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '${AppConstants.Migrant_workers}',
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_BLACK_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   ),
//                                   Text(
//                                     " *",
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_READ_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   )
//                                 ],
//                               ),
//                               migrantWorkersDropdown(),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '${AppConstants.disabled}',
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_BLACK_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   ),
//                                   Text(
//                                     " *",
//                                     style: TextStyle(
//                                         fontSize: Dimensions.BODY_14,
//                                         color: ColorsResource.TEXT_READ_COLOR,
//                                         fontWeight:
//                                             Dimensions.FONT_MEDIUM_NORMUL),
//                                   )
//                                 ],
//                               ),
//                               disabledDropdown(),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CustomButton(AppConstants.Update1, () async {
//                                 MyProfileModel? myProfileModel =
//                                     widget.myProfileModel;
//                                 MyProfileData? dataww = myProfileModel.data;

//                                 String name = nameTextEditingController.text;
//                                 String mobile =
//                                     mobileNumberTextEditingController.text;
//                                 String citizenshipNo =
//                                     citizenshipNoTextEditingController.text;
//                                 String expectedSummons =
//                                     expectedSummonsTextEditingController.text;
//                                 String otherskillValue =
//                                     otherjobTextEditingController.text;
//                                 int gender = locationProvider.genderValueWordId;

//                                 int? perPradeshId = pradashWordsId;
//                                 int? perDistrictId = pleaseTheDistrictWordsId;
//                                 int? perMuniId = pleaseMunicipalityWordsId;
//                                 int? perWard = pleaseSeletcWardValueWordsId;

//                                 ///Tem
//                                 int? temPradeshId = tPradashWordsId;
//                                 int? temDistrictId = tPleaseTheDistrictWordsId;
//                                 int? temMuniId = tPleaseMunicipalityWordsId;
//                                 int? temWard = tPleaseSeletcWardValueWordsId;

//                                 int jobCId = jobCategoryValueWordId;

//                                 if (citizenshipNo == '') {
//                                   return showCustomSnackBar(
//                                       'citizenshipNo', context);
//                                 }
//                                 if (dobDateTime == 'YYY/MM/DD') {
//                                   return showCustomSnackBar(
//                                       'Enter day of birth', context);
//                                 }
//                                 int showPemOption = 1;
//                                 if (isVisibleTopHint) {
//                                   showPemOption = 1;
//                                 } else {
//                                   showPemOption = 0;
//                                 }

//                                 print(' hgfjsdgjf $jobCId');

//                                 final data = {
//                                   "name": name,
//                                   "per_pradesh_id": perPradeshId,
//                                   "per_district_id": perDistrictId,
//                                   "per_muni_id": perMuniId,
//                                   "per_ward": perWard,
//                                   "pradesh_id": temPradeshId,
//                                   "district_id": temDistrictId,
//                                   "muni_id": temMuniId,
//                                   "ward": temWard,
//                                   "gender": gender,
//                                   "mobile": mobile,
//                                   "other_skills": otherskillValue,
//                                   "dob": dobDateTime,
//                                   "citizenship_no": int.parse(citizenshipNo),
//                                   "expected_salary": expectedSummons,
//                                   "is_pmep": showPemOption,
//                                   "preference_job_cat[]": _myActivities,
//                                   "ethnicity_type": castValueWordId,
//                                   "differently_able": disabledValueWordId,
//                                   "migrant_worker": migrantWorkersValueWordId,
//                                   "minority_group": minorGroupValueWordId
//                                 };

//                                 print('jgkhdfkjghjk $data');

//                                 if (imagePath != null) {
//                                   data['file'] = MultipartFile.fromFileSync(
//                                       imagePath!,
//                                       filename: imageName);
//                                 }
//                                 final formData = FormData.fromMap(data);
//                                 String? token = "";
//                                 final box = GetStorage();
//                                 token = box.read(AppConstants.TOKEN);
//                                 BaseOptions options = BaseOptions(
//                                     baseUrl: Apis.BASE_URL,
//                                     headers: {
//                                       'Accept': 'application/json',
//                                       'Authorization': 'Bearer $token'
//                                     });
//                                 Dio dio = Dio(options);

//                                 showLoaderDialog(context);
//                                 var response = await dio.post(
//                                   '${Apis.UPDATE_PROFILE}${widget.myProfileModel.data!.id}',
//                                   data: formData,
//                                   options: Options(
//                                       followRedirects: false,
//                                       validateStatus: (status) {
//                                         return status! <= 500;
//                                       }),
//                                 );

//                                 print("fdskj   ${response.statusCode}");
//                                 print("sfdsf  ${response.data}");

//                                 if (response.statusCode == 200) {
//                                   Navigator.pop(context);
//                                   showCustomSnackBar('successful', context,
//                                       isError: false);
//                                   successDialog(AppConstants
//                                       .Your_account_is_successful_has_been_created);
//                                   Provider.of<MyProfileProvider>(context,
//                                           listen: false)
//                                       .getMyProfile();
//                                   Navigator.pop(context);
//                                   Navigator.pop(context);
//                                 } else {
//                                   Map map = response.data;
//                                   String error = map['message'];
//                                   if (map['errors'] != null) {
//                                     error = map['errors']['dob'][0];
//                                   }
//                                   showCustomSnackBar('$error', context);
//                                   Navigator.pop(context);
//                                 }

//                                 // successDialog(AppConstants.Your_account_is_successful_has_been_created);
//                               })
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   myBoxDecoration() {
//     return BoxDecoration(
//       borderRadius: BorderRadius.circular(3),
//       color: ColorsResource.WHAIT,
//       border: Border.all(
//         color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
//         width: 1,
//       ),
//     );
//   }

//   genderDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 locationProvider.genderValueWord,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: locationProvider.genderValueWord, //add this parameter
//               items:
//                   locationProvider.genderWord?.map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color: dropDownStringItem != AppConstants.select_gender
//                             ? ColorsResource.TEXT_BLACK_COLOR
//                             : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   if (selectedValue! == 'पुरुष') {
//                     locationProvider.setGender(selectedValue, 1);
//                   } else if (selectedValue == 'महिला') {
//                     locationProvider.setGender(selectedValue, 2);
//                   } else if (selectedValue == 'अन्य') {
//                     locationProvider.setGender(selectedValue, 3);
//                   }
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   pleaseStatePradashDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 pleasePradashHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: pleasePradashValueWord, //add this parameter
//               items: locationProvider.pradashWords
//                   ?.map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color: dropDownStringItem !=
//                                 AppConstants.please_state_channuhos
//                             ? ColorsResource.TEXT_BLACK_COLOR
//                             : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   pleasePradashValueWord = selectedValue!;
//                   pleasePradashHintValueWord = selectedValue;
//                   pradashWordsId = locationProvider.pradashWordsIdList![
//                       locationProvider.pradashWords!.indexOf(selectedValue)];
//                   print('11  ${pradashWordsId}');

//                   if (pradashWordsId != 0) {
//                     pleaseTheDistrictValueWord =
//                         AppConstants.Please_enter_the_district;
//                     pleaseTheDistrictHintValueWord =
//                         AppConstants.Please_enter_the_district;
//                   }
//                   locationProvider.getDistricts(pradashWordsId!);
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   pleaseEnterTheDistrictDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 pleaseTheDistrictHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: pleaseTheDistrictValueWord, //add this parameter
//               items: locationProvider.pleaseTheDistrictWords
//                   .map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color: dropDownStringItem !=
//                                 AppConstants.Please_enter_the_district
//                             ? ColorsResource.TEXT_BLACK_COLOR
//                             : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   if (pradashWordsId == 0) {
//                     return showCustomSnackBar("select pradesh", context);
//                   }

//                   if (pleaseTheDistrictWordsId != 0) {
//                     pleaseMunicipalityValueWord =
//                         AppConstants.Please_be_a_municipality;
//                     pleaseMunicipalityHintValueWord =
//                         AppConstants.Please_be_a_municipality;
//                   }

//                   pleaseTheDistrictValueWord = selectedValue!;
//                   pleaseTheDistrictHintValueWord = selectedValue;
//                   pleaseTheDistrictWordsId =
//                       locationProvider.pleaseTheDistrictWordsIdList[
//                           locationProvider.pleaseTheDistrictWords
//                               .indexOf(selectedValue)];
//                   print('222  ${pleaseTheDistrictWordsId}');
//                   locationProvider.getMunicipalities(pleaseTheDistrictWordsId!);
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   pleaseDeaMunicipalityDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 pleaseMunicipalityHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: pleaseMunicipalityValueWord, //add this parameter
//               items: locationProvider.pleaseMunicipalityWords
//                   .map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color: dropDownStringItem !=
//                                 AppConstants.Please_be_a_municipality
//                             ? ColorsResource.TEXT_BLACK_COLOR
//                             : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   if (pradashWordsId == 0) {
//                     return showCustomSnackBar("select District", context);
//                   }
//                   pleaseMunicipalityValueWord = selectedValue!;
//                   pleaseMunicipalityHintValueWord = selectedValue;

//                   print(
//                       '333 1 ${locationProvider.pleaseMunicipalityWords.indexOf(selectedValue)}');

//                   pleaseMunicipalityWordsId =
//                       locationProvider.pleaseMunicipalityWordsIdList[
//                           locationProvider.pleaseMunicipalityWords
//                               .indexOf(selectedValue)];

//                   print('333  ${pleaseMunicipalityWordsId}');
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   pleaseSeletcWardDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 pleaseMunicipalityHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: pleaseSeletcWardValueWord, //add this parameter
//               items: locationProvider.pleaseSeletcWardValueWords
//                   ?.map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color:
//                             dropDownStringItem != AppConstants.Please_be_a_ward
//                                 ? ColorsResource.TEXT_BLACK_COLOR
//                                 : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   pleaseSeletcWardValueWord = selectedValue!;
//                   pleaseSeletcWardHintValueWord = selectedValue;
//                   pleaseSeletcWardValueWordsId =
//                       int.parse(pleaseSeletcWardValueWord);

//                   print('fdgfdg 1 $pleaseSeletcWardValueWordsId');
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   tPleasePradashDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 tPleasePradashHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: tPleasePradashValueWord, //add this parameter
//               items: locationProvider.pradashWords!
//                   .map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color: dropDownStringItem !=
//                                 AppConstants.please_state_channuhos
//                             ? ColorsResource.TEXT_BLACK_COLOR
//                             : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   tPleasePradashValueWord = selectedValue!;
//                   tPleasePradashHintValueWord = selectedValue;

//                   tPradashWordsId = locationProvider.pradashWordsIdList![
//                       locationProvider.pradashWords!.indexOf(selectedValue)];
//                   print(' 44 ${tPradashWordsId}');

//                   if (tPradashWordsId != 0) {
//                     tPleaseTheDistrictValueWord =
//                         AppConstants.Please_enter_the_district;
//                     tPleaseTheDistrictHintValueWord =
//                         AppConstants.Please_enter_the_district;
//                     locationProvider.tGetDistricts(tPradashWordsId!);
//                   }
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   tPleaseEnterTheDistrictDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 tPleaseTheDistrictHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: tPleaseTheDistrictValueWord, //add this parameter
//               items: valuefirst
//                   ? locationProvider.pleaseTheDistrictWords
//                       .map((String dropDownStringItem) {
//                       return DropdownMenuItem(
//                         value: dropDownStringItem,
//                         child: Text(
//                           dropDownStringItem,
//                           style: TextStyle(
//                               fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                               fontSize: Dimensions.BODY_16,
//                               color: dropDownStringItem !=
//                                       AppConstants.Please_enter_the_district
//                                   ? ColorsResource.TEXT_BLACK_COLOR
//                                   : ColorsResource.TEXT_GRAY_COLOR),
//                         ),
//                       );
//                     }).toList()
//                   : locationProvider.tPleaseTheDistrictWords
//                       .map((String dropDownStringItem) {
//                       return DropdownMenuItem(
//                         value: dropDownStringItem,
//                         child: Text(
//                           dropDownStringItem,
//                           style: TextStyle(
//                               fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                               fontSize: Dimensions.BODY_16,
//                               color: dropDownStringItem !=
//                                       AppConstants.Please_enter_the_district
//                                   ? ColorsResource.TEXT_BLACK_COLOR
//                                   : ColorsResource.TEXT_GRAY_COLOR),
//                         ),
//                       );
//                     }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   if (tPradashWordsId == 0) {
//                     return showCustomSnackBar("select pradesh", context);
//                   }
//                   tPleaseTheDistrictValueWord = selectedValue!;
//                   tPleaseTheDistrictHintValueWord = selectedValue;
//                   // tPleaseTheDistrictWordsId = 1;
//                   tPleaseTheDistrictWordsId =
//                       locationProvider.tPleaseTheDistrictWordsIdList[
//                           locationProvider.tPleaseTheDistrictWords
//                               .indexOf(selectedValue)];
//                   print(' 44 ${tPleaseTheDistrictWordsId}');
//                   if (tPleaseTheDistrictWordsId != 0) {
//                     tPleaseMunicipalityValueWord =
//                         AppConstants.Please_be_a_municipality;
//                     tPleaseMunicipalityHintValueWord =
//                         AppConstants.Please_be_a_municipality;
//                   }

//                   locationProvider
//                       .tGetMunicipalities(tPleaseTheDistrictWordsId!);
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   tPleaseDeaMunicipalityDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 tPleaseMunicipalityHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: tPleaseMunicipalityValueWord, //add this parameter
//               items: valuefirst
//                   ? locationProvider.pleaseMunicipalityWords
//                       .map((String dropDownStringItem) {
//                       return DropdownMenuItem(
//                         value: dropDownStringItem,
//                         child: Text(
//                           dropDownStringItem,
//                           style: TextStyle(
//                               fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                               fontSize: Dimensions.BODY_16,
//                               color: dropDownStringItem !=
//                                       AppConstants.Please_be_a_municipality
//                                   ? ColorsResource.TEXT_BLACK_COLOR
//                                   : ColorsResource.TEXT_GRAY_COLOR),
//                         ),
//                       );
//                     }).toList()
//                   : locationProvider.tPleaseMunicipalityWords
//                       .map((String dropDownStringItem) {
//                       return DropdownMenuItem(
//                         value: dropDownStringItem,
//                         child: Text(
//                           dropDownStringItem,
//                           style: TextStyle(
//                               fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                               fontSize: Dimensions.BODY_16,
//                               color: dropDownStringItem !=
//                                       AppConstants.Please_be_a_municipality
//                                   ? ColorsResource.TEXT_BLACK_COLOR
//                                   : ColorsResource.TEXT_GRAY_COLOR),
//                         ),
//                       );
//                     }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   tPleaseMunicipalityValueWord = selectedValue!;
//                   tPleaseMunicipalityHintValueWord = selectedValue;
//                   tPleaseMunicipalityWordsId =
//                       locationProvider.tPleaseMunicipalityWordsIdList[
//                           locationProvider.tPleaseMunicipalityWords
//                               .indexOf(selectedValue)];
//                   print(('555 $tPleaseMunicipalityWordsId'));
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   tPleaseSeletcWardDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 tpleaseSeletcWardHintValueWord!,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: tPleaseSeletcWardValueWord, //add this parameter
//               items: locationProvider.pleaseSeletcWardValueWords
//                   ?.map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color:
//                             dropDownStringItem != AppConstants.Please_be_a_ward
//                                 ? ColorsResource.TEXT_BLACK_COLOR
//                                 : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   tPleaseSeletcWardValueWord = selectedValue!;
//                   tpleaseSeletcWardHintValueWord = selectedValue;
//                   tPleaseSeletcWardValueWordsId =
//                       int.parse(tPleaseSeletcWardValueWord!);

//                   print('fdgfdg 2 $tPleaseSeletcWardValueWordsId');
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   ///PEMP
//   ethnicityDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 castHintValueword,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: castValueWord, //add this parameter
//               items: locationProvider.castDataListString
//                   ?.map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color: dropDownStringItem != AppConstants.SELECT_CAST
//                             ? ColorsResource.TEXT_BLACK_COLOR
//                             : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   castValueWord = selectedValue!;
//                   castHintValueword = selectedValue;

//                   castValueWordId = locationProvider.castDataListInt![
//                       locationProvider.castDataListString!
//                           .indexOf(selectedValue)];
//                   print('hdsfjhsd $castValueWordId');
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   minorGroupDropdown2() {
//     return Container(
//       height: 54,
//       width: MediaQuery.of(context).size.width / 1.1,
//       decoration: myBoxDecoration(),
//       child: Container(
//         margin: const EdgeInsets.only(left: 10, right: 10),
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: DropdownButton<String>(
//             elevation: 16,
//             isExpanded: true,
//             style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//             underline: Container(
//               height: 2,
//               color: Colors.transparent,
//             ),
//             hint: Text(
//               minorGroupHintValueword,
//               style: TextStyle(
//                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                   fontSize: Dimensions.BODY_16,
//                   color: ColorsResource.TEXT_GRAY_COLOR),
//             ),
//             iconSize: 30,
//             value: minorGroupValueWord, //add this parameter
//             items: minorGroupklassenword.map((String dropDownStringItem) {
//               return DropdownMenuItem(
//                 value: dropDownStringItem,
//                 child: Text(
//                   dropDownStringItem,
//                   style: TextStyle(
//                       fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                       fontSize: Dimensions.BODY_16,
//                       color: dropDownStringItem != AppConstants.SELECT_YES_NO
//                           ? ColorsResource.TEXT_BLACK_COLOR
//                           : ColorsResource.TEXT_GRAY_COLOR),
//                 ),
//               );
//             }).toList(),
//             onChanged: (selectedValue) {
//               setState(() {
//                 minorGroupValueWord = selectedValue!;
//                 minorGroupHintValueword = selectedValue;

//                 if (selectedValue == 'हो') {
//                   minorGroupValueWordId = 1;
//                 } else if (selectedValue == 'हैन') {
//                   minorGroupValueWordId = 0;
//                 }
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   migrantWorkersDropdown() {
//     return Container(
//       height: 54,
//       width: MediaQuery.of(context).size.width / 1.1,
//       decoration: myBoxDecoration(),
//       child: Container(
//         margin: const EdgeInsets.only(left: 10, right: 10),
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: DropdownButton<String>(
//             elevation: 16,
//             isExpanded: true,
//             style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//             underline: Container(
//               height: 2,
//               color: Colors.transparent,
//             ),
//             hint: Text(
//               migrantWorkersHintValueword,
//               style: TextStyle(
//                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                   fontSize: Dimensions.BODY_16,
//                   color: ColorsResource.TEXT_GRAY_COLOR),
//             ),
//             iconSize: 30,
//             value: migrantWorkersValueWord, //add this parameter
//             items: migrantWorkersklassenword.map((String dropDownStringItem) {
//               return DropdownMenuItem(
//                 value: dropDownStringItem,
//                 child: Text(
//                   dropDownStringItem,
//                   style: TextStyle(
//                       fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                       fontSize: Dimensions.BODY_16,
//                       color: dropDownStringItem != AppConstants.SELECT_YES_NO
//                           ? ColorsResource.TEXT_BLACK_COLOR
//                           : ColorsResource.TEXT_GRAY_COLOR),
//                 ),
//               );
//             }).toList(),
//             onChanged: (selectedValue) {
//               setState(() {
//                 migrantWorkersValueWord = selectedValue!;
//                 migrantWorkersHintValueword = selectedValue;
//                 if (selectedValue == 'हो') {
//                   migrantWorkersValueWordId = 1;
//                 } else if (selectedValue == 'हैन') {
//                   migrantWorkersValueWordId = 0;
//                 }
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   disabledDropdown() {
//     return Container(
//       height: 54,
//       width: MediaQuery.of(context).size.width / 1.1,
//       decoration: myBoxDecoration(),
//       child: Container(
//         margin: const EdgeInsets.only(left: 10, right: 10),
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: DropdownButton<String>(
//             elevation: 16,
//             isExpanded: true,
//             style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//             underline: Container(
//               height: 2,
//               color: Colors.transparent,
//             ),
//             hint: Text(
//               disabledHintValueword,
//               style: TextStyle(
//                   fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                   fontSize: Dimensions.BODY_16,
//                   color: ColorsResource.TEXT_GRAY_COLOR),
//             ),
//             iconSize: 30,
//             value: disabledValueWord, //add this parameter
//             items: disabledklassenword.map((String dropDownStringItem) {
//               return DropdownMenuItem(
//                 value: dropDownStringItem,
//                 child: Text(
//                   dropDownStringItem,
//                   style: TextStyle(
//                       fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                       fontSize: Dimensions.BODY_16,
//                       color: dropDownStringItem != AppConstants.SELECT_YES_NO
//                           ? ColorsResource.TEXT_BLACK_COLOR
//                           : ColorsResource.TEXT_GRAY_COLOR),
//                 ),
//               );
//             }).toList(),
//             onChanged: (selectedValue) {
//               setState(() {
//                 disabledValueWord = selectedValue!;
//                 disabledHintValueword = selectedValue;

//                 if (selectedValue == 'हो') {
//                   disabledValueWordId = 1;
//                 } else if (selectedValue == 'हैन') {
//                   disabledValueWordId = 0;
//                 }
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   ///Dialog
//   successDialog(String title) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(3.0)), //this right here
//               child: Container(
//                 height: 200,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(3),
//                           topLeft: Radius.circular(3),
//                         ),
//                         color: ColorsResource.WHAIT,
//                         border: Border.all(
//                           color: ColorsResource.WHAIT,
//                           width: 1,
//                         ),
//                       ),
//                       height: 30,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                             onHover: (_) {},
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                                 margin: EdgeInsets.only(right: 10),
//                                 child: SvgPicture.asset(
//                                   AppImages.ic_close,
//                                   color: ColorsResource.TEXT_BLACK_COLOR,
//                                 )),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(
//                             left: 10, right: 10, top: 10, bottom: 10),
//                         child: Text(
//                           title,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: Dimensions.BODY_20,
//                               color: ColorsResource.TEXT_BLACK_COLOR),
//                         )),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Align(
//                         alignment: Alignment.center,
//                         child: SvgPicture.asset(AppImages.ic_sucses))
//                   ],
//                 ),
//               ));
//         });
//   }

//   jobCategoryDropdown() {
//     return Consumer<LocationProvider>(
//       builder: (context, locationProvider, child) => Container(
//         height: 54,
//         width: MediaQuery.of(context).size.width / 1.1,
//         decoration: myBoxDecoration(),
//         child: Container(
//           margin: const EdgeInsets.only(left: 10, right: 10),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: DropdownButton<String>(
//               elevation: 16,
//               isExpanded: true,
//               style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
//               underline: Container(
//                 height: 2,
//                 color: Colors.transparent,
//               ),
//               hint: Text(
//                 jobCategoryHintValueWord,
//                 style: TextStyle(
//                     fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                     fontSize: Dimensions.BODY_16,
//                     color: ColorsResource.TEXT_GRAY_COLOR),
//               ),
//               iconSize: 30,
//               value: jobCategoryValueWord, //add this parameter
//               items: locationProvider.viewAllJobCategoryDataListSting
//                   ?.map((String dropDownStringItem) {
//                 return DropdownMenuItem(
//                   value: dropDownStringItem,
//                   child: Text(
//                     dropDownStringItem,
//                     style: TextStyle(
//                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
//                         fontSize: Dimensions.BODY_16,
//                         color: dropDownStringItem != AppConstants.Please_stay
//                             ? ColorsResource.TEXT_BLACK_COLOR
//                             : ColorsResource.TEXT_GRAY_COLOR),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (selectedValue) {
//                 setState(() {
//                   jobCategoryValueWord = selectedValue!;
//                   jobCategoryHintValueWord = selectedValue;
//                   jobCategoryValueWordId =
//                       locationProvider.viewAllJobCategoryDataListId![
//                           locationProvider.viewAllJobCategoryDataListSting!
//                               .indexOf(jobCategoryValueWord)];
//                   print('sdfsdf  $jobCategoryValueWordId');
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List? _myActivities = [];
//   List? _myActivitiesString = [];

//   multipleJobCategoryAdd() {
//     double height = 370;
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(3.0)), //this right here
//               child: Consumer<LocationProvider>(
//                 builder: (context, locationProvider, child) => SizedBox(
//                   height: height,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(3),
//                             topLeft: Radius.circular(3),
//                           ),
//                           color: ColorsResource.PRAYMERY_COLOR,
//                           border: Border.all(
//                             color: ColorsResource.PRAYMERY_COLOR,
//                             width: 1,
//                           ),
//                         ),
//                         height: 30,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               'कृपया छन्नुहोस्',
//                               style: TextStyle(
//                                   color: ColorsResource.PRAYMARY_TEXT_COLOR,
//                                   fontSize: Dimensions.BODY_14),
//                             ),
//                             Expanded(child: Container()),
//                             InkWell(
//                               onHover: (_) {},
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Container(
//                                   margin: EdgeInsets.only(right: 10),
//                                   child: SvgPicture.asset(
//                                     AppImages.ic_close,
//                                     color: ColorsResource.PRAYMARY_TEXT_COLOR,
//                                   )),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 5, left: 10, right: 10),
//                         child: Container(
//                           height: 250,
//                           child: SingleChildScrollView(
//                             child: MultiSelectFormField(
//                               autovalidate: AutovalidateMode.disabled,
//                               chipBackGroundColor:
//                                   ColorsResource.TEXT_GRAY_COLOR,
//                               chipLabelStyle: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                               dialogTextStyle:
//                                   TextStyle(fontWeight: FontWeight.bold),
//                               checkBoxActiveColor:
//                                   ColorsResource.TEXT_GRAY_COLOR,
//                               checkBoxCheckColor: Colors.white,
//                               dialogShapeBorder: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(12.0))),
//                               title: Text(
//                                 'कृपया छन्नुहोस्',
//                                 style: const TextStyle(fontSize: 10),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.length == 0) {
//                                   return 'Please select one or more options';
//                                 }
//                                 return null;
//                               },
//                               dataSource:
//                                   locationProvider.allJobCategoryDataList,
//                               textField: 'display',
//                               valueField: 'value',
//                               okButtonLabel: 'OK',
//                               cancelButtonLabel: 'CANCEL',
//                               hintWidget:
//                                   const Text('Please choose one or more'),
//                               initialValue: _myActivities,
//                               onSaved: (value) {
//                                 if (value == null) return;
//                                 setState(() {
//                                   _myActivities = value;

//                                   _myActivities?.forEach((element) {
//                                     String name = locationProvider
//                                             .viewAllJobCategoryDataListSting![
//                                         locationProvider
//                                             .viewAllJobCategoryDataListId!
//                                             .indexOf(int.parse(element))];

//                                     _myActivitiesString?.addAll(_myActivities!.map((e) => name));
//                                     print(name);
//                                   });
//                                   print(value);
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Expanded(child: Container()),
//                           CustomButton(
//                             AppConstants.save,
//                             () {
//                               Navigator.of(context).pop();
//                             },
//                             height: 24,
//                             wight: 62,
//                             textSize: 10,
//                             padding: 2,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ));
//         });
//   }

//   DateTime selectedDate = DateTime.now();
//   Future<String> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(1910, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }

//     print(selectedDate);
//     return '${selectedDate}';
//   }
// }
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmiis/models/ResponsModels/ViewAllJobCategoryModel.dart';
import 'package:lmiis/provider/MyProfileProvider.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/ResponsModels/MyProfileModel.dart';
import '../../provider/LocationProvider.dart';
import '../../utils/Apis.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custtom_button.dart';
import '../widgets/showCustomSnackBar.dart';
import 'EditMyProfileScreen.dart';

class EditFullProfile extends StatefulWidget {
  MyProfileModel myProfileModel;
  EditFullProfile(this.myProfileModel);

  @override
  State<EditFullProfile> createState() => _EditFullProfileState();
}

class _EditFullProfileState extends State<EditFullProfile> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController citizenshipNoTextEditingController =
      TextEditingController();
  TextEditingController expectedSummonsTextEditingController =
      TextEditingController();
  TextEditingController otherjobTextEditingController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode citizenshipNoFocusNode = FocusNode();
  FocusNode dateOfBirthFocusNode = FocusNode();
  FocusNode expectedSummonsFocusNode = FocusNode();
  FocusNode otherJobFocusNode = FocusNode();

  bool isVisibleTopHint = true;

  var jobCategoryValueWord = AppConstants.Please_stay;
  String jobCategoryHintValueWord = AppConstants.Please_stay;
  int jobCategoryValueWordId = 0;

  var castValueWord = AppConstants.SELECT_CAST;
  String castHintValueword = AppConstants.SELECT_CAST;
  int castValueWordId = 0;

  var minorGroupValueWord = AppConstants.SELECT_YES_NO;
  String minorGroupHintValueword = AppConstants.SELECT_YES_NO;
  List<String> minorGroupklassenword = [
    AppConstants.SELECT_YES_NO,
    AppConstants.SELECT_YES,
    AppConstants.SELECT_NO,
  ];
  int minorGroupValueWordId = 0;

  var migrantWorkersValueWord = AppConstants.SELECT_YES_NO;
  String migrantWorkersHintValueword = AppConstants.SELECT_YES_NO;
  List<String> migrantWorkersklassenword = [
    AppConstants.SELECT_YES_NO,
    AppConstants.SELECT_YES,
    AppConstants.SELECT_NO,
  ];
  int migrantWorkersValueWordId = 0;

  var disabledValueWord = AppConstants.SELECT_YES_NO;
  String disabledHintValueword = AppConstants.SELECT_YES_NO;
  List<String> disabledklassenword = [
    AppConstants.SELECT_YES_NO,
    AppConstants.SELECT_YES,
    AppConstants.SELECT_NO,
  ];
  int disabledValueWordId = 0;

  //Permanent
  String? pleasePradashValueWord = AppConstants.please_state_channuhos;
  String? pleasePradashHintValueWord = AppConstants.please_state_channuhos;
  int? pradashWordsId = 0;

  String? pleaseTheDistrictValueWord = AppConstants.Please_enter_the_district;
  String? pleaseTheDistrictHintValueWord =
      AppConstants.Please_enter_the_district;
  int? pleaseTheDistrictWordsId = 0;

  var pleaseMunicipalityValueWord = AppConstants.Please_be_a_municipality;
  String? pleaseMunicipalityHintValueWord =
      AppConstants.Please_be_a_municipality;
  int? pleaseMunicipalityWordsId = 0;

  var pleaseSeletcWardValueWord = AppConstants.Please_be_a_ward;
  String? pleaseSeletcWardHintValueWord = AppConstants.Please_be_a_ward;
  int? pleaseSeletcWardValueWordsId = 0;

  //Temporal
  bool valuefirst = false;

  String? tPleasePradashValueWord = AppConstants.please_state_channuhos;
  String? tPleasePradashHintValueWord = AppConstants.please_state_channuhos;
  int? tPradashWordsId = 0;

  String? tPleaseTheDistrictValueWord = AppConstants.Please_enter_the_district;
  String? tPleaseTheDistrictHintValueWord =
      AppConstants.Please_enter_the_district;
  int? tPleaseTheDistrictWordsId = 0;

  String? tPleaseMunicipalityValueWord = AppConstants.Please_be_a_municipality;
  String? tPleaseMunicipalityHintValueWord =
      AppConstants.Please_be_a_municipality;
  int? tPleaseMunicipalityWordsId = 0;

  String? tPleaseSeletcWardValueWord = AppConstants.Please_be_a_ward;
  String? tpleaseSeletcWardHintValueWord = AppConstants.Please_be_a_ward;
  int? tPleaseSeletcWardValueWordsId = 0;

  bool isLoading = true;
  String imageName = '';
  String imageName2 = 'No file Choose ';
  String? imagePath;
  String dobDateTime = 'YYY/MM/DD';

  @override
  void initState() {
    for (var element
        in widget.myProfileModel.data!.jobseekerPreferenceCategory!) {
      _myActivities?.add(element.categoryId);

      _myActivitiesString?.add(element.categoryName);
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var myProfile = Provider.of<MyProfileProvider>(context, listen: false);
      var locationProvider =
          Provider.of<LocationProvider>(context, listen: false);

      MyProfileModel? myProfileModel = myProfile.myProfileModel!;
      MyProfileData? myProfileData = myProfile.myProfileModel!.data;

      nameTextEditingController.text = myProfileModel.data!.name!;
      mobileNumberTextEditingController.text = myProfileModel.data!.mobile!;
      if (myProfileModel.data?.citizenshipNo != null) {
        citizenshipNoTextEditingController.text =
            myProfileModel.data!.citizenshipNo!;
      }
      if (myProfileModel.data?.dob != null) {
        dobDateTime = myProfileModel.data!.dob!;
      }
      if (myProfileModel.data?.expectedSalary != null) {
        expectedSummonsTextEditingController.text =
            myProfileModel.data!.expectedSalary!;
      }
      if (myProfileModel.data?.otherSkills != null) {
        otherjobTextEditingController.text = myProfileModel.data!.otherSkills!;
      }

      if (myProfileData?.file != null) {
        String? fileName = myProfileData?.file!.split('/').last;
        imageName2 = fileName!;
      }

      if (myProfileModel.data!.gender! == 'पुरुष') {
        locationProvider.setGender(myProfileModel.data!.gender!, 1);
      } else if (myProfileModel.data!.gender! == 'महिला') {
        locationProvider.setGender(myProfileModel.data!.gender!, 2);
      } else if (myProfileModel.data!.gender! == 'अन्य') {
        locationProvider.setGender(myProfileModel.data!.gender!, 3);
      }

      if (myProfileData?.jobseekerPreferenceCategory != null) {
        if (myProfileData!.jobseekerPreferenceCategory!.length > 0) {
          String? categoryName = myProfileData
              .jobseekerPreferenceCategory?[
                  myProfileData.jobseekerPreferenceCategory!.length - 1]
              .categoryName;
          int? id = int.parse(myProfileData
              .jobseekerPreferenceCategory![
                  myProfileData.jobseekerPreferenceCategory!.length - 1]
              .categoryId!);
          jobCategoryValueWord = categoryName!;
          jobCategoryHintValueWord = categoryName;
          jobCategoryValueWordId = id;
          print('fsfsdf  $id');
        }
      }

      if (myProfileModel.data!.differentlyAble != null) {
        if (myProfileModel.data!.differentlyAble == 1) {
          disabledValueWord = AppConstants.SELECT_YES;
          disabledHintValueword = AppConstants.SELECT_YES;
          disabledValueWordId = 1;
        } else if (myProfileModel.data!.differentlyAble == 0) {
          disabledValueWord = AppConstants.SELECT_NO;
          disabledHintValueword = AppConstants.SELECT_NO;
          disabledValueWordId = 0;
        }
      }

      locationProvider.getCast().then((value) {
        if (myProfileModel.data!.ethnicityType != null) {
          int? id = int.parse(myProfileModel.data!.ethnicityType!);
          castValueWordId = id;
          String castName = locationProvider.castDataListString![
              locationProvider.castDataListInt!.indexOf(castValueWordId)];
          castValueWord = castName;
          castHintValueword = castName;
        }
      });
      if (myProfileModel.data!.migrantWorker != null) {
        if (myProfileModel.data!.migrantWorker == 1) {
          migrantWorkersValueWord = AppConstants.SELECT_YES;
          migrantWorkersHintValueword = AppConstants.SELECT_YES;
          migrantWorkersValueWordId = 1;
        } else if (myProfileModel.data!.migrantWorker == 0) {
          migrantWorkersValueWord = AppConstants.SELECT_NO;
          migrantWorkersHintValueword = AppConstants.SELECT_NO;
          migrantWorkersValueWordId = 0;
        }
      }

      if (myProfileModel.data!.minorityGroup != null) {
        if (myProfileModel.data!.minorityGroup == 1) {
          minorGroupValueWord = AppConstants.SELECT_YES;
          minorGroupHintValueword = AppConstants.SELECT_YES;
          minorGroupValueWordId = 1;
        } else if (myProfileModel.data!.minorityGroup == 0) {
          minorGroupValueWord = AppConstants.SELECT_NO;
          minorGroupHintValueword = AppConstants.SELECT_NO;
          minorGroupValueWordId = 0;
        }
      }

      locationProvider.getPradesh().then((value) {
        pleasePradashValueWord = myProfileData?.perPradeshName!;
        pleasePradashHintValueWord = myProfileData?.perPradeshName!;
        pradashWordsId = myProfileData!.perPradeshId!;
        locationProvider.getDistricts(pradashWordsId!).then((value) {
          pleaseTheDistrictValueWord = myProfileData.perDistrictName!;
          pleaseTheDistrictHintValueWord = myProfileData.perDistrictName!;
          pleaseTheDistrictWordsId = myProfileData.perDistrictId!;

          locationProvider
              .getMunicipalities(pleaseTheDistrictWordsId!)
              .then((value) {
            pleaseMunicipalityValueWord = myProfileData.perMuniName!;
            pleaseMunicipalityHintValueWord = myProfileData.perMuniName!;
            pleaseMunicipalityWordsId = myProfileData.perMuniId!;

            pleaseSeletcWardValueWord = myProfileData.perWard!;
            pleaseSeletcWardHintValueWord = myProfileData.perWard!;
            pleaseSeletcWardValueWordsId = int.parse(myProfileData.ward!);
          });
        });

        locationProvider.tGetPradesh().then((value) {
          tPleasePradashValueWord = myProfileData.tempPradeshName!;
          tPleasePradashHintValueWord = myProfileData.tempPradeshName!;
          tPradashWordsId = myProfileData.pradeshId!;
          locationProvider.tGetDistricts(tPradashWordsId!).then((value) {
            tPleaseTheDistrictValueWord = myProfileData.tempDistrictName!;
            tPleaseTheDistrictHintValueWord = myProfileData.tempDistrictName!;
            tPleaseTheDistrictWordsId = myProfileData.districtId!;
            locationProvider
                .tGetMunicipalities(tPleaseTheDistrictWordsId!)
                .then((value) {
              tPleaseMunicipalityValueWord = myProfileData.tempMuniName!;
              tPleaseMunicipalityHintValueWord = myProfileData.tempMuniName!;
              tPleaseMunicipalityWordsId = myProfileData.muniId;

              tPleaseSeletcWardValueWord = myProfileData.ward;
              tpleaseSeletcWardHintValueWord = myProfileData.ward;
              tPleaseSeletcWardValueWordsId = int.parse(myProfileData.ward!);
            });
          });
        });
      });

      // // tPleasePradashValueWord = pleasePradashValueWord;
      // // tPleasePradashHintValueWord = pleasePradashHintValueWord;
      // // tPradashWordsId = pradashWordsId;
      //
      // pleaseTheDistrictValueWord = myProfileData.perDistrictName!;
      // pleaseTheDistrictHintValueWord = myProfileData.perDistrictName!;
      // pleaseTheDistrictWordsId = myProfileData.perDistrictId!;
      //
      //
      // // tPleaseTheDistrictValueWord = pleaseTheDistrictValueWord;
      // // tPleaseTheDistrictHintValueWord = pleaseTheDistrictHintValueWord;
      // // tPleaseTheDistrictWordsId = pleaseTheDistrictWordsId;
      //
      // pleaseMunicipalityValueWord = myProfileData.perMuniName!;
      // pleaseMunicipalityHintValueWord = myProfileData.perMuniName!;
      // pleaseMunicipalityWordsId = myProfileData.perMuniId!;
      //
      // // tPleaseMunicipalityValueWord = pleaseMunicipalityValueWord;
      // // tPleaseMunicipalityHintValueWord = pleaseMunicipalityHintValueWord;
      // // tPleaseMunicipalityWordsId = pleaseMunicipalityWordsId;
      //
      // pleaseSeletcWardValueWord = myProfileData.perWard!;
      // pleaseSeletcWardHintValueWord = myProfileData.perWard!;
      // pleaseSeletcWardValueWordsId = int.parse(myProfileData.ward!);
      //
      // tPleaseSeletcWardValueWord = pleaseSeletcWardValueWord;
      // tpleaseSeletcWardHintValueWord = pleaseSeletcWardHintValueWord;
      // tPleaseSeletcWardValueWordsId =pleaseSeletcWardValueWordsId;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: ((context) => HomeScreen())),
            //     (route) => false)
            Navigator.pop(context)
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: ColorsResource.PRAYMARY_TEXT_COLOR,
        elevation: 0,
        centerTitle: true,
        title: Text(
          style: const TextStyle(
              fontSize: Dimensions.BODY_20,
              fontWeight: Dimensions.FONT_BOLD,
              color: Colors.white),
          AppConstants.Edit_profile,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer2<MyProfileProvider, LocationProvider>(
        builder: (context, myProfileProvider, locationProvider, child) => Stack(
          children: [
            // Positioned(
            //     top: 0,
            //     left: 0,
            //     right: 0,
            //     child: Container(
            //       color: ColorsResource.PRAYMERY_COLOR,
            //       child: Container(
            //         width: MediaQuery.of(context).size.width,
            //         height: MediaQuery.of(context).size.height * 0.050,
            //         margin: EdgeInsets.only(top: 40, left: 10, right: 10),
            //         child: Column(
            //           children: [
            //             //Toolbar
            //             Row(
            //               children: [
            //                 InkWell(
            //                     onHover: (_) {},
            //                     onTap: () {
            //                       Navigator.of(context).pop();
            //                     },
            //                     child:
            //                         SvgPicture.asset(AppImages.ic_back_blue)),
            //                 SizedBox(
            //                   width: MediaQuery.of(context).size.width - 65,
            //                   child: Text(
            //                     AppConstants.Edit_profile,
            //                     style: TextStyle(
            //                         fontSize: Dimensions.BODY_20,
            //                         fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
            //                         color: ColorsResource.PRAYMARY_TEXT_COLOR),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 2,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFieldWithTitle(AppConstants.NAME,
                            nameTextEditingController, nameFocusNode,
                            isBold: false, isShowRequrStar: true),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0, left: 0, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text(
                                AppConstants.select_gender,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Dimensions.BODY_14,
                                    color: ColorsResource.TEXT_BLACK_COLOR,
                                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                              ),
                              Text(
                                ' *',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: Dimensions.BODY_14,
                                    color: ColorsResource.TEXT_READ_COLOR,
                                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                              ),
                            ],
                          ),
                        ),
                        genderDropdown(),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFieldWithTitle(
                            AppConstants.mobile_number,
                            mobileNumberTextEditingController,
                            mobileNumberFocusNode,
                            isBold: false,
                            isShowRequrStar: true),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFieldWithTitle(
                          AppConstants.Citizenship_no,
                          citizenshipNoTextEditingController,
                          citizenshipNoFocusNode,
                          isBold: false,
                          isShowRequrStar: true,
                          inputType: AppConstants.PHONE,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '${AppConstants.date_of_birth}',
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_14,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            ),
                            Text(
                              ' *',
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_14,
                                  color: ColorsResource.TEXT_READ_COLOR,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: () async {
                            // var results = await showCalendarDatePicker2Dialog(
                            //   context: context,
                            //   config: CalendarDatePicker2WithActionButtonsConfig(),
                            //   dialogSize: const Size(325, 400),
                            // );
                            // if(results != null){
                            //   print(results[0]);
                            //   print(results[0]);
                            //   setState(() {
                            //     if(results[0] != ''){
                            //       String date = '${results[0]}';
                            //       int idx = date.indexOf(" ");
                            //       List parts = [date.substring(0,idx).trim(), date.substring(idx+1).trim()];
                            //       print(parts[0]);
                            //       dobDateTime = '${parts[0]}';
                            //     }
                            //
                            //   });
                            // }
                            //

                            _selectDate(context).then((results) {
                              if (results != null) {
                                final values = results.split(' ');
                                dobDateTime = '${values[0]}';
                              }
                            });

                            // showDatePickerF(
                            //   context: context,
                            //   initialDate: DateTime.fromMillisecondsSinceEpoch(),
                            //   firstDate: DateTime(2021),
                            //   lastDate: DateTime(2022),);
                          },
                          child: Container(
                            height: 44,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: myBoxDecoration(),
                            child: Container(
                              margin: EdgeInsets.only(top: 15, left: 10),
                              child: Text(
                                '$dobDateTime',
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFieldWithTitle(
                          AppConstants.expected_summons,
                          expectedSummonsTextEditingController,
                          expectedSummonsFocusNode,
                          isBold: false,
                          inputType: AppConstants.PHONE,
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Text(
                          AppConstants.Profile_photo,
                          style: TextStyle(
                              fontSize: Dimensions.BODY_14,
                              color: ColorsResource.TEXT_BLACK_COLOR,
                              fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                        ),
                        Container(
                          decoration: myBoxDecoration(),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () async {
                                    final ImagePicker _picker = ImagePicker();
                                    final XFile? photo = await _picker
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      imageName = photo!.name;
                                      imagePath = photo.path;
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: ColorsResource.TEXT_GRAY_COLOR,
                                      border: Border.all(
                                        color: ColorsResource.TEXT_GRAY_COLOR,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      ' Choose File',
                                      style: TextStyle(
                                          color: ColorsResource.WHAIT),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                    imageName == '' ? imageName2 : imageName),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          children: [
                            Text(
                              '${AppConstants.Choose_your_area_of_expertise}',
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_14,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            ),
                          ],
                        ),
                        // jobCategoryDropdown(),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            multipleJobCategoryAdd(widget.myProfileModel);
                          },
                          child: Container(
                              decoration: myBoxDecoration(),
                              margin: EdgeInsets.only(left: 5, right: 10),
                              padding: EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 105,
                                    child: RichText(
                                      text: TextSpan(
                                        text: _myActivitiesString!.length <= 0
                                            ? 'कृपया छन्नुहोस्'
                                            : '',
                                        style: GoogleFonts.poppins(
                                            fontSize: Dimensions.BODY_14,
                                            color:
                                                ColorsResource.TEXT_BLACK_COLOR,
                                            fontWeight:
                                                Dimensions.FONT_MEDIUM_NORMUL),
                                        children: _myActivitiesString!.map((e) {
                                          return TextSpan(text: '${e}, ');
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextFormFiled(
                          AppConstants.enterOtherJobField,
                          otherjobTextEditingController,
                          otherJobFocusNode,
                          isShowRequrStar: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              AppConstants.permanent_Address,
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_14,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            ),
                            Text(
                              ' *',
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_16,
                                  color: ColorsResource.TEXT_READ_COLOR,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        pleaseStatePradashDropdown(),
                        SizedBox(
                          height: 10,
                        ),
                        pleaseEnterTheDistrictDropdown(),
                        SizedBox(
                          height: 10,
                        ),
                        pleaseDeaMunicipalityDropdown(),
                        SizedBox(
                          height: 10,
                        ),
                        pleaseSeletcWardDropdown(),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              AppConstants.temporary_address,
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_14,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            ),
                            Text(
                              " *",
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_14,
                                  color: Colors.redAccent,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            ),
                            Expanded(child: Container()),
                            Text(
                              AppConstants.Permanent_Jas,
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_14,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                            ),
                            Checkbox(
                              value: valuefirst,
                              onChanged: (bool? value) {
                                setState(() {
                                  valuefirst = value!;
                                  if (valuefirst) {
                                    tPleasePradashValueWord =
                                        pleasePradashValueWord;
                                    tPleasePradashHintValueWord =
                                        pleasePradashHintValueWord;
                                    tPradashWordsId = pradashWordsId;

                                    tPleaseTheDistrictValueWord =
                                        pleaseTheDistrictValueWord;
                                    tPleaseTheDistrictHintValueWord =
                                        pleaseTheDistrictHintValueWord;
                                    tPleaseTheDistrictWordsId =
                                        pleaseTheDistrictWordsId;

                                    tPleaseMunicipalityValueWord =
                                        pleaseMunicipalityValueWord;
                                    tPleaseMunicipalityHintValueWord =
                                        pleaseMunicipalityHintValueWord;
                                    tPleaseMunicipalityWordsId =
                                        pleaseMunicipalityWordsId;

                                    tPleaseSeletcWardValueWord =
                                        pleaseSeletcWardValueWord;
                                    tpleaseSeletcWardHintValueWord =
                                        pleaseSeletcWardHintValueWord;
                                    tPleaseSeletcWardValueWordsId =
                                        pleaseSeletcWardValueWordsId;
                                  } else {
                                    print("kfjskhfjds 2");
                                    tPleasePradashValueWord =
                                        AppConstants.please_state_channuhos;
                                    tPleasePradashHintValueWord =
                                        AppConstants.please_state_channuhos;
                                    tPradashWordsId = 0;

                                    tPleaseTheDistrictValueWord =
                                        AppConstants.Please_enter_the_district;
                                    tPleaseTheDistrictHintValueWord =
                                        AppConstants.Please_enter_the_district;
                                    tPleaseTheDistrictWordsId = 0;

                                    tPleaseMunicipalityValueWord =
                                        AppConstants.Please_be_a_municipality;
                                    tPleaseMunicipalityHintValueWord =
                                        AppConstants.Please_be_a_municipality;
                                    tPleaseMunicipalityWordsId = 0;

                                    tPleaseSeletcWardValueWord =
                                        AppConstants.Please_be_a_ward;
                                    tpleaseSeletcWardHintValueWord =
                                        AppConstants.Please_be_a_ward;
                                    tPleaseSeletcWardValueWordsId = 0;
                                  }
                                });
                              },
                            )
                          ],
                        ),
                        tPleasePradashDropdown(),
                        SizedBox(
                          height: 10,
                        ),
                        tPleaseEnterTheDistrictDropdown(),
                        SizedBox(
                          height: 10,
                        ),
                        tPleaseDeaMunicipalityDropdown(),
                        SizedBox(
                          height: 10,
                        ),
                        tPleaseSeletcWardDropdown(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${AppConstants.pmep} ${AppConstants.under}',
                          style: TextStyle(
                              fontSize: Dimensions.BODY_14,
                              color: ColorsResource.TEXT_BLACK_COLOR,
                              fontWeight: Dimensions.FONT_MEDIUM),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 00),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                height: 15,
                                width: 20,
                                child: Checkbox(
                                  value: isVisibleTopHint,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isVisibleTopHint = value!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppConstants.pmep,
                                style: TextStyle(
                                    fontSize: Dimensions.BODY_14,
                                    color: ColorsResource.TEXT_BLACK_COLOR,
                                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                              ),
                            ],
                          ),
                        ),

                        Visibility(
                          visible: isVisibleTopHint,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${AppConstants.Ethnicity}',
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_BLACK_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  ),
                                  Text(
                                    " *",
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_READ_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  )
                                ],
                              ),
                              ethnicityDropdown(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${AppConstants.minor_group}',
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_BLACK_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  ),
                                  Text(
                                    " *",
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_READ_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  )
                                ],
                              ),
                              minorGroupDropdown2(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${AppConstants.Migrant_workers}',
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_BLACK_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  ),
                                  Text(
                                    " *",
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_READ_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  )
                                ],
                              ),
                              migrantWorkersDropdown(),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${AppConstants.disabled}',
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_BLACK_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  ),
                                  Text(
                                    " *",
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_READ_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                  )
                                ],
                              ),
                              disabledDropdown(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(AppConstants.Update1, () async {
                                MyProfileModel? myProfileModel =
                                    widget.myProfileModel;
                                MyProfileData? dataww = myProfileModel.data;

                                String name = nameTextEditingController.text;
                                String mobile =
                                    mobileNumberTextEditingController.text;
                                String citizenshipNo =
                                    citizenshipNoTextEditingController.text;
                                String expectedSummons =
                                    expectedSummonsTextEditingController.text;
                                String otherskillValue =
                                    otherjobTextEditingController.text;
                                int gender = locationProvider.genderValueWordId;

                                int? perPradeshId = pradashWordsId;
                                int? perDistrictId = pleaseTheDistrictWordsId;
                                int? perMuniId = pleaseMunicipalityWordsId;
                                int? perWard = pleaseSeletcWardValueWordsId;

                                ///Tem
                                int? temPradeshId = tPradashWordsId;
                                int? temDistrictId = tPleaseTheDistrictWordsId;
                                int? temMuniId = tPleaseMunicipalityWordsId;
                                int? temWard = tPleaseSeletcWardValueWordsId;

                                int jobCId = jobCategoryValueWordId;

                                if (citizenshipNo == '') {
                                  return showCustomSnackBar(
                                      'citizenshipNo', context);
                                }
                                if (dobDateTime == 'YYY/MM/DD') {
                                  return showCustomSnackBar(
                                      'Enter day of birth', context);
                                }
                                int showPemOption = 1;
                                if (isVisibleTopHint) {
                                  showPemOption = 1;
                                } else {
                                  showPemOption = 0;
                                }

                                print(' hgfjsdgjf $jobCId');

                                final data = {
                                  "name": name,
                                  "per_pradesh_id": perPradeshId,
                                  "per_district_id": perDistrictId,
                                  "per_muni_id": perMuniId,
                                  "per_ward": perWard,
                                  "pradesh_id": temPradeshId,
                                  "district_id": temDistrictId,
                                  "muni_id": temMuniId,
                                  "ward": temWard,
                                  "gender": gender,
                                  "mobile": mobile,
                                  "other_skills": otherskillValue,
                                  "dob": dobDateTime,
                                  "citizenship_no": int.parse(citizenshipNo),
                                  "expected_salary": expectedSummons,
                                  "is_pmep": showPemOption,
                                  "preference_job_cat[]": _myActivities,
                                  "ethnicity_type": castValueWordId,
                                  "differently_able": disabledValueWordId,
                                  "migrant_worker": migrantWorkersValueWordId,
                                  "minority_group": minorGroupValueWordId
                                };

                                print('jgkhdfkjghjk $data');

                                if (imagePath != null) {
                                  data['file'] = MultipartFile.fromFileSync(
                                      imagePath!,
                                      filename: imageName);
                                }
                                final formData = FormData.fromMap(data);
                                String? token = "";
                                final box = GetStorage();
                                token = box.read(AppConstants.TOKEN);
                                BaseOptions options = BaseOptions(
                                    baseUrl: Apis.BASE_URL,
                                    headers: {
                                      'Accept': 'application/json',
                                      'Authorization': 'Bearer $token'
                                    });
                                Dio dio = Dio(options);

                                showLoaderDialog(context);
                                var response = await dio.post(
                                  '${Apis.UPDATE_PROFILE}${widget.myProfileModel.data!.id}',
                                  data: formData,
                                  options: Options(
                                      followRedirects: false,
                                      validateStatus: (status) {
                                        return status! <= 500;
                                      }),
                                );

                                print("fdskj   ${response.statusCode}");
                                print("sfdsf  ${response.data}");

                                if (response.statusCode == 200) {
                                  Navigator.pop(context);
                                  showCustomSnackBar('successful', context,
                                      isError: false);
                                  successDialog(AppConstants
                                      .Your_account_is_successful_has_been_created);
                                  Provider.of<MyProfileProvider>(context,
                                          listen: false)
                                      .getMyProfile();
                                } else {
                                  Map map = response.data;
                                  String error = map['message'];
                                  if (map['errors'] != null) {
                                    error = map['errors']['dob'][0];
                                  }
                                  showCustomSnackBar('$error', context);
                                  Navigator.pop(context);
                                }

                                // successDialog(AppConstants.Your_account_is_successful_has_been_created);
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: ColorsResource.WHAIT,
      border: Border.all(
        color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
        width: 1,
      ),
    );
  }

  genderDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                locationProvider.genderValueWord,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: locationProvider.genderValueWord, //add this parameter
              items:
                  locationProvider.genderWord?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem != AppConstants.select_gender
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  if (selectedValue! == 'पुरुष') {
                    locationProvider.setGender(selectedValue, 1);
                  } else if (selectedValue == 'महिला') {
                    locationProvider.setGender(selectedValue, 2);
                  } else if (selectedValue == 'अन्य') {
                    locationProvider.setGender(selectedValue, 3);
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  pleaseStatePradashDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                pleasePradashHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: pleasePradashValueWord, //add this parameter
              items: locationProvider.pradashWords
                  ?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem !=
                                AppConstants.please_state_channuhos
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  pleasePradashValueWord = selectedValue!;
                  pleasePradashHintValueWord = selectedValue;
                  pradashWordsId = locationProvider.pradashWordsIdList![
                      locationProvider.pradashWords!.indexOf(selectedValue)];
                  print('11  ${pradashWordsId}');

                  if (pradashWordsId != 0) {
                    pleaseTheDistrictValueWord =
                        AppConstants.Please_enter_the_district;
                    pleaseTheDistrictHintValueWord =
                        AppConstants.Please_enter_the_district;
                  }
                  locationProvider.getDistricts(pradashWordsId!);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  pleaseEnterTheDistrictDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                pleaseTheDistrictHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: pleaseTheDistrictValueWord, //add this parameter
              items: locationProvider.pleaseTheDistrictWords
                  .map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem !=
                                AppConstants.Please_enter_the_district
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  if (pradashWordsId == 0) {
                    return showCustomSnackBar("select pradesh", context);
                  }

                  if (pleaseTheDistrictWordsId != 0) {
                    pleaseMunicipalityValueWord =
                        AppConstants.Please_be_a_municipality;
                    pleaseMunicipalityHintValueWord =
                        AppConstants.Please_be_a_municipality;
                  }

                  pleaseTheDistrictValueWord = selectedValue!;
                  pleaseTheDistrictHintValueWord = selectedValue;
                  pleaseTheDistrictWordsId =
                      locationProvider.pleaseTheDistrictWordsIdList[
                          locationProvider.pleaseTheDistrictWords
                              .indexOf(selectedValue)];
                  print('222  ${pleaseTheDistrictWordsId}');
                  locationProvider.getMunicipalities(pleaseTheDistrictWordsId!);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  pleaseDeaMunicipalityDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                pleaseMunicipalityHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: pleaseMunicipalityValueWord, //add this parameter
              items: locationProvider.pleaseMunicipalityWords
                  .map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem !=
                                AppConstants.Please_be_a_municipality
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  if (pradashWordsId == 0) {
                    return showCustomSnackBar("select District", context);
                  }
                  pleaseMunicipalityValueWord = selectedValue!;
                  pleaseMunicipalityHintValueWord = selectedValue;

                  print(
                      '333 1 ${locationProvider.pleaseMunicipalityWords.indexOf(selectedValue)}');

                  pleaseMunicipalityWordsId =
                      locationProvider.pleaseMunicipalityWordsIdList[
                          locationProvider.pleaseMunicipalityWords
                              .indexOf(selectedValue)];

                  print('333  ${pleaseMunicipalityWordsId}');
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  pleaseSeletcWardDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                pleaseMunicipalityHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: pleaseSeletcWardValueWord, //add this parameter
              items: locationProvider.pleaseSeletcWardValueWords
                  ?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color:
                            dropDownStringItem != AppConstants.Please_be_a_ward
                                ? ColorsResource.TEXT_BLACK_COLOR
                                : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  pleaseSeletcWardValueWord = selectedValue!;
                  pleaseSeletcWardHintValueWord = selectedValue;
                  pleaseSeletcWardValueWordsId =
                      int.parse(pleaseSeletcWardValueWord);

                  print('fdgfdg 1 $pleaseSeletcWardValueWordsId');
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  tPleasePradashDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                tPleasePradashHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: tPleasePradashValueWord, //add this parameter
              items: locationProvider.pradashWords!
                  .map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem !=
                                AppConstants.please_state_channuhos
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  tPleasePradashValueWord = selectedValue!;
                  tPleasePradashHintValueWord = selectedValue;

                  tPradashWordsId = locationProvider.pradashWordsIdList![
                      locationProvider.pradashWords!.indexOf(selectedValue)];
                  print(' 44 ${tPradashWordsId}');

                  if (tPradashWordsId != 0) {
                    tPleaseTheDistrictValueWord =
                        AppConstants.Please_enter_the_district;
                    tPleaseTheDistrictHintValueWord =
                        AppConstants.Please_enter_the_district;
                    locationProvider.tGetDistricts(tPradashWordsId!);
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  tPleaseEnterTheDistrictDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                tPleaseTheDistrictHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: tPleaseTheDistrictValueWord, //add this parameter
              items: valuefirst
                  ? locationProvider.pleaseTheDistrictWords
                      .map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: GoogleFonts.poppins(
                              fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                              fontSize: Dimensions.BODY_16,
                              color: dropDownStringItem !=
                                      AppConstants.Please_enter_the_district
                                  ? ColorsResource.TEXT_BLACK_COLOR
                                  : ColorsResource.TEXT_GRAY_COLOR),
                        ),
                      );
                    }).toList()
                  : locationProvider.tPleaseTheDistrictWords
                      .map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: GoogleFonts.poppins(
                              fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                              fontSize: Dimensions.BODY_16,
                              color: dropDownStringItem !=
                                      AppConstants.Please_enter_the_district
                                  ? ColorsResource.TEXT_BLACK_COLOR
                                  : ColorsResource.TEXT_GRAY_COLOR),
                        ),
                      );
                    }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  if (tPradashWordsId == 0) {
                    return showCustomSnackBar("select pradesh", context);
                  }
                  tPleaseTheDistrictValueWord = selectedValue!;
                  tPleaseTheDistrictHintValueWord = selectedValue;
                  // tPleaseTheDistrictWordsId = 1;
                  tPleaseTheDistrictWordsId =
                      locationProvider.tPleaseTheDistrictWordsIdList[
                          locationProvider.tPleaseTheDistrictWords
                              .indexOf(selectedValue)];
                  print(' 44 ${tPleaseTheDistrictWordsId}');
                  if (tPleaseTheDistrictWordsId != 0) {
                    tPleaseMunicipalityValueWord =
                        AppConstants.Please_be_a_municipality;
                    tPleaseMunicipalityHintValueWord =
                        AppConstants.Please_be_a_municipality;
                  }

                  locationProvider
                      .tGetMunicipalities(tPleaseTheDistrictWordsId!);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  tPleaseDeaMunicipalityDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                tPleaseMunicipalityHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: tPleaseMunicipalityValueWord, //add this parameter
              items: valuefirst
                  ? locationProvider.pleaseMunicipalityWords
                      .map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: GoogleFonts.poppins(
                              fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                              fontSize: Dimensions.BODY_16,
                              color: dropDownStringItem !=
                                      AppConstants.Please_be_a_municipality
                                  ? ColorsResource.TEXT_BLACK_COLOR
                                  : ColorsResource.TEXT_GRAY_COLOR),
                        ),
                      );
                    }).toList()
                  : locationProvider.tPleaseMunicipalityWords
                      .map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: GoogleFonts.poppins(
                              fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                              fontSize: Dimensions.BODY_16,
                              color: dropDownStringItem !=
                                      AppConstants.Please_be_a_municipality
                                  ? ColorsResource.TEXT_BLACK_COLOR
                                  : ColorsResource.TEXT_GRAY_COLOR),
                        ),
                      );
                    }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  tPleaseMunicipalityValueWord = selectedValue!;
                  tPleaseMunicipalityHintValueWord = selectedValue;
                  tPleaseMunicipalityWordsId =
                      locationProvider.tPleaseMunicipalityWordsIdList[
                          locationProvider.tPleaseMunicipalityWords
                              .indexOf(selectedValue)];
                  print(('555 $tPleaseMunicipalityWordsId'));
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  tPleaseSeletcWardDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                tpleaseSeletcWardHintValueWord!,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: tPleaseSeletcWardValueWord, //add this parameter
              items: locationProvider.pleaseSeletcWardValueWords
                  ?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color:
                            dropDownStringItem != AppConstants.Please_be_a_ward
                                ? ColorsResource.TEXT_BLACK_COLOR
                                : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  tPleaseSeletcWardValueWord = selectedValue!;
                  tpleaseSeletcWardHintValueWord = selectedValue;
                  tPleaseSeletcWardValueWordsId =
                      int.parse(tPleaseSeletcWardValueWord!);

                  print('fdgfdg 2 $tPleaseSeletcWardValueWordsId');
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  ///PEMP
  ethnicityDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style:
                  GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                castHintValueword,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: castValueWord, //add this parameter
              items: locationProvider.castDataListString
                  ?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem != AppConstants.SELECT_CAST
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  castValueWord = selectedValue!;
                  castHintValueword = selectedValue;

                  castValueWordId = locationProvider.castDataListInt![
                      locationProvider.castDataListString!
                          .indexOf(selectedValue)];
                  print('hdsfjhsd $castValueWordId');
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  minorGroupDropdown2() {
    return Container(
      height: 54,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: myBoxDecoration(),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: DropdownButton<String>(
            elevation: 16,
            isExpanded: true,
            style: GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            hint: Text(
              minorGroupHintValueword,
              style: GoogleFonts.poppins(
                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                  fontSize: Dimensions.BODY_16,
                  color: ColorsResource.TEXT_GRAY_COLOR),
            ),
            iconSize: 30,
            value: minorGroupValueWord, //add this parameter
            items: minorGroupklassenword.map((String dropDownStringItem) {
              return DropdownMenuItem(
                value: dropDownStringItem,
                child: Text(
                  dropDownStringItem,
                  style: GoogleFonts.poppins(
                      fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_16,
                      color: dropDownStringItem != AppConstants.SELECT_YES_NO
                          ? ColorsResource.TEXT_BLACK_COLOR
                          : ColorsResource.TEXT_GRAY_COLOR),
                ),
              );
            }).toList(),
            onChanged: (selectedValue) {
              setState(() {
                minorGroupValueWord = selectedValue!;
                minorGroupHintValueword = selectedValue;

                if (selectedValue == 'हो') {
                  minorGroupValueWordId = 1;
                } else if (selectedValue == 'हैन') {
                  minorGroupValueWordId = 0;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  migrantWorkersDropdown() {
    return Container(
      height: 54,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: myBoxDecoration(),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: DropdownButton<String>(
            elevation: 16,
            isExpanded: true,
            style: GoogleFonts.poppins(color: ColorsResource.TEXT_BLACK_COLOR),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            hint: Text(
              migrantWorkersHintValueword,
              style: GoogleFonts.poppins(
                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                  fontSize: Dimensions.BODY_16,
                  color: ColorsResource.TEXT_GRAY_COLOR),
            ),
            iconSize: 30,
            value: migrantWorkersValueWord, //add this parameter
            items: migrantWorkersklassenword.map((String dropDownStringItem) {
              return DropdownMenuItem(
                value: dropDownStringItem,
                child: Text(
                  dropDownStringItem,
                  style: GoogleFonts.poppins(
                      fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_16,
                      color: dropDownStringItem != AppConstants.SELECT_YES_NO
                          ? ColorsResource.TEXT_BLACK_COLOR
                          : ColorsResource.TEXT_GRAY_COLOR),
                ),
              );
            }).toList(),
            onChanged: (selectedValue) {
              setState(() {
                migrantWorkersValueWord = selectedValue!;
                migrantWorkersHintValueword = selectedValue;
                if (selectedValue == 'हो') {
                  migrantWorkersValueWordId = 1;
                } else if (selectedValue == 'हैन') {
                  migrantWorkersValueWordId = 0;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  disabledDropdown() {
    return Container(
      height: 54,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: myBoxDecoration(),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: DropdownButton<String>(
            elevation: 16,
            isExpanded: true,
            style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            hint: Text(
              disabledHintValueword,
              style: GoogleFonts.poppins(
                  fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                  fontSize: Dimensions.BODY_16,
                  color: ColorsResource.TEXT_GRAY_COLOR),
            ),
            iconSize: 30,
            value: disabledValueWord, //add this parameter
            items: disabledklassenword.map((String dropDownStringItem) {
              return DropdownMenuItem(
                value: dropDownStringItem,
                child: Text(
                  dropDownStringItem,
                  style: GoogleFonts.poppins(
                      fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_16,
                      color: dropDownStringItem != AppConstants.SELECT_YES_NO
                          ? ColorsResource.TEXT_BLACK_COLOR
                          : ColorsResource.TEXT_GRAY_COLOR),
                ),
              );
            }).toList(),
            onChanged: (selectedValue) {
              setState(() {
                disabledValueWord = selectedValue!;
                disabledHintValueword = selectedValue;

                if (selectedValue == 'हो') {
                  disabledValueWordId = 1;
                } else if (selectedValue == 'हैन') {
                  disabledValueWordId = 0;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  ///Dialog
  successDialog(String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(3),
                          topLeft: Radius.circular(3),
                        ),
                        color: ColorsResource.WHAIT,
                        border: Border.all(
                          color: ColorsResource.WHAIT,
                          width: 1,
                        ),
                      ),
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onHover: (_) {},
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  CupertinoPageRoute(builder: (context)=>EditMyProfileScreen()), (route) => route.isFirst);
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  AppImages.ic_close,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.BODY_20,
                              color: ColorsResource.TEXT_BLACK_COLOR),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppImages.ic_sucses))
                  ],
                ),
              ));
        });
  }

  jobCategoryDropdown() {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) => Container(
        height: 54,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              elevation: 16,
              isExpanded: true,
              style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              hint: Text(
                jobCategoryHintValueWord,
                style: TextStyle(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: jobCategoryValueWord, //add this parameter
              items: locationProvider.viewAllJobCategoryDataListSting
                  ?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem != AppConstants.Please_stay
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  jobCategoryValueWord = selectedValue!;
                  jobCategoryHintValueWord = selectedValue;
                  jobCategoryValueWordId =
                      locationProvider.viewAllJobCategoryDataListId![
                          locationProvider.viewAllJobCategoryDataListSting!
                              .indexOf(jobCategoryValueWord)];
                  print('sdfsdf  $jobCategoryValueWordId');
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  List? _myActivities = [];
  List? _myActivitiesString = [];

  multipleJobCategoryAdd(MyProfileModel myProfileModel) {
    for (var element in myProfileModel.data!.jobseekerPreferenceCategory!) {
      log(element.categoryName.toString());
    }

    double height = 370;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<LocationProvider>(
                builder: (context, locationProvider, child) => SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(3),
                            topLeft: Radius.circular(3),
                          ),
                          color: ColorsResource.PRAYMERY_COLOR,
                          border: Border.all(
                            color: ColorsResource.PRAYMERY_COLOR,
                            width: 1,
                          ),
                        ),
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'कृपया छन्नुहोस्',
                              style: GoogleFonts.poppins(
                                  color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                  fontSize: Dimensions.BODY_14),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_) {},
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(
                                    AppImages.ic_close,
                                    color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: Container(
                          height: 250,
                          child: SingleChildScrollView(
                            child: MultiSelectFormField(
                              autovalidate: AutovalidateMode.disabled,
                              chipBackGroundColor:
                                  ColorsResource.TEXT_GRAY_COLOR,
                              chipLabelStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              dialogTextStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold),
                              checkBoxActiveColor:
                                  ColorsResource.TEXT_GRAY_COLOR,
                              checkBoxCheckColor: Colors.white,
                              dialogShapeBorder: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              title: Text(
                                'कृपया छन्नुहोस्',
                                style: GoogleFonts.poppins(fontSize: 10),
                              ),
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                              dataSource:
                                  locationProvider.allJobCategoryDataList,
                              textField: 'display',
                              valueField: 'value',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              hintWidget:
                                  const Text('Please choose one or more'),
                              initialValue: _myActivities,
                              onSaved: (value) {
                                if (value == null) return;
                                setState(() {
                                  _myActivities?.clear();
                                  _myActivities = value;

                                  _myActivitiesString?.clear();

                                  _myActivities?.forEach((element) {
                                    String name = locationProvider
                                            .viewAllJobCategoryDataListSting![
                                        locationProvider
                                            .viewAllJobCategoryDataListId!
                                            .indexOf(int.parse(element))];
                                    _myActivitiesString?.add(name);
                                    print(name);
                                  });
                                  print(value);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(
                            AppConstants.save,
                            () {
                              Navigator.of(context).pop();
                            },
                            height: 24,
                            wight: 62,
                            textSize: 10,
                            padding: 2,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  DateTime selectedDate = DateTime.now();
  Future<String> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1910, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }

    print(selectedDate);
    return '${selectedDate}';
  }
}
