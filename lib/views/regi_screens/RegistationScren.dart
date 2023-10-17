import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmiis/provider/AuthProvider.dart';
import 'package:lmiis/utils/AppConstants.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/colors_resource.dart';
import 'package:lmiis/views/home_screens/home_screen.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';

import '../../data/datasource/remote/dio/dio_client.dart';
import '../../models/ResponsModels/caste_model.dart';
import '../../models/SendDataModels/RegistationSendModel.dart';
import '../../provider/LocationProvider.dart';
import '../../utils/Apis.dart';
import '../../utils/dimensions.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custtom_button.dart';
import '../widgets/showCustomSnackBar.dart';

class RegistationScreen extends StatefulWidget {
  const RegistationScreen({Key? key}) : super(key: key);

  @override
  State<RegistationScreen> createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController rePasswordTextEditingController =
      TextEditingController();
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController otherjobTextEditingController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode rePasswordFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode otherJobFocusNode = FocusNode();
  var genderValueWord = AppConstants.select_gender;
  String genderHintValueword = AppConstants.select_gender;
  String castHintValueword = AppConstants.caste;
//  final genderWord = [AppConstants.select_gender, AppConstants.male,AppConstants.female,AppConstants.other];
  int genderId = 0;
  int casetId = 0;
  bool isCasteSelected = false;
  NewCasteModel? newCasteModel;

  var jobCategoryValueWord = AppConstants.Please_stay;
  String jobCategoryHintValueWord = AppConstants.Please_stay;
  int jobCategoryValueWordId = 0;

  var documentTypeValueWord = AppConstants.Select_the_type_of_ID_card;
  String documentTypeHintValueword = AppConstants.Select_the_type_of_ID_card;
  int docType = 0;

  //Permanent
  var pleasePradashValueWord = AppConstants.please_state_channuhos;
  String pleasePradashHintValueWord = AppConstants.please_state_channuhos;
  int pradashWordsId = 0;

  var pleaseTheDistrictValueWord = AppConstants.Please_enter_the_district;
  String pleaseTheDistrictHintValueWord =
      AppConstants.Please_enter_the_district;
  int pleaseTheDistrictWordsId = 0;

  var pleaseMunicipalityValueWord = AppConstants.Please_be_a_municipality;
  String pleaseMunicipalityHintValueWord =
      AppConstants.Please_be_a_municipality;
  int pleaseMunicipalityWordsId = 0;

  var pleaseSeletcWardValueWord = AppConstants.Please_be_a_ward;
  String pleaseSeletcWardHintValueWord = AppConstants.Please_be_a_ward;
  int pleaseSeletcWardValueWordsId = 0;

  //Temporal
  bool valuefirst = false;

  var tPleasePradashValueWord = AppConstants.please_state_channuhos;
  String tPleasePradashHintValueWord = AppConstants.please_state_channuhos;
  int tPradashWordsId = 0;

  var tPleaseTheDistrictValueWord = AppConstants.Please_enter_the_district;
  String tPleaseTheDistrictHintValueWord =
      AppConstants.Please_enter_the_district;
  int tPleaseTheDistrictWordsId = 0;

  var tPleaseMunicipalityValueWord = AppConstants.Please_be_a_municipality;
  String tPleaseMunicipalityHintValueWord =
      AppConstants.Please_be_a_municipality;
  int tPleaseMunicipalityWordsId = 0;

  var tPleaseSeletcWardValueWord = AppConstants.Please_be_a_ward;
  String tpleaseSeletcWardHintValueWord = AppConstants.Please_be_a_ward;
  int tPleaseSeletcWardValueWordsId = 0;
  bool isLoading = true;
  bool obsurePassword = true;
  bool obsureconfrimPassword = true;

  String imageName = '';
  String? imagePath;
  late Future<List<NewCasteModel>> fnewCaste;
  @override
  void initState() {
    fnewCaste = ApiClient().newsCasteList();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<LocationProvider>(context, listen: false).getPradesh();
      // Provider.of<LocationProvider>(context, listen: false).tGetPradesh();
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          return currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorsResource.PRAYMERY_COLOR,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Consumer2<AuthProvider, LocationProvider>(
            builder: (context, authProvider, locationProvider, child) =>
                Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    //Toolbar
                    Row(
                      children: [
                        InkWell(
                            onHover: (_) {},
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SvgPicture.asset(AppImages.ic_back_blue)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 65,
                          child: Text(
                            AppConstants.Register,
                            style: TextStyle(
                                fontSize: Dimensions.BODY_30,
                                fontWeight: Dimensions.FONT_MEDIUM,
                                color: ColorsResource.PRAYMARY_TEXT_COLOR),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),

                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 50),
                      child: Column(
                        children: [
                          // CustomTextFieldWithTitle(AppConstants.NAME,nameTextEditingController,nameFocusNode),
                          CustomTextFieldWithTitle(
                            AppConstants.NAME,
                            nameTextEditingController,
                            nameFocusNode,
                            isShowRequrStar: true,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 0, left: 0, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text(
                                  AppConstants.select_gender,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_14,
                                      color: ColorsResource.TEXT_BLACK_COLOR,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                                Text(
                                  ' *',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_14,
                                      color: ColorsResource.TEXT_READ_COLOR,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                              ],
                            ),
                          ),
                          genderDropdown(),
                          const SizedBox(
                            height: 5,
                          ),

                          CustomTextFieldWithTitle(
                            AppConstants.E_mail,
                            emailTextEditingController,
                            emailFocusNode,
                            isShowRequrStar: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          LoginTextFormFiled(AppConstants.Password,
                              passwordTextEditingController, passwordFocusNode,
                              inputTypePassword: obsurePassword,
                              isShowRequrStar: true,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obsurePassword = !obsurePassword;
                                    });
                                  },
                                  icon: Icon(obsurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility))),
                          const SizedBox(
                            height: 5,
                          ),
                          LoginTextFormFiled(
                              AppConstants.Remember_the_password,
                              rePasswordTextEditingController,
                              rePasswordFocusNode,
                              inputTypePassword: obsureconfrimPassword,
                              isShowRequrStar: true,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obsureconfrimPassword =
                                          !obsureconfrimPassword;
                                    });
                                  },
                                  icon: Icon(obsureconfrimPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility))),
                          const SizedBox(
                            height: 5,
                          ),
                          LoginTextFormFiled(
                            height: 80,
                            AppConstants.Mobile_number,
                            mobileNumberTextEditingController,
                            mobileNumberFocusNode,
                            inputType: AppConstants.PHONE,
                            isShowRequrStar: true,
                            ismaxLenght: true,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 0, left: 0, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Text(
                                  AppConstants.caste,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_14,
                                      color: ColorsResource.TEXT_BLACK_COLOR,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                                Text(
                                  ' *',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: Dimensions.BODY_14,
                                      color: ColorsResource.TEXT_READ_COLOR,
                                      fontWeight:
                                          Dimensions.FONT_MEDIUM_NORMUL),
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder<List<NewCasteModel>>(
                              future: fnewCaste,
                              builder: (context, snap) {
                                if (snap.hasData) {
                                  return Container(
                                    height: 54,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    decoration: myBoxDecoration(),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: DropdownButton<NewCasteModel>(
                                          elevation: 16,
                                          isExpanded: true,
                                          style: GoogleFonts.poppins(
                                              color: ColorsResource
                                                  .TEXT_BLACK_COLOR),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.transparent,
                                          ),
                                          hint: Text(
                                            "$castHintValuewordछान्नुहोस",
                                            style: GoogleFonts.poppins(
                                                fontWeight: Dimensions
                                                    .FONT_MEDIUM_NORMUL,
                                                fontSize: Dimensions.BODY_16,
                                                color: ColorsResource
                                                    .TEXT_GRAY_COLOR),
                                          ),
                                          iconSize: 30,
                                          value:
                                              newCasteModel, //add this parameter
                                          items: snap.data!.map(
                                              (NewCasteModel newcasteModel) {
                                            return DropdownMenuItem(
                                              value: newcasteModel,
                                              child: Text(
                                                newcasteModel.name,
                                                style: TextStyle(
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL,
                                                  fontSize: Dimensions.BODY_16,
                                                  color: isCasteSelected
                                                      ? ColorsResource
                                                          .TEXT_BLACK_COLOR
                                                      : ColorsResource
                                                          .TEXT_GRAY_COLOR,
                                                ),
                                              ),
                                            );
                                          }).toList(),

                                          onChanged: (selectedValue) {
                                            setState(() {
                                              isCasteSelected = true;
                                              newCasteModel = selectedValue;
                                              casetId = newCasteModel!.id;
                                              log(casetId.toString());
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                  //  Container(
                                  //   height: 50,
                                  //   width:
                                  //       MediaQuery.of(context).size.width / 1.1,
                                  //   decoration: myBoxDecoration(),
                                  //   child: Container(
                                  //     margin: const EdgeInsets.only(
                                  //         left: 10, right: 10),
                                  //     child: Align(
                                  //       alignment: Alignment.centerRight,
                                  //       child: DropdownButton<NewCasteModel>(
                                  //         elevation: 16,
                                  //         isExpanded: true,
                                  //         style: GoogleFonts.poppins(
                                  //             color: ColorsResource
                                  //                 .TEXT_BLACK_COLOR),
                                  //         underline: Container(
                                  //           height: 2,
                                  //           color: Colors.transparent,
                                  //         ),
                                  //         hint: Text(
                                  //           "जातियता छान्नुहोस",
                                  //           style: GoogleFonts.poppins(
                                  //               fontWeight: Dimensions
                                  //                   .FONT_MEDIUM_NORMUL,
                                  //               fontSize: Dimensions.BODY_16,
                                  //               color: isCasteSelected
                                  //                   ? ColorsResource
                                  //                       .TEXT_BLACK_COLOR
                                  //                   : ColorsResource
                                  //                       .TEXT_GRAY_COLOR),
                                  //         ),
                                  //         iconSize: 30,
                                  //         value: newCasteModel,
                                  //         //add this parameter
                                  //         items:
                                  // snap.data!.map(
                                  //             (NewCasteModel newcasteModel) {
                                  //           return DropdownMenuItem(
                                  //             value: newcasteModel,
                                  //             child: Text(
                                  //               newcasteModel.name,
                                  //               style: TextStyle(
                                  //                 fontWeight: Dimensions
                                  //                     .FONT_MEDIUM_NORMUL,
                                  //                 fontSize: Dimensions.BODY_16,
                                  //                 color: isCasteSelected
                                  //                     ? ColorsResource
                                  //                         .TEXT_BLACK_COLOR
                                  //                     : ColorsResource
                                  //                         .TEXT_GRAY_COLOR,
                                  //               ),
                                  //             ),
                                  //           );
                                  //         }).toList(),
                                  //         onChanged: (selectedValue) {
                                  //           setState(() {
                                  //             isCasteSelected = true;
                                  //             newCasteModel = selectedValue;
                                  //             casetId = newCasteModel!.id;
                                  //             log(casetId.toString());
                                  //           });
                                  //         },
                                  //       ),
                                  //     ),
                                  //   ),
                                  // );
                                } else {
                                  return Center(
                                    child: Container(),
                                  );
                                }
                              })
                        ],
                      ),
                    ),

                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            AppConstants.Your_area_of_expertise,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: Dimensions.BODY_14,
                                color: ColorsResource.TEXT_BLACK_COLOR,
                                fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                          ),
                        ],
                      ),
                    ),
                    // jobCategoryDropdown(),
                    InkWell(
                      onTap: () {
                        multipleJobCategoryAdd();
                      },
                      child: Container(
                          decoration: myBoxDecoration(),
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          padding: const EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 90,
                                child: RichText(
                                  text: TextSpan(
                                    text: _myActivitiesString.isEmpty
                                        ? 'कृपया छन्नुहोस्'
                                        : '',
                                    style: GoogleFonts.poppins(
                                        fontSize: Dimensions.BODY_14,
                                        color: ColorsResource.TEXT_BLACK_COLOR,
                                        fontWeight:
                                            Dimensions.FONT_MEDIUM_NORMUL),
                                    children: _myActivitiesString.map((e) {
                                      return TextSpan(text: '$e, ');
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              const Icon(Icons.arrow_drop_down),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          )),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: LoginTextFormFiled(
                          AppConstants.enterOtherJobField,
                          otherjobTextEditingController,
                          otherJobFocusNode,
                          isShowRequrStar: false,
                        )),

                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            AppConstants.Identification_card,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: Dimensions.BODY_14,
                                color: ColorsResource.TEXT_BLACK_COLOR,
                                fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: myBoxDecoration(),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? photo = await picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  imageName = photo!.name;
                                  imagePath = photo.path;
                                });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.all(5),
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
                                  style: TextStyle(color: ColorsResource.WHAIT),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(imageName == ''
                                ? 'No file Choose '
                                : imageName),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    documentTypeDropdown(),

                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            AppConstants.Permanent_address,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: Dimensions.FONT_MEDIUM,
                                fontSize: Dimensions.BODY_16,
                                color: ColorsResource.TEXT_BLACK_COLOR),
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
                    ),
                    pleaseStatePradashDropdown(),
                    const SizedBox(
                      height: 10,
                    ),
                    pleaseEnterTheDistrictDropdown(),
                    const SizedBox(
                      height: 10,
                    ),
                    pleaseDeaMunicipalityDropdown(),
                    const SizedBox(
                      height: 10,
                    ),
                    pleaseSeletcWardDropdown(),

                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            AppConstants.Temporary_address,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: Dimensions.FONT_MEDIUM,
                                fontSize: Dimensions.BODY_16,
                                color: ColorsResource.TEXT_BLACK_COLOR),
                          ),
                          Text(
                            ' *',
                            style: TextStyle(
                                fontSize: Dimensions.BODY_16,
                                color: ColorsResource.TEXT_READ_COLOR,
                                fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                          ),
                          Expanded(child: Container()),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  valuefirst = !valuefirst;

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
                              child: Text(
                                AppConstants.Like_permanent,
                                style: const TextStyle(
                                    fontSize: Dimensions.BODY_12),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(right: 16),
                            child: Checkbox(
                              checkColor: ColorsResource.WHAIT,
                              activeColor: ColorsResource.PRAYMARY_TEXT_COLOR,
                              value: valuefirst,
                              onChanged: (value) {
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
                            ),
                          ),
                        ],
                      ),
                    ),

                    tPleasePradashDropdown(),
                    const SizedBox(
                      height: 10,
                    ),
                    tPleaseEnterTheDistrictDropdown(),
                    const SizedBox(
                      height: 10,
                    ),
                    tPleaseDeaMunicipalityDropdown(),
                    const SizedBox(
                      height: 10,
                    ),
                    tPleaseSeletcWardDropdown(),
                    const SizedBox(
                      height: 40,
                    ),

                    CustomButton(AppConstants.Register, () async {
                      String name = nameTextEditingController.text;
                      String email = emailTextEditingController.text;
                      String password = passwordTextEditingController.text;
                      String rePassword = rePasswordTextEditingController.text;
                      String mobileNumber =
                          mobileNumberTextEditingController.text;
                      int gender = genderId;
                      int cast = casetId;
                      String otherJob = otherjobTextEditingController.text;

                      ///Per
                      int perPradeshId = pradashWordsId;
                      int perDistrictId = pleaseTheDistrictWordsId;
                      int perMuniId = pleaseMunicipalityWordsId;
                      int perWard = pleaseSeletcWardValueWordsId;

                      ///Tem
                      int temPradeshId = tPradashWordsId;
                      int temDistrictId = tPleaseTheDistrictWordsId;
                      int temMuniId = tPleaseMunicipalityWordsId;
                      int temWard = tPleaseSeletcWardValueWordsId;

                      if (name == '') {
                        return showCustomSnackBar(
                            'कृपया नाम प्रविष्ट गर्नुहोस्', context);
                      }
                      if (email == '') {
                        return showCustomSnackBar(
                            "कृपया इमेल प्रविष्ट गर्नुहोस्", context);
                      }
                      if (password == '') {
                        return showCustomSnackBar(
                            'कृपया पासवर्ड प्रविष्ट गर्नुहोस्', context);
                      }
                      if (rePassword == '') {
                        return showCustomSnackBar(
                            'कृपया पासवर्ड पुन: प्रविष्ट गर्नुहोस्', context);
                      }
                      // if (mobileNumber == '') {
                      //   return showCustomSnackBar(
                      //       'कृपया आवश्यक फिल्ड भर्नुहोस्', context);
                      // }
                      if (mobileNumber.isEmpty) {
                        showCustomSnackBar(
                            'कृपया मोबाइल नम्बर प्रविष्ट गर्नुहोस्', context);
                        return;
                      }
                      if (mobileNumber.length <= 9) {
                        showCustomSnackBar(
                            "कृपया दस अंक प्रविष्ट गर्नुहोस्", context);
                        return;
                      }
                      if (gender == 0) {
                        return showCustomSnackBar(
                            "कृपया लिङ्ग छान्नुहोस्", context);
                      }
                      if (cast == 0) {
                        return showCustomSnackBar(
                            "कृपया जातियता  छान्नुहोस्", context);
                      }
                      if (perPradeshId == 0) {
                        return showCustomSnackBar(
                            'कृपया आवश्यक फिल्ड भर्नुहोस्', context);
                      }
                      if (perDistrictId == 0) {
                        return showCustomSnackBar(
                            'कृपया आवश्यक फिल्ड भर्नुहोस्', context);
                      }
                      if (perMuniId == 0) {
                        return showCustomSnackBar(
                            'कृपया आवश्यक फिल्ड भर्नुहोस्', context);
                      }
                      if (perWard == 0) {
                        return showCustomSnackBar(
                            'कृपया आवश्यक फिल्ड भर्नुहोस्', context);
                      }

                      if (!valuefirst) {
                        if (temPradeshId == 0) {
                          return showCustomSnackBar('11', context);
                        }
                        if (temDistrictId == 0) {
                          return showCustomSnackBar('12', context);
                        }
                        if (temMuniId == 0) {
                          return showCustomSnackBar('13', context);
                        }
                        if (temWard == 0) {
                          return showCustomSnackBar('14', context);
                        }
                      }

                      print('sdfsdf«  $valuefirst');

                      showLoaderDialog(context);
                      RegistationSendModel registerSendModel;

                      if (valuefirst) {
                        registerSendModel = RegistationSendModel(
                            name: name,
                            email: email,
                            password: password,
                            mobile: int.parse(mobileNumber),
                            passwordConfirmation: rePassword,
                            perPradeshId: perPradeshId,
                            perDistrictId: perDistrictId,
                            perMuniId: perMuniId,
                            perWard: perWard,
                            pradeshId: perPradeshId,
                            districtId: perDistrictId,
                            muniId: perMuniId,
                            ward: perWard,
                            gender: gender);
                      } else {
                        registerSendModel = RegistationSendModel(
                            name: name,
                            email: email,
                            mobile: int.parse(mobileNumber),
                            password: password,
                            passwordConfirmation: rePassword,
                            perPradeshId: perPradeshId,
                            perDistrictId: perDistrictId,
                            perMuniId: perMuniId,
                            perWard: perWard,
                            pradeshId: temPradeshId,
                            districtId: temDistrictId,
                            muniId: temMuniId,
                            ward: temWard,
                            gender: gender,
                            preferenceJobCat: '1');
                      }

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

                      final data = {
                        "name": name,
                        "email": email,
                        "mobile": int.parse(mobileNumber),
                        "password": password,
                        "password_confirmation": rePassword,
                        "per_pradesh_id": perPradeshId,
                        "per_district_id": perDistrictId,
                        "per_muni_id": perMuniId,
                        "per_ward": perWard,
                        "pradesh_id": temPradeshId,
                        "district_id": temDistrictId,
                        "muni_id": temMuniId,
                        "ward": temWard,
                        "preference_job_cat[]": _myActivities,
                        "document_type": docType,
                        "gender": gender,
                        "other_skills": otherJob,
                        "ethnicity_type": cast
                      };
                      if (imagePath != null) {
                        data['document_type_file'] = MultipartFile.fromFileSync(
                            imagePath!,
                            filename: imageName);
                      }
                      final formData = FormData.fromMap(data);

                      print(data.toString());
                      var response = await dio.post(
                        Apis.REGISTER,
                        data: formData,
                        onSendProgress: (int sent, int total) {
                          print(
                              "ppppp ${(sent / total * 100).toStringAsFixed(0)}%  $sent $total");
                          setState(() {
                            print('kjshsd');
                            // Provider.of<OnChangeProgressProvider>(context,listen: false).setCurrentPercent("${(sent / total *100).toStringAsFixed(0)}%");
                          });
                        },
                        options: Options(
                            followRedirects: false,
                            validateStatus: (status) {
                              return status! <= 500;
                            }),
                      );

                      print("fdskj   ${response.statusCode}");
                      print("sfdsf  ${response.data}");

                      if (response.statusCode == 201) {
                        print("sfdsf  ${response.data}");
                        Map map = response.data;
                        String tokens = map['token'];
                        print(tokens);

                        showCustomSnackBar('successful', context,
                            isError: false);
                        box.write(AppConstants.USER_EMAIL, email);
                        box.write(AppConstants.USER_PASSWORD, password);
                        box.write(AppConstants.TOKEN, tokens);
                        Navigator.of(context).pop();
                        successDialog(AppConstants.register_success);
                      } else {
                        print("sfdsf  ${response.data}");
                        Map map = response.data;
                        String error = map['message'];
                        String errorTyp = map['errors']['email'].toString();
                        String errorTyp2 = map['errors']['phone'].toString();
                        showCustomSnackBar(
                            '$error \n $errorTyp \n $errorTyp2', context);
                        Navigator.of(context).pop();
                      }

                      // authProvider.register(registerSendModel).then((value) {
                      //   if(value.isSuccess){
                      //     showCustomSnackBar(value.message,context,isError: false);
                      //     //successDialog(AppConstants.register_success);
                      //   }else{
                      //     showCustomSnackBar(value.message,context);
                      //   }
                      // });
                    }),
                  ],
                ),
              ),
            ),
          ),
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
                genderHintValueword,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: genderValueWord, //add this parameter
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
                  genderId = locationProvider.genderDataInt!.indexOf(
                      locationProvider.genderWord!.indexOf(selectedValue!));
                  genderValueWord = selectedValue;
                  genderHintValueword = selectedValue;

                  print("$genderId");
                });
              },
            ),
          ),
        ),
      ),
    );
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
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  documentTypeDropdown() {
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
                documentTypeHintValueword,
                style: GoogleFonts.poppins(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: documentTypeValueWord, //add this parameter
              items: locationProvider.documentTypeDataListS
                  ?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: GoogleFonts.poppins(
                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                        fontSize: Dimensions.BODY_16,
                        color: dropDownStringItem !=
                                AppConstants.Select_the_type_of_ID_card
                            ? ColorsResource.TEXT_BLACK_COLOR
                            : ColorsResource.TEXT_GRAY_COLOR),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  documentTypeValueWord = selectedValue!;
                  documentTypeHintValueword = selectedValue;

                  docType = locationProvider.documentTypeDataListId![
                      locationProvider.documentTypeDataListS!
                          .indexOf(documentTypeValueWord)];
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
                pleasePradashHintValueWord,
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
                  print('11  $pradashWordsId');

                  if (pradashWordsId != 0) {
                    pleaseTheDistrictValueWord =
                        AppConstants.Please_enter_the_district;
                    pleaseTheDistrictHintValueWord =
                        AppConstants.Please_enter_the_district;
                  }
                  locationProvider.getDistricts(pradashWordsId);
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
                pleaseTheDistrictHintValueWord,
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
                  print('222  $pleaseTheDistrictWordsId');
                  locationProvider.getMunicipalities(pleaseTheDistrictWordsId);
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
                pleaseMunicipalityHintValueWord,
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

                  print('333  $pleaseMunicipalityWordsId');
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
                pleaseMunicipalityHintValueWord,
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
                tPleasePradashHintValueWord,
                style: TextStyle(
                    fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,
                    color: ColorsResource.TEXT_GRAY_COLOR),
              ),
              iconSize: 30,
              value: tPleasePradashValueWord, //add this parameter
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
                  tPleasePradashValueWord = selectedValue!;
                  tPleasePradashHintValueWord = selectedValue;

                  tPradashWordsId = locationProvider.pradashWordsIdList![
                      locationProvider.pradashWords!.indexOf(selectedValue)];
                  print(' 44 $tPradashWordsId');

                  if (tPradashWordsId != 0) {
                    tPleaseTheDistrictValueWord =
                        AppConstants.Please_enter_the_district;
                    tPleaseTheDistrictHintValueWord =
                        AppConstants.Please_enter_the_district;
                    locationProvider.tGetDistricts(tPradashWordsId);
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
                tPleaseTheDistrictHintValueWord,
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
                  print(' 44 $tPleaseTheDistrictWordsId');
                  if (tPleaseTheDistrictWordsId != 0) {
                    tPleaseMunicipalityValueWord =
                        AppConstants.Please_be_a_municipality;
                    tPleaseMunicipalityHintValueWord =
                        AppConstants.Please_be_a_municipality;
                  }

                  locationProvider
                      .tGetMunicipalities(tPleaseTheDistrictWordsId);
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
                tPleaseMunicipalityHintValueWord,
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
                tpleaseSeletcWardHintValueWord,
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
                      int.parse(tPleaseSeletcWardValueWord);

                  print('fdgfdg 2 $tPleaseSeletcWardValueWordsId');
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  successDialog(String title) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)), //this right here
              child: SizedBox(
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
                              Navigator.of(context).pop();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const HomeScreen()),
                                  (Route<dynamic> route) => false);
                            },
                            child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  AppImages.ic_close,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: Dimensions.BODY_20,
                                  color: ColorsResource.TEXT_BLACK_COLOR),
                            ))),
                    const SizedBox(
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

  List? _myActivities = [];
  final List _myActivitiesString = [];

  multipleJobCategoryAdd() {
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
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'कृपया छन्नुहोस्',
                              style: TextStyle(
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
                                  margin: const EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(
                                    AppImages.ic_close,
                                    color: ColorsResource.PRAYMARY_TEXT_COLOR,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: SizedBox(
                          height: 250,
                          child: SingleChildScrollView(
                            child: MultiSelectFormField(
                              autovalidate: AutovalidateMode.disabled,
                              chipBackGroundColor:
                                  ColorsResource.TEXT_GRAY_COLOR,
                              chipLabelStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              dialogTextStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              checkBoxActiveColor:
                                  ColorsResource.TEXT_GRAY_COLOR,
                              checkBoxCheckColor: Colors.white,
                              dialogShapeBorder: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              title: const Text(
                                'कृपया छन्नुहोस्',
                                style: TextStyle(fontSize: 10),
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
                                  _myActivities = value;

                                  _myActivities?.forEach((element) {
                                    String name = locationProvider
                                            .viewAllJobCategoryDataListSting![
                                        locationProvider
                                            .viewAllJobCategoryDataListId!
                                            .indexOf(int.parse(element))];
                                    _myActivitiesString.add(name);
                                    print(name);
                                  });
                                  print(value);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
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
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
