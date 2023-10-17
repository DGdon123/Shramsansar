import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmiis/views/my_profile_screens/EditFullProfile.dart';
import 'package:lmiis/views/widgets/custtom_button.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';



import '../../models/ResponsModels/MyProfileModel.dart';
import '../../models/ResponsModels/SocialNameModel.dart';
import '../../models/SendDataModels/SendSocialAccount.dart';
import '../../models/SendDataModels/profile/AboutMeModelSend.dart';
import '../../models/SendDataModels/profile/AddEducationModel.dart';
import '../../provider/LocationProvider.dart';
import '../../provider/MyProfileProvider.dart';
import '../../utils/Apis.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/showCustomSnackBar.dart';
import 'edite_profile_widgets/EducationItem.dart';
import 'edite_profile_widgets/ExperinceItem.dart';
import 'edite_profile_widgets/LanguageItem.dart';
import 'edite_profile_widgets/PlaceOfEmployment.dart';
import 'edite_profile_widgets/SocialMediaAccount.dart';
import 'edite_profile_widgets/TraningItem.dart';

class EditMyProfileScreen extends StatefulWidget {
  const EditMyProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditMyProfileScreen> createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {


  List? _myActivities;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _myActivities = [];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MyProfileProvider>(context,listen: false).getMyProfile();
      Provider.of<MyProfileProvider>(context,listen: false).getSkills();
      Provider.of<MyProfileProvider>(context,listen: false).getSocial();

      Provider.of<MyProfileProvider>(context,listen: false).getPradesh();
      Provider.of<MyProfileProvider>(context,listen: false).getDistricts();
      Provider.of<MyProfileProvider>(context,listen: false).getMunicipalities();

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
      body: Consumer<MyProfileProvider>(
        builder: (context,myProfileProvider,child) =>
        Stack(
         children: [
    
           Positioned(
             top: 0,
             left: 0,
             right: 0,
             bottom: 10,
             child: ListView(
               shrinkWrap: true,
               padding: EdgeInsets.zero,
               children:[
                 Container(
                   margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                   child: Column(
                     children: [
                       Container(
                         width: MediaQuery.of(context).size.width,
                         height: 210,
                         margin: EdgeInsets.only(top: 10),
                         padding: EdgeInsets.only(bottom: 4),
                         decoration: BoxDecoration(
                           borderRadius: const BorderRadius.only(
                               topRight: Radius.circular(5),
                               topLeft: Radius.circular(5),
                               bottomLeft: Radius.circular(5),
                               bottomRight: Radius.circular(5)
                           ),
                           color: ColorsResource.PROFILE_GRAY_COLOR,
                           border: Border.all(
                             color: ColorsResource.PROFILE_GRAY_COLOR,
                             width: 1,
                           ),
                         ),
                         child: Stack(
                           children: [
                             Positioned(
                               top: 0,
                               left: 0,
                               right: 0,
                               child: Column(
                                 children: [
                                   SizedBox(height: 10,),
                                   Container(
                                     height: 100,
                                     width: 100,
                                     child: myProfileProvider.myProfileModel?.data?.file != null ?  CachedNetworkImage(imageUrl:'${Apis.IMAGE_URL}${myProfileProvider.myProfileModel?.data?.file}',   placeholder: (context, url) => Image.asset(AppImages.ic_demo_person), errorWidget: (context, url, error) => Image.asset(AppImages.ic_demo_person),): Image.asset(AppImages.ic_demo_person),
                                   ),
                                   SizedBox(height: 10,),
                                   Text('${myProfileProvider.myProfileModel?.data?.name}',
                                     style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM,fontSize: Dimensions.BODY_20,color: ColorsResource.TEXT_BLACK_COLOR),),
                                   SizedBox(height: 10,),
                                   Container(
                                     margin: EdgeInsets.only(left: 10,right: 10),
                                     child: Row(
                                       children: [
                                         SizedBox(width: 10,),
                                         Row(
                                           children: [
                                             SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,),
                                             SizedBox(width:10,),
                                             Container(
                                               width: 120,
                                               child: Text(
                                                      '${myProfileProvider.myProfileModel?.data?.perDistrictName},'
                                                     '${myProfileProvider.myProfileModel?.data?.perMuniName},'
                                                     '${myProfileProvider.myProfileModel?.data?.ward}'
                                                 ,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),),
                                             )
                                           ],
                                         ),
                                         Expanded(child: Container()),
                                         Row(
                                           children: [
                                             SvgPicture.asset(AppImages.ic_email,color: ColorsResource.TEXT_BLACK_COLOR,),
                                             SizedBox(width:10,),
                                             Text('${myProfileProvider.myProfileModel?.data?.email},',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                                           ],
                                         ),
                                         Expanded(child: Container()),
                                         Row(
                                           children: [
                                             SvgPicture.asset(AppImages.ic_call,color: ColorsResource.TEXT_BLACK_COLOR,),
                                             const SizedBox(width:10,),
                                             Text('${myProfileProvider.myProfileModel?.data?.mobile}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                                           ],
                                         )
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             ),
                             Positioned(
                                 right: 10,
                                 top: 0,
                                 child: GestureDetector(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => EditFullProfile(myProfileProvider.myProfileModel!) ));
                                   },
                                 
                                   child: Container(
                                     margin: EdgeInsets.only(right: 10,top: 10),
                                     width: 26,
                                     height: 26,
                                     child: SvgPicture.asset(AppImages.ic_edite_full,color: ColorsResource.PRAYMARY_TEXT_COLOR,),
                                   ),
                                 )
                             )
                           ],
                         ),
                       ),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const SizedBox(height: 10,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.about_yourself,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                               ],
                             ),
                           ),
                           SizedBox(height: 10,),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Expanded(
                                 flex: 9,
                                 child: Container(margin: EdgeInsets.only(left: 10,right: 10),
                                     child: Text(
                                       '${myProfileProvider.aboutYourself?.description}',
                                       style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR),
                                     )
                                 ),

                               ),
                               Expanded(
                                   flex: 1,
                                   child: Column(
                                     children: [
                                       InkWell(
                                         onTap: (){
                                           aboutYourSelfDialog(AppConstants.about_yourself,'${myProfileProvider.aboutYourself?.description}');
                                         },
                                         child: Container(
                                           margin: EdgeInsets.only(top: 10),
                                           width: 15,
                                           height: 15,
                                           child: SvgPicture.asset(AppImages.ic_edite_full),
                                         ),
                                       ),
                                     ],
                                   )
                               ),
                             ],
                           ),

                           ///Education
                           SizedBox(height: 20,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.education1,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                                 InkWell(
                                     onTap: (){
                                       addEducationDialog(AppConstants.Add_education,false);
                                     },
                                     child: SvgPicture.asset(AppImages.ic_add_plus)),

                                 SizedBox(width: 10,)
                               ],
                             ),
                           ),

                           //TODO:Education section
                           Container(
                             margin: EdgeInsets.only(left: 00),
                             width: MediaQuery.of(context).size.width,
                             height: (myProfileProvider.educations?.length)! * 110,
                             child: ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               itemCount: myProfileProvider.educations?.length,
                               itemBuilder: (BuildContext context, int index) {
                                 Educations education = myProfileProvider.educations![index];
                                 return EducationItem(education,(){

                                   showLoaderDialog(context);

                                   Provider.of<MyProfileProvider>(context,listen: false).getEducationLevel().then((value) {
                                     if(value.isSuccess){
                                       Navigator.of(context).pop();
                                       updateAddEducationDialog(AppConstants.Add_education_edit,true,education);
                                     }else{

                                     }
                                   });


                                 },(){
                                   showLoaderDialog(context);
                                   myProfileProvider.deleteEducation(education.id!).then((value) {
                                     if(value.isSuccess){
                                       Navigator.of(context).pop();
                                       myProfileProvider.getMyProfile();
                                     }else{

                                     }
                                   });

                                 });
                               },
                             ),
                           ),

                           // EducationItem((){
                           //   addEducationDialog(AppConstants.Add_education_edit,true);
                           // },(){
                           //   showToast('click on delte button');
                           // }),

                           ///Experince
                           SizedBox(height: 20,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.Experience1,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                                 InkWell(
                                     onTap:(){
                                       addExperienceDialog(AppConstants.Add_experience,false);
                                     },
                                     onHover:(_){},
                                     child: SvgPicture.asset(AppImages.ic_add_plus))
                                 ,SizedBox(width: 10,)
                               ],
                             ),
                           ),

                           //TODO: add Experiences
                           Container(
                             width: MediaQuery.of(context).size.width,
                             height: (myProfileProvider.experiences?.length)! * 110,
                             child: ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               itemCount: myProfileProvider.experiences?.length,
                               itemBuilder: (BuildContext context, int index) {
                                 Experiences experiences = myProfileProvider.experiences![index];

                                 return ExperinceItem(experiences,(){
                                   updateExperienceDialog(AppConstants.Add_experience_edit,true,experiences);


                                 },(){
                                   showLoaderDialog(context);
                                   myProfileProvider.deleteExperience(experiences.id!).then((value) {
                                     Navigator.of(context).pop();

                                     if(value.isSuccess){
                                       myProfileProvider.getMyProfile();
                                       showCustomSnackBar(value.message, context,isError: false);
                                     }else{
                                       showCustomSnackBar(value.message, context,isError: false);
                                     }
                                   });
                                 });
                               },
                             ),
                           ),

                           // ExperinceItem((){
                           //   addExperienceDialog(AppConstants.Add_experience_edit,true);
                           // },(){
                           //   showToast('click on delete button');
                           // }),


                           ///Traning
                          //  SizedBox(height: 20,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.Training_Trainings,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                                 InkWell(
                                     onTap:(){
                                       myProfileProvider.setStartDateTraining('yyyy/mm/dd');
                                       myProfileProvider.setImageInfoTraining('', '');
                                       addTrainingDialog(AppConstants.Add_Training_Trainings,false);
                                     },
                                     onHover:(_){

                                     },
                                     child: SvgPicture.asset(AppImages.ic_add_plus))
                                 ,SizedBox(width: 10,)
                               ],
                             ),
                           ),

                           Container(
                             width: MediaQuery.of(context).size.width,
                             height: (myProfileProvider.trainings?.length)! * 110,
                             child: ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               itemCount: myProfileProvider.trainings?.length,
                               itemBuilder: (BuildContext context, int index) {
                                 Trainings trainings = myProfileProvider.trainings![index];
                                 return TraningItem(trainings,(){
                                   myProfileProvider.setStartDateTraining('yyyy/mm/dd');
                                   myProfileProvider.setImageInfoTraining('', '');
                                   updateTrainingDialog(AppConstants.Add_Training_Trainings_edit,true,trainings);
                                 },(){
                                   showLoaderDialog(context);
                                   myProfileProvider.deleteTraning(trainings.id!).then((value) {
                                     if(value.isSuccess){
                                       myProfileProvider.getMyProfile();
                                       Navigator.of(context).pop();
                                     }else{
                                       Navigator.of(context).pop();
                                     }
                                   });

                                   showToast('click on delete button');
                                 });
                               },
                             ),
                           ),
                           // TraningItem((){
                           //   addTrainingDialog(AppConstants.Add_Training_Trainings_edit,true);
                           // },(){
                           //   showToast('click on delete button');
                           // }),

                           ///skills
                           SizedBox(height: 20,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.skills,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                                 InkWell(
                                   onTap: (){
                                     addSkill(AppConstants.addSkillDi,true);
                                   },
                                     onHover: (_){},
                                     child: SvgPicture.asset(AppImages.ic_add_plus))
                                 ,SizedBox(width: 10,)
                               ],
                             ),
                           ),

                           Row (
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Expanded(
                                 flex: 9,
                                 child: Column(
                                   children: [
                                     SizedBox(height: 10,),
                                     Container(
                                       margin: EdgeInsets.only(left: 10),
                                       child: Row(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           Container(
                                             width: MediaQuery.of(context).size.width - 115,
                                             child: Wrap(
                                               spacing: 10,
                                               children: myProfileProvider.skills!.map((chip) => Chip(
                                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                                 key: ValueKey(chip.id!),
                                                 label: Text(chip.skillName!,style: TextStyle(color: ColorsResource.WHAIT),),
                                                 backgroundColor: ColorsResource.TEXT_GRAY_COLOR,
                                                 padding:  EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                                               )).toList(),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),


                                   ],
                                 ),
                               ),

                               Expanded(
                                   flex: 2,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       SizedBox(width: 10,),
                                       Container(
                                         margin: EdgeInsets.only(top: 10),
                                         width: 15,
                                         height: 15,
                                         child: InkWell(
                                           onTap: (){

                                             //TODO: update chips
                                             updateSkills(AppConstants.addSkillDi_edit,false);

                                           },
                                             child: SvgPicture.asset(AppImages.ic_edite_full)),
                                       ),
                                       SizedBox(width: 10,),
                                     ],
                                   ))
                             ],
                           ),

                           ///Language
                           SizedBox(height: 20,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.Language,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                                 InkWell(
                                     onTap:(){
                                       addLanguagesDialog(AppConstants.Add_languages,false);
                                     },
                                     onHover:(_){},
                                     child: SvgPicture.asset(AppImages.ic_add_plus))
                                 ,SizedBox(width: 10,)
                               ],
                             ),
                           ),


                           Container(
                             width: MediaQuery.of(context).size.width,
                             height: (myProfileProvider.languages?.length)! * 90,
                             child: ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               itemCount: myProfileProvider.languages?.length,
                               itemBuilder: (BuildContext context, int index) {
                                 Languages languages = myProfileProvider.languages![index];
                                 return LanguageItem(languages,(){
                                   updateLanguagesDialog(AppConstants.Add_languages_edit,true,languages);
                                 },(){
                                   showLoaderDialog(context);
                                   myProfileProvider.deleteLanguage(languages.id!).then((value) {
                                     if(value.isSuccess){
                                       Navigator.of(context).pop();
                                       myProfileProvider.getMyProfile();
                                     }else{
                                       Navigator.of(context).pop();
                                     }
                                   });

                                   showToast('click on delete button');
                                 });
                               },
                             ),
                           ),


                           ///place_of_employment
                           SizedBox(height: 20,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.place_of_employment,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                                 InkWell(
                                     onTap:(){
                                       addEmploymentLocationDialog(AppConstants.Choose_a_job_location,false);
                                     },
                                     onHover:(_){},

                                     child: SvgPicture.asset(AppImages.ic_add_plus))
                                 ,SizedBox(width: 10,)
                               ],
                             ),
                           ),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             height: (myProfileProvider.locations?.length)! * 100,
                             child: ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               itemCount: myProfileProvider.locations?.length,
                               itemBuilder: (BuildContext context, int index) {
                                 Locations locations = myProfileProvider.locations![index];
                                 return PlaceOfEmployment(locations,(){
                                   updateEmploymentLocationDialog(AppConstants.Choose_a_job_location_edit,true,locations);
                                 },(){

                                   showLoaderDialog(context);
                                   myProfileProvider.deleteLocation(locations.id!).then((value) {
                                     if(value.isSuccess){
                                       Navigator.of(context).pop();
                                       myProfileProvider.getMyProfile();
                                     }else{
                                       Navigator.of(context).pop();
                                     }
                                   });
                                 });
                               },
                             ),
                           ),



                           ///social_media_account
                           SizedBox(height: 20,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.social_media_account,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                                 InkWell(
                                     onTap:(){
                                       addASocialMediaAccountDialog(AppConstants.Add_a_social_media_account,myProfileProvider.socialNameDataLst);
                                     },
                                     onHover:(_){},
                                     child: SvgPicture.asset(AppImages.ic_add_plus))
                                 ,SizedBox(width: 10,)
                               ],
                             ),
                           ),

                           Container(
                             width: MediaQuery.of(context).size.width,
                             height: (myProfileProvider.socialAccounts?.length)! * 35,
                             child: ListView.builder(
                               physics: NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               itemCount: myProfileProvider.socialAccounts?.length,
                               itemBuilder: (BuildContext context, int index) {
                                 SocialAccounts socialAccounts = myProfileProvider.socialAccounts![index];
                                 return SocialMediaAccount(socialAccounts,(){
                                   showLoaderDialog(context);
                                   myProfileProvider.deleteSocial('${socialAccounts.id}').then((value) {
                                     Navigator.of(context).pop();
                                     myProfileProvider.getMyProfile();
                                   });

                                 });
                               },
                             ),
                           ),

                           ///specialization
                           const SizedBox(height: 10,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             color: ColorsResource.PRAYMARY_TEXT_COLOR,
                             padding: EdgeInsets.all(4),
                             child: Row(
                               children: [
                                 Text(AppConstants.Expertise,
                                   style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                 ),
                                 Expanded(child: Container()),
                               ],
                             ),
                           ),
                           SizedBox(height: 20,),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Expanded(
                                 flex: 9,
                                 child: Container(margin: EdgeInsets.only(left: 10,right: 10),
                                     child: Text(
                                       '${myProfileProvider.specialization?.specialization}',
                                       style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR),
                                     )
                                 ),

                               ),
                               Expanded(
                                   flex: 1,
                                   child: Column(
                                     children: [
                                       InkWell(
                                         onTap:(){
                                           addSpecializationDialog(AppConstants.Add_expertise);
                                         },
                                         onHover: (_){

                                         },
                                         child: Container(
                                           margin: EdgeInsets.only(top: 10),
                                           width: 15,
                                           height: 15,
                                           child: InkWell(
                                             onHover: (_){},
                                               onTap: (){
                                               if('${myProfileProvider.specialization?.specialization}' == ''){
                                                 return ;
                                               }
                                                 updateSpecializationDialog(AppConstants.Add_expertise,'${myProfileProvider.specialization?.specialization}');
                                               },
                                               child: SvgPicture.asset(AppImages.ic_edite_full)),
                                         ),
                                       ),
                                     ],
                                   )
                               ),
                             ],
                           ),


                         ],

                       )

                     ],
                   ),
                 )
               ],
             ),
           ),
         ],
        ),
      ),
    );
  }

  ///Edit Bio
  aboutYourSelfDialog(String title,String data){
    const maxLines = 10;
    double height = 250;
    return showDialog(
        context: context,
        builder: (BuildContext context) {

          TextEditingController detailsController = TextEditingController();

          detailsController.text = data;
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Container(
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
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
                          SizedBox(width: 10,),
                          Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                          Expanded(child: Container()),
                          InkWell(
                            onHover: (_){},
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 100,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: TextField(
                          controller: detailsController,
                          maxLines: maxLines,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: const OutlineInputBorder(),
                            labelStyle: new TextStyle(color: Colors.green),

                            hintText: "Enter a message",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                    ),
                    Expanded(child: Container()),
                    Consumer<MyProfileProvider>(
                      builder: (context,myProfileProvider,child) =>
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){

                            String aboutMe = detailsController.text;

                            AboutMeModelSend aboutMeModelSend = AboutMeModelSend(aboutMe:aboutMe );
                            myProfileProvider.postAboutMe(aboutMeModelSend).then((value) {
                              if(value.isSuccess){
                                showCustomSnackBar(value.message,context,isError: false);
                                Navigator.of(context).pop();
                                myProfileProvider.getMyProfile();
                                successDialog(AppConstants.About_yourself_has_been_successfully_divulged);
                              }else{
                                showCustomSnackBar(value.message,context);
                              }
                            });
                           //
                          },height: 24,wight: 62,textSize: 10,padding: 2,),
                          SizedBox(width: 10,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              )
          );
        }
    );
  }

  ///Add education
  addEducationDialog(String title,bool isEdit){
    double height = 330;
    TextEditingController programTextEditingController = TextEditingController();
    TextEditingController passingDateTextEditingController = TextEditingController();
    TextEditingController boardOfEducationTextEditingController = TextEditingController();
    TextEditingController institutionTextEditingController = TextEditingController();
    TextEditingController marksObtainedTextEditingController = TextEditingController();

    FocusNode levelFocusNode = FocusNode();
    FocusNode passingDateFocusNode = FocusNode();
    FocusNode boardOfEducationFocusNode = FocusNode();
    FocusNode institutionFocusNode = FocusNode();
    FocusNode marksObtainedFocusNode = FocusNode();


    Provider.of<MyProfileProvider>(context,listen: false).setEducationLavelDrobTitle(AppConstants.please_state_channuhos, AppConstants.please_state_channuhos,0);
    Provider.of<MyProfileProvider>(context,listen: false).getEducationLevel();
    Provider.of<MyProfileProvider>(context,listen: false).setPassingDate('mm/dd/yyyy');



    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: SizedBox(
                height: height,
                child: Consumer<MyProfileProvider>(
                  builder: (context,myProfileProvider,child) =>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
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
                            SizedBox(width: 10,),
                            Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_){},
                              onTap: (){
                                Navigator.of(context).pop();

                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                            )
                          ],
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 95,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                AppConstants.Level,
                                                style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(
                                                ' *',
                                                style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                            ],
                                          ),
                                          educationLevelDropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomTextFieldWithTitle(
                                      AppConstants.board_of_Education,
                                      boardOfEducationTextEditingController,
                                      boardOfEducationFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:8),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: CustomTextFieldWithTitle(
                                          AppConstants.Program1,
                                          programTextEditingController,
                                          levelFocusNode,
                                          isShowRequrStar: true,
                                          height: 50,isPadding:false,paddingDouble:7)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomTextFieldWithTitle(
                                      AppConstants.Institution,
                                      institutionTextEditingController,
                                      institutionFocusNode,
                                      isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:7),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  AppConstants.exam_passing_year,
                                                  style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                Text(' *',
                                                  style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: ()async{
                                                // var results = await showCalendarDatePicker2Dialog(
                                                //   context: context,
                                                //   config: CalendarDatePicker2WithActionButtonsConfig(),
                                                //   dialogSize: const Size(325, 400),
                                                // );
                                                //
                                                //
                                                //
                                                //
                                                //
                                                // print(results![0]);
                                                // setState(() {
                                                //   if(results[0] != ''){
                                                //     String date = '${results[0]}';
                                                //     int idx = date.indexOf(" ");
                                                //     List parts = [date.substring(0,idx).trim(), date.substring(idx+1).trim()];
                                                //     print(parts[0]);
                                                //     String  travelStartDate = '${parts[0]}';
                                                //     myProfileProvider.setPassingDate(travelStartDate);
                                                //   }
                                                // });

                                                _selectDate(context).then((results) {
                                                  if(results != null){
                                                    final values = results.split(' ');
                                                    String dobDateTime = '${values[0]}';

                                                    setState((){
                                                      myProfileProvider.setPassingDate(dobDateTime);
                                                    });

                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 32,
                                                decoration: myBoxDecoration(),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text( '${myProfileProvider.passingDate}',
                                                    textAlign: TextAlign.center,),
                                                ),
                                              ),
                                            )
                                          ],

                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: CustomTextFieldWithTitle(
                                          AppConstants.marks_obtained,
                                          marksObtainedTextEditingController,
                                          marksObtainedFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:8),
                                    ),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),

                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){
                            String program = programTextEditingController.text;
                            String board = boardOfEducationTextEditingController.text;
                            String institution = institutionTextEditingController.text;
                            String marksObtained = marksObtainedTextEditingController.text;
                            int selecteLevel = myProfileProvider.educationLevelHintValuewordId;
                            String passingYear = myProfileProvider.passingDate;

                            if(program == ''){
                              return showCustomSnackBar('1',context);
                            }if(board == ''){
                              return showCustomSnackBar('2',context);
                            }if(institution == ''){
                              return showCustomSnackBar('3',context);
                            }if(marksObtained == ''){
                              return showCustomSnackBar('4',context);
                            }if(selecteLevel == 0){
                              return showCustomSnackBar('5',context);
                            }if(passingYear == 'mm/dd/yyyy'){
                              return showCustomSnackBar('6',context);
                            }

                            AddEducationModel addEducationModel  = AddEducationModel(
                              board: board,
                              institute: institution,
                              levelId: '$selecteLevel',
                              marksSecured: marksObtained,
                              graduationYear: passingYear,
                              program: program,
                            );
                            showCustomSnackBar('Education adding',context,isError: false);

                            myProfileProvider.postEducation(addEducationModel).then((value){
                              if(value.isSuccess){
                                Navigator.of(context).pop();
                                showCustomSnackBar(value.message,context,isError: false);
                                myProfileProvider.getMyProfile();
                                isEdit ? successDialog(AppConstants.Education_has_been_added_successfully_edit) : successDialog(AppConstants.Education_has_been_added_successfully);

                              }else{
                                showCustomSnackBar(value.message,context);
                              }
                            });




                          },height: 24,wight: 62,textSize: 10,padding: 2,),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }
  updateAddEducationDialog(String title,bool isEdit,Educations education){
    double height = 320;
    TextEditingController programTextEditingController = TextEditingController();
    TextEditingController boardOfEducationTextEditingController = TextEditingController();
    TextEditingController institutionTextEditingController = TextEditingController();
    TextEditingController marksObtainedTextEditingController = TextEditingController();

    FocusNode levelFocusNode = FocusNode();
    FocusNode boardOfEducationFocusNode = FocusNode();
    FocusNode institutionFocusNode = FocusNode();
    FocusNode marksObtainedFocusNode = FocusNode();

    Provider.of<MyProfileProvider>(context,listen: false).getEducationLevelName(education.id!);
    Provider.of<MyProfileProvider>(context,listen: false).setPassingDate(education.graduationYear!);

    return showDialog(
        context: context,
        builder: (BuildContext context) {

          programTextEditingController.text = education.program!;
          boardOfEducationTextEditingController.text = education.board!;
          institutionTextEditingController.text = education.institute!;
          marksObtainedTextEditingController.text = education.marksSecured!;

          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: SizedBox(
                height: height,
                child: Consumer<MyProfileProvider>(
                  builder: (context,myProfileProvider,child) =>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
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
                                SizedBox(width: 10,),
                                Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                                Expanded(child: Container()),
                                InkWell(
                                  onHover: (_){},
                                  onTap: (){
                                    Navigator.of(context).pop();

                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                                )
                              ],
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: height - 100,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    AppConstants.Level,
                                                    style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                  Text(
                                                    ' *',
                                                    style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                ],
                                              ),
                                              educationLevelDropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CustomTextFieldWithTitle(
                                          AppConstants.board_of_Education,
                                          boardOfEducationTextEditingController,
                                          boardOfEducationFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:8),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: CustomTextFieldWithTitle(
                                              AppConstants.Program1,
                                              programTextEditingController,
                                              levelFocusNode,
                                              isShowRequrStar: true,
                                              height: 50,isPadding:false,paddingDouble:7)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CustomTextFieldWithTitle(
                                          AppConstants.Institution,
                                          institutionTextEditingController,
                                          institutionFocusNode,
                                          isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:7),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Container(
                                            margin: EdgeInsets.only(right: 5),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      AppConstants.exam_passing_year,
                                                      style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                    Text(' *',
                                                      style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: ()async{




                                                    // var results = await showCalendarDatePicker2Dialog(
                                                    //   context: context,
                                                    //   config: CalendarDatePicker2WithActionButtonsConfig(),
                                                    //   dialogSize: const Size(325, 400),
                                                    // );
                                                    //
                                                    // print(results![0]);
                                                    // setState(() {
                                                    //   if(results[0] != ''){
                                                    //     String date = '${results[0]}';
                                                    //     int idx = date.indexOf(" ");
                                                    //     List parts = [date.substring(0,idx).trim(), date.substring(idx+1).trim()];
                                                    //     print(parts[0]);
                                                    //     String  travelStartDate = '${parts[0]}';
                                                    //     myProfileProvider.setPassingDate(travelStartDate);
                                                    //   }
                                                    // });

                                                    _selectDate(context).then((results) {
                                                      if(results != null){
                                                        final values = results.split(' ');
                                                        setState((){
                                                          myProfileProvider.setPassingDate('${values[0]}');
                                                        });
                                                      }
                                                    });



                                                  },
                                                  child: Container(
                                                    height: 32,
                                                    decoration: myBoxDecoration(),
                                                    child: Align(
                                                      alignment: Alignment.center,
                                                      child: Text( '${myProfileProvider.passingDate}',
                                                        textAlign: TextAlign.center,),
                                                    ),
                                                  ),
                                                )
                                              ],

                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: CustomTextFieldWithTitle(
                                              AppConstants.marks_obtained,
                                              marksObtainedTextEditingController,
                                              marksObtainedFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:8),
                                        ),
                                      ),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),

                          Expanded(child: Container()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Container()),
                              CustomButton(AppConstants.save,(){
                                String program = programTextEditingController.text;
                                String board = boardOfEducationTextEditingController.text;
                                String institution = institutionTextEditingController.text;
                                String marksObtained = marksObtainedTextEditingController.text;
                                int selecteLevel = myProfileProvider.educationLevelHintValuewordId;
                                String passingYear = myProfileProvider.passingDate;

                                if(program == ''){
                                  return showCustomSnackBar(AppConstants.Program1,context);
                                }if(board == ''){
                                  return showCustomSnackBar(AppConstants.board_of_Education,context);
                                }if(institution == ''){
                                  return showCustomSnackBar(AppConstants.Institution,context);
                                }if(marksObtained == ''){
                                  return showCustomSnackBar(AppConstants.marks_obtained,context);
                                }if(selecteLevel == 0){
                                  return showCustomSnackBar('Select level',context);
                                }if(passingYear == 'mm/dd/yyyy'){
                                  return showCustomSnackBar('Passing Year',context);
                                }

                                AddEducationModel addEducationModel  = AddEducationModel(
                                  board: board,
                                  institute: institution,
                                  levelId: '$selecteLevel',
                                  marksSecured: marksObtained,
                                  graduationYear: passingYear,
                                  program: program,
                                );
                                showCustomSnackBar('Education adding',context,isError: false);

                                myProfileProvider.updateEducation(education.id!,addEducationModel).then((value){
                                  if(value.isSuccess){
                                    Navigator.of(context).pop();
                                    showCustomSnackBar(value.message,context,isError: false);
                                    myProfileProvider.getMyProfile();
                                    isEdit ? successDialog(AppConstants.Education_has_been_added_successfully_edit) : successDialog(AppConstants.Education_has_been_added_successfully);

                                  }else{
                                    showCustomSnackBar(value.message,context);
                                  }
                                });




                              },height: 24,wight: 62,textSize: 10,padding: 2,),
                              const SizedBox(width: 10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                ),
              )
          );
        }
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
  educationLevelDropdown(){
    return Consumer<MyProfileProvider>(
      builder: (context,myProfileProvider,child) =>
      Container(
        height: 33,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(myProfileProvider.educationLevelHintValueword,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: myProfileProvider.educationLevelValueWord, //add this parameter
              items: myProfileProvider.educationLevelDataListS?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != AppConstants.please_state_channuhos? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  int educationLevelHintValuewordId = myProfileProvider.educationLevelDataListId![myProfileProvider.educationLevelDataListS!.indexOf(selectedValue!)];
                  myProfileProvider.setEducationLavelDrobTitle(selectedValue, selectedValue,educationLevelHintValuewordId);

                });
              },
            ),
          ),
        ),
      ),
    );
  }


  ///Add Experience
  addExperienceDialog(String title,bool isEdit){
    double height = 520;

    TextEditingController jobTitleTextEditingController = TextEditingController();
    TextEditingController nameOfTheInstitutionTextEditingController = TextEditingController();
    TextEditingController referenceContactNumberTextEditingController = TextEditingController();
    TextEditingController addressTextEditingController = TextEditingController();
    TextEditingController referenceNameTextEditingController = TextEditingController();


    FocusNode referenceNameFocusNode = FocusNode();
    FocusNode jobTitleFocusNode = FocusNode();
    FocusNode nameOfTheInstitutionFocusNode = FocusNode();
    FocusNode referenceContactNumberFocusNode = FocusNode();
    FocusNode addressFocusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: SizedBox(
                height: height,
                child: Consumer<MyProfileProvider>(
                  builder: (context,myProfileProvider,child) =>
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
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
                            SizedBox(width: 10,),
                            Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_){},
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 100,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: CustomTextFieldWithTitle(AppConstants.Job_title,
                                        jobTitleTextEditingController,
                                        jobTitleFocusNode,
                                        isShowRequrStar: true,
                                        height: 50,isPadding: false,paddingDouble:10,)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(

                                      margin: EdgeInsets.only(right: 5),
                                      child: CustomTextFieldWithTitle(
                                        AppConstants.Name_of_the_institution,
                                        nameOfTheInstitutionTextEditingController,
                                        nameOfTheInstitutionFocusNode,
                                        isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomTextFieldWithTitle(
                                    AppConstants.address,
                                    addressTextEditingController,
                                    addressFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.Currently_working1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL),),
                                              Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                                            ],
                                          ),
                                          InkWell(
                                            onTap: (){

                                              _selectDate(context).then((results) {
                                                if(results != null){
                                                  final values = results.split(' ');
                                                  String  dobDateTime = '${values[0]}';
                                                  myProfileProvider.setStartDateEx(dobDateTime);
                                                }
                                              });

                                              // showDate(context).then((value) {
                                              //   myProfileProvider.setStartDateEx(value);
                                              // });
                                            },
                                            child: Container(
                                              height: 35,
                                              decoration: myBoxDecoration(),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(left: 4),
                                                      child: Text('${myProfileProvider.startDateExperience}')),
                                                  Expanded(child: Container()),
                                                  Container(
                                                      width: 20,
                                                      height: 20,
                                                      margin: EdgeInsets.only(right: 5),
                                                      child: SvgPicture.asset(AppImages.ic_calender))

                                                ],

                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap:(){
                                      myProfileProvider.setCurrentWorkingEx(!myProfileProvider.currentlyWorking);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10,),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            child: Transform.scale(
                                              scale: 0.6,
                                              child: Checkbox(
                                                value: myProfileProvider.currentlyWorking,
                                                onChanged: (bool? value) {
                                                  print('fhjgjdhg');
                                                  setState(() {
                                                    myProfileProvider.setCurrentWorkingEx(value!) ;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text(AppConstants.Currently_working,
                                            style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: !myProfileProvider.currentlyWorking ? Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.end_date,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL),),
                                            //  Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                                            ],
                                          ),


                                          InkWell(
                                            onTap: (){

                                              _selectDate(context).then((results) {
                                                if(results != null){
                                                  final values = results.split(' ');
                                                  String  dobDateTime = '${values[0]}';
                                                  myProfileProvider.setEndDateEx(dobDateTime);
                                                }
                                              });

                                              // showDate(context).then((value) {
                                              //   myProfileProvider.setEndDateEx(value);
                                              // });
                                            },
                                            child: Container(
                                              height: 35,
                                              decoration: myBoxDecoration(),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(left: 4),
                                                      child: Text('${myProfileProvider.endDateExperience}')),
                                                  Expanded(child: Container()),
                                                  Container(
                                                      width: 20,
                                                      height: 20,
                                                      margin: EdgeInsets.only(right: 5),
                                                      child: SvgPicture.asset(AppImages.ic_calender))

                                                ],

                                              ),
                                            ),
                                          )
                                        ],
                                      )) : Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: CustomTextFieldWithTitle(
                                        AppConstants.reference_name,
                                        referenceNameTextEditingController,
                                        referenceNameFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomTextFieldWithTitle(
                                    AppConstants.Reference_Contact_No,
                                    referenceContactNumberTextEditingController,
                                    referenceContactNumberFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,inputType:AppConstants.PHONE),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(AppConstants.Experience_Certificate,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                    SizedBox(width: 5,),
                                  ],
                                ),
                                Container(
                                  decoration: myBoxDecoration(),
                                  width: 180,
                                  height: 35,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () async{
                                            final ImagePicker _picker = ImagePicker();
                                            final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                                            setState(() {
                                              myProfileProvider.setImageInfoEx(photo!.name, photo.path);
                                              myProfileProvider.isClickOnImageP(true);
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(left: 10,right: 10),
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              color: ColorsResource.TEXT_GRAY_COLOR,
                                              border: Border.all(
                                                color: ColorsResource.TEXT_GRAY_COLOR,
                                                width: 1,
                                              ),
                                            ),
                                            child: Text(' Choose File',style: TextStyle(color:ColorsResource.WHAIT,fontSize: Dimensions.BODY_10),),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text('${myProfileProvider.imageNameEx}',style: TextStyle(fontSize: Dimensions.BODY_10),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){
                           // Navigator.of(context).pop();

                            String title =  jobTitleTextEditingController.text;
                            String nameOfTheInstitution =  nameOfTheInstitutionTextEditingController.text;
                            String referenceContactNumber =  referenceContactNumberTextEditingController.text;
                            String address =  addressTextEditingController.text;
                            String referenceName =  referenceNameTextEditingController.text;

                            String imageName= myProfileProvider.imageNameEx;
                            String imagePath= myProfileProvider.imagePathEx;

                            String startDate= myProfileProvider.startDateExperience;
                            String endDate= myProfileProvider.endDateExperience;


                            int checkCurrentWorking = 0;
                            if(myProfileProvider.currentlyWorking){
                              checkCurrentWorking = 1;

                            }else{
                              checkCurrentWorking = 0;
                            }


                            if(title == ''){
                              return showCustomSnackBar('title',context);
                            } if(nameOfTheInstitution == ''){
                              return showCustomSnackBar('Name Of The Institution',context);
                            } if(referenceContactNumber == ''){
                              return showCustomSnackBar('Reference Contact Number',context);
                            } if(address == ''){
                              return showCustomSnackBar('address',context);
                            } if(referenceName == ''){
                              return showCustomSnackBar('referenceName',context);
                            } if(startDate == 'yyyy/mm/dd'){
                              return showCustomSnackBar('startDate',context);
                            }
                            final data ;
                            if(endDate == 'yyyy/mm/dd' ){
                              data = {
                                "title": title,
                                "organization": nameOfTheInstitution,
                                "start_date": startDate,
                                "reference_name": referenceName,
                                "reference_contact": int.parse(referenceContactNumber),
                                "is_currently_working": checkCurrentWorking,
                                "location": address,
                              };
                            }else{
                              data = {
                                "title": title,
                                "organization": nameOfTheInstitution,
                                "start_date": startDate,
                                "reference_name": referenceName,
                                "reference_contact": int.parse(referenceContactNumber),
                                "end_date": endDate,
                                "is_currently_working": checkCurrentWorking,
                                "location": address,
                              };
                            }


                            print('click');

                            if(myProfileProvider.isClickOnImage){
                              if (imagePath != '') {
                                data['file'] = MultipartFile.fromFileSync(imagePath, filename: imageName);
                              }
                            }

                            final formData = FormData.fromMap(data);
                            showLoaderDialog(context);


                            myProfileProvider.postExperice(formData).then((value) {
                              if(value.isSuccess){
                                Navigator.of(context).pop();
                                showCustomSnackBar(value.message, context,isError: false);
                                myProfileProvider.getMyProfile();
                                Navigator.of(context).pop();
                                isEdit ? successDialog(AppConstants.Experience_has_been_added_successfully_edite) : successDialog(AppConstants.Experience_has_been_added_successfully);

                              }else{
                                Navigator.of(context).pop();
                                showCustomSnackBar(value.message, context);
                              }
                            });



                          },height: 34,wight: 82,textSize: 10,padding: 2,),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  updateExperienceDialog(String title,bool isEdit,Experiences experiences){
    double height = 510;

    TextEditingController jobTitleTextEditingController = TextEditingController();
    TextEditingController nameOfTheInstitutionTextEditingController = TextEditingController();
    TextEditingController referenceContactNumberTextEditingController = TextEditingController();
    TextEditingController addressTextEditingController = TextEditingController();
    TextEditingController referenceNameTextEditingController = TextEditingController();


    FocusNode referenceNameFocusNode = FocusNode();
    FocusNode jobTitleFocusNode = FocusNode();
    FocusNode nameOfTheInstitutionFocusNode = FocusNode();
    FocusNode referenceContactNumberFocusNode = FocusNode();
    FocusNode addressFocusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (BuildContext context) {

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            var myProfileOb =  Provider.of<MyProfileProvider>(context,listen: false);

            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              jobTitleTextEditingController.text = experiences.title!;
              nameOfTheInstitutionTextEditingController.text = experiences.organization!;
              referenceContactNumberTextEditingController.text =experiences.referenceContact!;
              addressTextEditingController.text =experiences.location!;
              referenceNameTextEditingController.text =experiences.referenceContact!;

              print('fgfdgfd ${experiences.isCurrentlyWorking}');


            });

            if(experiences.file != null){
              String fileName = experiences.file!.split('/').last;
              myProfileOb.setImageInfoEx(fileName, experiences.file!);
            }

            myProfileOb.setStartDateEx(experiences.startDate!);
            if(experiences.endDate != null){
              myProfileOb.setStartDateEx(experiences.endDate!);
            }

            if(experiences.isCurrentlyWorking == 0){
              myProfileOb.setCurrentWorkingEx(false);
            }else{
              myProfileOb.setCurrentWorkingEx(true);
            }

          });



          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: SizedBox(
                height: height,
                child: Consumer<MyProfileProvider>(
                  builder: (context,myProfileProvider,child) =>
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
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
                                SizedBox(width: 10,),
                                Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                                Expanded(child: Container()),
                                InkWell(
                                  onHover: (_){},
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: height - 100,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: CustomTextFieldWithTitle(AppConstants.Job_title,
                                            jobTitleTextEditingController,
                                            jobTitleFocusNode,
                                            isShowRequrStar: true,
                                            height: 50,isPadding: false,paddingDouble:10,)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(

                                          margin: EdgeInsets.only(right: 5),
                                          child: CustomTextFieldWithTitle(
                                            AppConstants.Name_of_the_institution,
                                            nameOfTheInstitutionTextEditingController,
                                            nameOfTheInstitutionFocusNode,
                                            isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CustomTextFieldWithTitle(
                                        AppConstants.address,
                                        addressTextEditingController,
                                        addressFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.Currently_working1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL),),
                                                  Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                                                ],
                                              ),
                                              InkWell(
                                                onTap: (){


                                                  _selectDate(context).then((results) {
                                                    if(results != null){
                                                      final values = results.split(' ');
                                                      String  dobDateTime = '${values[0]}';
                                                      myProfileProvider.setStartDateEx(dobDateTime);
                                                    }
                                                  });

                                                  // showDate(context).then((value) {
                                                  //   myProfileProvider.setStartDateEx(value);
                                                  // });
                                                },
                                                child: Container(
                                                  height: 35,
                                                  decoration: myBoxDecoration(),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          margin: EdgeInsets.only(left: 4),
                                                          child: Text('${myProfileProvider.startDateExperience}')),
                                                      Expanded(child: Container()),
                                                      Container(
                                                          width: 20,
                                                          height: 20,
                                                          margin: EdgeInsets.only(right: 5),
                                                          child: SvgPicture.asset(AppImages.ic_calender))

                                                    ],

                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap:(){
                                          myProfileProvider.setCurrentWorkingEx(!myProfileProvider.currentlyWorking);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 10,),
                                              Container(
                                                height: 10,
                                                width: 10,
                                                child: Transform.scale(
                                                  scale: 0.6,
                                                  child: Checkbox(
                                                    value: myProfileProvider.currentlyWorking,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        print('fhjgjdhg');
                                                        myProfileProvider.setCurrentWorkingEx(value!) ;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Text(AppConstants.Currently_working,
                                                style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: !myProfileProvider.currentlyWorking ? Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.end_date,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL),),
                                                 // Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                                                ],
                                              ),


                                              InkWell(
                                                onTap: (){

                                                  _selectDate(context).then((results) {
                                                    if(results != null){
                                                      final values = results.split(' ');
                                                      String  dobDateTime = '${values[0]}';
                                                      myProfileProvider.setEndDateEx(dobDateTime);
                                                    }
                                                  });

                                                  // showDate(context).then((value) {
                                                  //   myProfileProvider.setEndDateEx(value);
                                                  // });
                                                },
                                                child: Container(
                                                  height: 35,
                                                  decoration: myBoxDecoration(),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          margin: EdgeInsets.only(left: 4),
                                                          child: Text('${myProfileProvider.endDateExperience}')),
                                                      Expanded(child: Container()),
                                                      Container(
                                                          width: 20,
                                                          height: 20,
                                                          margin: EdgeInsets.only(right: 5),
                                                          child: SvgPicture.asset(AppImages.ic_calender))

                                                    ],

                                                  ),
                                                ),
                                              )
                                            ],
                                          )) : Container(),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: CustomTextFieldWithTitle(
                                            AppConstants.reference_name,
                                            referenceNameTextEditingController,
                                            referenceNameFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CustomTextFieldWithTitle(
                                        AppConstants.Reference_Contact_No,
                                        referenceContactNumberTextEditingController,
                                        referenceContactNumberFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble:10,),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(AppConstants.Experience_Certificate,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                        SizedBox(width: 5,),
                                      ],
                                    ),
                                    Container(
                                      decoration: myBoxDecoration(),
                                      width: 180,
                                      height: 35,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () async{
                                                final ImagePicker _picker = ImagePicker();
                                                final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                                                setState(() {

                                                  myProfileProvider.setImageInfoEx(photo!.name, photo.path);
                                                  myProfileProvider.isClickOnImageP(true);

                                                });
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(left: 10,right: 10),
                                                padding: EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  color: ColorsResource.TEXT_GRAY_COLOR,
                                                  border: Border.all(
                                                    color: ColorsResource.TEXT_GRAY_COLOR,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Text(' Choose File',style: TextStyle(color:ColorsResource.WHAIT,fontSize: Dimensions.BODY_10),),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text('${myProfileProvider.imageNameEx}',style: TextStyle(fontSize: Dimensions.BODY_10),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          Expanded(child: Container()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Container()),
                              CustomButton(AppConstants.save,(){
                                // Navigator.of(context).pop();

                                String title =  jobTitleTextEditingController.text;
                                String nameOfTheInstitution =  nameOfTheInstitutionTextEditingController.text;
                                String referenceContactNumber =  referenceContactNumberTextEditingController.text;
                                String address =  addressTextEditingController.text;
                                String referenceName =  referenceNameTextEditingController.text;

                                String imageName= myProfileProvider.imageNameEx;
                                String imagePath= myProfileProvider.imagePathEx;

                                String startDate = myProfileProvider.startDateExperience;
                                String endDate= myProfileProvider.endDateExperience;


                                int checkCurrentWorking = 0;
                                if(myProfileProvider.currentlyWorking){
                                  checkCurrentWorking = 1;
                                }else{
                                  checkCurrentWorking = 0;
                                }


                                if(title == ''){
                                  return showCustomSnackBar('title',context);
                                } if(nameOfTheInstitution == ''){
                                  return showCustomSnackBar('Name Of The Institution',context);
                                } if(referenceContactNumber == ''){
                                  return showCustomSnackBar('Reference Contact Number',context);
                                } if(address == ''){
                                  return showCustomSnackBar('address',context);
                                } if(referenceName == ''){
                                  return showCustomSnackBar('referenceName',context);
                                } if(startDate == 'yyyy/mm/dd'){
                                  return showCustomSnackBar('startDate',context);
                                }
                                final data ;

                                if(endDate == 'yyyy/mm/dd' ){
                                  data = {
                                    "title": title,
                                    "organization": nameOfTheInstitution,
                                    "start_date": startDate,
                                    "reference_name": referenceName,
                                    "reference_contact": int.parse(referenceContactNumber),
                                    "is_currently_working": checkCurrentWorking,
                                    "location": address,
                                  };
                                }else{
                                  data = {
                                    "title": title,
                                    "organization": nameOfTheInstitution,
                                    "start_date": startDate,
                                    "reference_name": referenceName,
                                    "reference_contact": int.parse(referenceContactNumber),
                                    "end_date": endDate,
                                    "is_currently_working": checkCurrentWorking,
                                    "location": address,
                                  };
                                }

                                print('skdsgjgfskhgf');

                                if(myProfileProvider.isClickOnImage){
                                  if (imagePath != null) {
                                    data['file'] = MultipartFile.fromFileSync(imagePath, filename: imageName);
                                  }
                                }

                                final formData = FormData.fromMap(data);

                                showLoaderDialog(context);

                                myProfileProvider.updateExperience(formData).then((value) {
                                  if(value.isSuccess){
                                    Navigator.of(context).pop();
                                    showCustomSnackBar(value.message, context,isError: false);
                                    myProfileProvider.getMyProfile();
                                    Navigator.of(context).pop();
                                    isEdit ? successDialog(AppConstants.Experience_has_been_added_successfully_edite) : successDialog(AppConstants.Experience_has_been_added_successfully);

                                  }else{
                                    Navigator.of(context).pop();
                                    showCustomSnackBar(value.message, context);
                                  }
                                });



                              },height: 24,wight: 62,textSize: 10,padding: 2,),
                              const SizedBox(width: 10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                ),
              )
          );
        }
    );
  }




  ///Add Training
  addTrainingDialog(String title,bool isEdit){
    double height = 530;
    const maxLines = 6;
    TextEditingController trainingTitleTextEditingController = TextEditingController();
    TextEditingController periodTextEditingController = TextEditingController();
    TextEditingController detailsTextEditingController = TextEditingController();
    TextEditingController trainingTextEditingController = TextEditingController();



    FocusNode trainingTitleFocusNode = FocusNode();
    FocusNode periodFocusNode = FocusNode();
    FocusNode boardOfEducationFocusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>
                SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
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
                            SizedBox(width: 10,),
                            Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_){},
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 100,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: CustomTextFieldWithTitle(
                                        AppConstants.Training_title,
                                        trainingTitleTextEditingController,
                                        trainingTitleFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(

                                      child: CustomTextFieldWithTitle(
                                        AppConstants.Training1,
                                        trainingTextEditingController,
                                        boardOfEducationFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      height: 75,

                                      margin: EdgeInsets.only(right: 5),
                                      child: CustomTextFieldWithTitle(
                                        AppConstants.period,
                                        periodTextEditingController,
                                        periodFocusNode,
                                        isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 75,

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(AppConstants.Experience_Certificate1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                            SizedBox(width: 5,),
                                         //   Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)

                                          ],
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            final ImagePicker _picker = ImagePicker();
                                            final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                                            setState(() {
                                              myProfileProvider.setImageInfoTraining(photo!.name, photo.path);
                                            });

                                          },
                                          child: Container(
                                            decoration: myBoxDecoration(),
                                            width: 180,
                                            height: 33,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 3,right: 3),
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(3),
                                                      color: ColorsResource.TEXT_GRAY_COLOR,
                                                      border: Border.all(
                                                        color: ColorsResource.TEXT_GRAY_COLOR,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Text('Choose File',style: TextStyle(color:ColorsResource.WHAIT,fontSize: Dimensions.BODY_10),),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text('${myProfileProvider.imageNameTraining}',style: TextStyle(fontSize: Dimensions.BODY_10),),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.start_date1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL),),
                                              Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () async {



                                              _selectDate(context).then((results) {
                                                if(results != null){
                                                  final values = results.split(' ');
                                                  String  dobDateTime = '${values[0]}';
                                                  myProfileProvider.setStartDateTraining(dobDateTime);
                                                }
                                              });

                                              // showDate(context).then((value) {
                                              //   myProfileProvider.setStartDateTraining(value);
                                              // });
                                            },
                                            child: Container(
                                              height: 35,
                                              decoration: myBoxDecoration(),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(left: 4),
                                                      child: Text('${myProfileProvider.startDateTraining}')),
                                                  Expanded(child: Container()),
                                                  Container(
                                                      width: 20,
                                                      height: 20,
                                                      margin: EdgeInsets.only(right: 5),
                                                      child: SvgPicture.asset(AppImages.ic_calender))

                                                ],

                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text(AppConstants.Description1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                SizedBox(width: 5,),
                                Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              width: MediaQuery.of(context).size.width,
                              height: 180 ,
                              child: TextField(
                                maxLines: maxLines,
                                controller: detailsTextEditingController,
                                decoration: InputDecoration(
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                  ),
                                  border:  OutlineInputBorder(),
                                  labelStyle:  TextStyle(color: Colors.green),

                                  hintText: "Enter a message",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){


                            String trainingTitle =  trainingTitleTextEditingController.text;
                            String period =  periodTextEditingController.text;
                            String details =  detailsTextEditingController.text;
                            String training =  trainingTextEditingController.text;

                            String imageName= myProfileProvider.imageNameTraining;
                            String imagePath = myProfileProvider.imagePathTraining;

                            String startDate = myProfileProvider.startDateTraining;


                            if(trainingTitle == ''){
                              return showCustomSnackBar('training Title',context);
                            } if(period == ''){
                              return showCustomSnackBar('period',context);
                            } if(details == ''){
                              return showCustomSnackBar('details',context);
                            } if(training == ''){
                              return showCustomSnackBar('training',context);
                            }if(startDate == 'yyyy/mm/dd'){
                              return showCustomSnackBar('startDate',context);
                            }


                            Map<String, dynamic> data = {
                              "title":trainingTitle,
                              "provider":training,
                              "duration":period,
                              "year":startDate,
                              "details":details,
                            };

                            print('shdgf  $imagePath');

                            if (imagePath != null) {
                              if(imagePath != ''){
                                data['file'] = MultipartFile.fromFileSync(imagePath, filename: imageName);
                              }

                            }
                            final formData = FormData.fromMap(data);
                            showLoaderDialog(context);

                            myProfileProvider.postTraning(formData).then((value) {
                              if(value.isSuccess){
                                Navigator.of(context).pop();
                                showCustomSnackBar(value.message, context,isError: false);
                                Navigator.of(context).pop();

                                isEdit ? successDialog(AppConstants.Training_Trainings_have_been_successfully_added_edit)
                                    : successDialog(AppConstants.Training_Trainings_have_been_successfully_added);
                               myProfileProvider.getMyProfile();
                              }else{
                                showCustomSnackBar(value.message, context);
                              }


                            });

                          },height: 24,wight: 62,textSize: 10,padding: 2,),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }
  updateTrainingDialog(String title,bool isEdit,Trainings trainings){
    double height = 510;
    const maxLines = 6;
    TextEditingController trainingTitleTextEditingController = TextEditingController();
    TextEditingController periodTextEditingController = TextEditingController();
    TextEditingController detailsTextEditingController = TextEditingController();
    TextEditingController trainingTextEditingController = TextEditingController();



    FocusNode trainingTitleFocusNode = FocusNode();
    FocusNode periodFocusNode = FocusNode();
    FocusNode boardOfEducationFocusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            trainingTitleTextEditingController.text = trainings.title!;
            periodTextEditingController.text = trainings.duration!;
            detailsTextEditingController.text = trainings.details!;
            trainingTextEditingController.text = trainings.provider!;
            Provider.of<MyProfileProvider>(context,listen: false).setStartDateTraining(trainings.year!);

            if(trainings.file != null){
              String fileName = trainings.file!.split('/').last;
              Provider.of<MyProfileProvider>(context,listen: false).setImageInfoTraining(fileName, trainings.file);
            }

           // String file =  Provider.of<MyProfileProvider>(context,listen: false).setImageInfoTraining(trainings.file!);


          });
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>
                    SizedBox(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
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
                                SizedBox(width: 10,),
                                Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                                Expanded(child: Container()),
                                InkWell(
                                  onHover: (_){},
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: height - 100,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: CustomTextFieldWithTitle(
                                            AppConstants.Training_title,
                                            trainingTitleTextEditingController,
                                            trainingTitleFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(

                                          child: CustomTextFieldWithTitle(
                                            AppConstants.Training1,
                                            trainingTextEditingController,
                                            boardOfEducationFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          height: 75,

                                          margin: EdgeInsets.only(right: 5),
                                          child: CustomTextFieldWithTitle(
                                            AppConstants.period,
                                            periodTextEditingController,
                                            periodFocusNode,
                                            isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 75,

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.Experience_Certificate1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                                  SizedBox(width: 5,),
                                                  //   Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)

                                                ],
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  final ImagePicker _picker = ImagePicker();
                                                  final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                                                  setState(() {
                                                    myProfileProvider.setImageInfoTraining(photo!.name, photo.path);
                                                  });

                                                },
                                                child: Container(
                                                  decoration: myBoxDecoration(),
                                                  width: 180,
                                                  height: 33,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          margin: EdgeInsets.only(left: 3,right: 3),
                                                          padding: EdgeInsets.all(3),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(3),
                                                            color: ColorsResource.TEXT_GRAY_COLOR,
                                                            border: Border.all(
                                                              color: ColorsResource.TEXT_GRAY_COLOR,
                                                              width: 1,
                                                            ),
                                                          ),
                                                          child: Text('Choose File',style: TextStyle(color:ColorsResource.WHAIT,fontSize: Dimensions.BODY_10),),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text('${myProfileProvider.imageNameTraining}',style: TextStyle(fontSize: Dimensions.BODY_10),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.start_date1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL),),
                                                  Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                                                ],
                                              ),
                                              InkWell(
                                                onTap: (){


                                                  _selectDate(context).then((results) {
                                                    if(results != null){
                                                      final values = results.split(' ');
                                                     String  dobDateTime = '${values[0]}';
                                                      myProfileProvider.setStartDateTraining(dobDateTime);
                                                    }
                                                  });

                                                  // showDate(context).then((value) {
                                                  //   myProfileProvider.setStartDateTraining(value);
                                                  // });
                                                },
                                                child: Container(
                                                  height: 35,
                                                  decoration: myBoxDecoration(),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          margin: EdgeInsets.only(left: 4),
                                                          child: Text('${myProfileProvider.startDateTraining}')),
                                                      Expanded(child: Container()),
                                                      Container(
                                                          width: 20,
                                                          height: 20,
                                                          margin: EdgeInsets.only(right: 5),
                                                          child: SvgPicture.asset(AppImages.ic_calender))

                                                    ],

                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                      ),
                                    ),
                                  ],
                                ),


                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text(AppConstants.Description1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                    SizedBox(width: 5,),
                                    Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color:ColorsResource.TEXT_READ_COLOR ,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),)
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  width: MediaQuery.of(context).size.width,
                                  height: 180 ,
                                  child: TextField(
                                    maxLines: maxLines,
                                    controller: detailsTextEditingController,
                                    decoration: const InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                        borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                      ),
                                      border:  OutlineInputBorder(),
                                      labelStyle:  TextStyle(color: Colors.green),

                                      hintText: "Enter a message",
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Container()),
                              CustomButton(AppConstants.save,(){


                                String trainingTitle =  trainingTitleTextEditingController.text;
                                String period =  periodTextEditingController.text;
                                String details =  detailsTextEditingController.text;
                                String training =  trainingTextEditingController.text;

                                String imageName= myProfileProvider.imageNameTraining;
                                String imagePath = myProfileProvider.imagePathTraining;

                                String startDate = myProfileProvider.startDateTraining;


                                if(trainingTitle == ''){
                                  return showCustomSnackBar(AppConstants.Training_title,context);
                                } if(period == ''){
                                  return showCustomSnackBar(AppConstants.period,context);
                                } if(details == ''){
                                  return showCustomSnackBar(AppConstants.Description1,context);
                                } if(training == ''){
                                  return showCustomSnackBar(AppConstants.Training1,context);
                                }if(startDate == 'yyyy/mm/dd'){
                                  return showCustomSnackBar('Select date',context);
                                }


                                Map<String, dynamic> data = {
                                  "title":trainingTitle,
                                  "provider":training,
                                  "duration":period,
                                  "year":startDate,
                                  "details":details,
                                };
                                if (imagePath != null) {
                                  if(imagePath != '' && !imagePath.contains('/training/')){
                                    data['file'] = MultipartFile.fromFileSync(imagePath, filename: imageName);
                                  }
                                }
                                final formData = FormData.fromMap(data);
                                showLoaderDialog(context);

                                myProfileProvider.updateTraning(trainings.id!,formData).then((value) {
                                  if(value.isSuccess){
                                    Navigator.of(context).pop();
                                    showCustomSnackBar(value.message, context,isError: false);
                                    Navigator.of(context).pop();
                                    isEdit ? successDialog(AppConstants.Training_Trainings_have_been_successfully_added_edit)
                                        : successDialog(AppConstants.Training_Trainings_have_been_successfully_added);
                                    myProfileProvider.getMyProfile();
                                  }else{
                                    showCustomSnackBar(value.message, context);
                                  }


                                });

                              },height: 24,wight: 62,textSize: 10,padding: 2,),
                              const SizedBox(width: 10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
              )
          );
        }
    );
  }

/// Add Skill
  addSkill(String title,bool isEdit){
    double height = 380;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>
               SizedBox(
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
                          SizedBox(width: 10,),
                          Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                          Expanded(child: Container()),
                          InkWell(
                            onHover: (_){},
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5,left: 10,right: 10),
                      child: Container(
                        height: 250,
                        child: SingleChildScrollView(
                          child: MultiSelectFormField(
                            autovalidate: AutovalidateMode.disabled,
                            chipBackGroundColor: ColorsResource.TEXT_GRAY_COLOR,
                            chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                            checkBoxActiveColor: ColorsResource.TEXT_GRAY_COLOR,
                            checkBoxCheckColor: Colors.white,
                            dialogShapeBorder: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0))),
                            title: Text(title, style: const TextStyle(fontSize: 10),),
                            validator: (value) {
                              if (value == null || value.length == 0) {
                                return 'Please select one or more options';
                              }
                              return null;
                            },

                            dataSource: myProfileProvider.selectSkillsModel,
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            hintWidget: Text('Please choose one or more'),
                            initialValue: _myActivities,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                _myActivities = value;
                                print(_myActivities);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){
                            Map<String, dynamic> data = {
                              "skill_id[]": _myActivities

                            };
                            final formData = FormData.fromMap(data);
                            myProfileProvider.postSkills(formData).then((value) {
                              if(value.isSuccess){
                                Navigator.of(context).pop();
                                showCustomSnackBar(value.message, context,isError: false);
                                isEdit ? successDialog(AppConstants.Skills_have_been_successfully_added) : successDialog(AppConstants.Skills_have_been_successfully_added_edit) ;
                                myProfileProvider.getMyProfile();
                              } else{
                                showCustomSnackBar(value.message, context);
                              }
                            });

                            },height: 24,wight: 62,textSize: 10,padding: 2,),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 20,),
                  ],
                  ),
                ),
              )
          );
        }
    );

  }



  Widget _buildChip(Skills skills, Color color) {
    return Consumer<MyProfileProvider>(
      builder: (context,myProfileProvider,child) =>
      Chip(
        labelPadding: EdgeInsets.all(2.0),
        label: Text(
          '${skills.skillName}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: color,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
        onDeleted: (){
         // showLoaderDialog(context);
          myProfileProvider.setSkillRemove(skills);
          myProfileProvider.deleteSkills(skills.id!).then((value) {
            if(value.isSuccess){
            //  Navigator.of(context).pop();
            }else{
              Navigator.of(context).pop();
            }
          });
          print(skills.skillId);
        },
      ),
    );
  }

  updateSkills(String title,bool isEdit){
    return showDialog(context: context, builder: (BuildContext context ){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        child: Consumer<MyProfileProvider>(
          builder: (context,myProfileProvider,child) =>
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
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
                      SizedBox(width: 10,),
                      Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                      Expanded(child: Container()),
                      InkWell(
                        onHover: (_){},
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: myBoxDecoration(),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 6.0,
                      runSpacing: 6.0,
                      children: myProfileProvider.skills!.map((e) {
                        return _buildChip(e, Color(0xFF969696));
                      }).toList(),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Container()),
                    CustomButton(AppConstants.save,(){
                      Navigator.of(context).pop();

                    },height: 24,wight: 62,textSize: 10,padding: 2,),
                    SizedBox(width: 10,),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      );
    });
  }


  ///Add languages
  addLanguagesDialog(String title,bool isEdit){
    double height = 320;
    TextEditingController titleTextEditingController = TextEditingController();
    FocusNode titleFocusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Provider.of<MyProfileProvider>(context,listen: false).resetLan();
          });

          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>
                SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
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
                            SizedBox(width: 10,),
                            Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_){},
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 100,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: CustomTextFieldWithTitle(AppConstants.language,titleTextEditingController,
                                        titleFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.reading,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),

                                            ],
                                          ),

                                          readingDropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Row(
                                            children: [
                                              Text(AppConstants.listening,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),

                                            ],
                                          ),
                                          listeningDropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.writing,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),

                                            ],
                                          ),

                                          writingDropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.speacking,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),

                                            ],
                                          ),
                                          speackingDropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){


                            String langTitle = titleTextEditingController.text;

                            String reading = myProfileProvider.readingValueWord;
                            String listening = myProfileProvider.listeningValueWord;
                            String writing = myProfileProvider.writingValueWord;
                            String speacking = myProfileProvider.speackingValueWord;


                            if(langTitle == ''){
                              return showCustomSnackBar('Lang Title',context);
                            }
                            if(reading == AppConstants.Select_Rating){
                              return showCustomSnackBar('reading',context);
                            }
                            if(listening == AppConstants.Select_Rating){
                              return showCustomSnackBar('listening',context);
                            }
                            if(writing == AppConstants.Select_Rating){
                              return showCustomSnackBar('writing',context);
                            }
                            if(speacking == AppConstants.Select_Rating){
                              return showCustomSnackBar('speacking',context);
                            }

                            Map<String, dynamic> data = {
                              "language_name": langTitle,
                              "language_rating_speaking":int.parse(reading),
                              "language_rating_reading":int.parse(listening),
                              "language_rating_writing":int.parse(writing),
                              "language_rating_listening":int.parse(speacking),
                            };
                            final formData = FormData.fromMap(data);

                            showLoaderDialog(context);

                            myProfileProvider.postLanguage(formData).then((value) {
                              if(value.isSuccess){
                                Navigator.of(context).pop();
                                myProfileProvider.getMyProfile();
                                showCustomSnackBar(value.message,context,isError: false);
                                Navigator.of(context).pop();
                                isEdit ? successDialog(AppConstants.Languages_have_been_successfully_added_edit)
                                    : successDialog(AppConstants.Languages_have_been_successfully_added);
                              }else{
                                Navigator.of(context).pop();
                                showCustomSnackBar(value.message,context);
                              }
                            });



                          },height: 24,wight: 62,textSize: 10,padding: 2,),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  updateLanguagesDialog(String title,bool isEdit,Languages languages){
    double height = 320;
    TextEditingController titleTextEditingController = TextEditingController();
    FocusNode titleFocusNode = FocusNode();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

            titleTextEditingController.text = languages.languageName!;
            Provider.of<MyProfileProvider>(context,listen: false).setAllLan(
              '${languages.languageRatingReading}',
              '${languages.languageRatingReading}',

              '${languages.languageRatingListening}',
              '${languages.languageRatingListening}',

              '${languages.languageRatingWriting}',
              '${languages.languageRatingWriting}',

              '${languages.languageRatingSpeaking}',
              '${languages.languageRatingSpeaking}',
            );
          });

          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>
                    SizedBox(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
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
                                SizedBox(width: 10,),
                                Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                                Expanded(child: Container()),
                                InkWell(
                                  onHover: (_){},
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: height - 100,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: CustomTextFieldWithTitle(AppConstants.language,titleTextEditingController,
                                            titleFocusNode,isShowRequrStar: true,height: 50,isPadding:false,paddingDouble: 8,)),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(AppConstants.reading,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              readingDropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(AppConstants.listening,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              listeningDropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(AppConstants.writing,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              writingDropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(AppConstants.speacking,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              speackingDropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Container()),
                              CustomButton(AppConstants.save,(){


                                String langTitle = titleTextEditingController.text;

                                String reading = myProfileProvider.readingValueWord;
                                String listening = myProfileProvider.listeningValueWord;
                                String writing = myProfileProvider.writingValueWord;
                                String speacking = myProfileProvider.speackingValueWord;


                                if(langTitle == ''){
                                  return showCustomSnackBar('Lang Title',context);
                                }
                                if(reading == AppConstants.Select_Rating){
                                  return showCustomSnackBar('reading',context);
                                }
                                if(listening == AppConstants.Select_Rating){
                                  return showCustomSnackBar('listening',context);
                                }
                                if(writing == AppConstants.Select_Rating){
                                  return showCustomSnackBar('writing',context);
                                }
                                if(speacking == AppConstants.Select_Rating){
                                  return showCustomSnackBar('speaking',context);
                                }

                                Map<String, dynamic> data = {
                                  "language_name": langTitle,
                                  "language_rating_speaking":int.parse(reading),
                                  "language_rating_reading":int.parse(listening),
                                  "language_rating_writing":int.parse(writing),
                                  "language_rating_listening":int.parse(speacking),
                                };
                                final formData = FormData.fromMap(data);

                                showLoaderDialog(context);

                                myProfileProvider.updateLanguage(languages.id!,formData).then((value) {
                                  if(value.isSuccess){
                                    Navigator.of(context).pop();
                                    myProfileProvider.getMyProfile();
                                    showCustomSnackBar(value.message,context,isError: false);
                                    Navigator.of(context).pop();
                                    isEdit ? successDialog(AppConstants.Languages_have_been_successfully_added_edit)
                                        : successDialog(AppConstants.Languages_have_been_successfully_added);
                                  }else{
                                    Navigator.of(context).pop();
                                    showCustomSnackBar(value.message,context);
                                  }
                                });

                              },height: 24,wight: 62,textSize: 10,padding: 2,),
                              const SizedBox(width: 10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
              )
          );
        }
    );
  }

  readingDropdown(){
    return Consumer<MyProfileProvider>(
      builder: (context,myProfileProvider,child) =>
     Container(
        height: 33,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(myProfileProvider.readingHintValueword,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: myProfileProvider.readingValueWord, //add this parameter
              items: myProfileProvider.readingword.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != AppConstants.Select_Rating ? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {

                  myProfileProvider.setReading(selectedValue!, selectedValue);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  listeningDropdown(){
    return Consumer<MyProfileProvider>(
      builder: (context,myProfileProvider,child) =>
      Container(
        height: 33,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(myProfileProvider.listeningHintValueword,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: myProfileProvider.listeningValueWord, //add this parameter
              items: myProfileProvider.readingword.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != AppConstants.Select_Rating? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                 // readingValueWord= selectedValue!;
                 // readingHintValueword = selectedValue;
                  myProfileProvider.setListening(selectedValue!, selectedValue);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  writingDropdown(){
    return Consumer<MyProfileProvider>(
      builder: (context,myProfileProvider,child) =>
      Container(
        height: 33,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(myProfileProvider.writingHintValueword,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: myProfileProvider.writingValueWord, //add this parameter
              items: myProfileProvider.readingword.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != 'Select Rating'? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                //  readingValueWord= selectedValue!;
                 // readingHintValueword = selectedValue;
                  myProfileProvider.setWriting(selectedValue!, selectedValue);
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  speackingDropdown(){
    return Consumer<MyProfileProvider>(
      builder: (context,myProfileProvider,child) =>
      Container(
        height: 33,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: myBoxDecoration(),
        child: Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(myProfileProvider.speackingHintValueword,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: myProfileProvider.speackingValueWord, //add this parameter
              items: myProfileProvider.readingword.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != 'Select Rating'? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  // readingValueWord= selectedValue!;
                  // readingHintValueword = selectedValue;
                  myProfileProvider.setSpeacking(selectedValue!, selectedValue);
                });
              },
            ),
          ),
        ),
      ),
    );
  }


  ///Add Employment Location
  addEmploymentLocationDialog(String title,bool isEdit){
    double height = 235;
    TextEditingController addressTextEditingController = TextEditingController();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var locationProvider =  Provider.of<LocationProvider>(context,listen: false);
      locationProvider.setDistricName(AppConstants.Please_enter_the_district, 0);
      locationProvider.setMunicipalitiesName(AppConstants.Please_be_a_municipality,0);
      locationProvider.setMunicipalitiesName(AppConstants.Please_be_a_municipality,0);

    });





    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>
                SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
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
                            SizedBox(width: 10,),
                            Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_){},
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 100,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                         children: [
                                           Text(AppConstants.Province1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                           Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)

                                         ],
                                          ),
                                          stateDropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.District1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)
                                            ],
                                          ),
                                          district1Dropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.Village_Municipality,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)

                                            ],
                                          ),
                                          municipalityDropdown()
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5,bottom: 10),
                                    child:Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(AppConstants.address1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                              Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 35,
                                            decoration: myBoxDecoration(),
                                            child: TextField(
                                              controller: addressTextEditingController,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding:
                                                EdgeInsets.only(left: 5, bottom: 11, top: 0, right: 5),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ) ,

                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){

                            String title = addressTextEditingController.text;
                            int pradeshId = myProfileProvider.pradeshId;
                            int districtsId = myProfileProvider.districtsId;
                            int municipalitiesId = myProfileProvider.municipalitiesId;


                            if(title == ''){
                              return showCustomSnackBar('1',context);
                            }
                            if(pradeshId == 0){
                              return showCustomSnackBar('2',context);
                            }
                            if(districtsId == 0){
                              return showCustomSnackBar('3',context);
                            }
                            if(municipalitiesId == 0){
                              return showCustomSnackBar('4',context);
                            }
                            Map<String, dynamic> data = {
                              "location": title,
                              "per_pradesh_id":pradeshId,
                              "per_district_id":districtsId,
                              "per_muni_id":municipalitiesId
                            };
                            final formData = FormData.fromMap(data);
                            showLoaderDialog(context);

                            myProfileProvider.postPreferenceLocation(formData).then((value){
                              if(value.isSuccess){
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                isEdit ?
                                successDialog(AppConstants.The_job_location_has_been_successfully_added_edit):
                                successDialog(AppConstants.The_job_location_has_been_successfully_added);
                                myProfileProvider.getMyProfile();
                              }else{
                                Navigator.of(context).pop();
                              }
                            });

                          },height: 24,wight: 62,textSize: 10,padding: 2,),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }


  updateEmploymentLocationDialog(String title,bool isEdit,Locations locations){
    double height = 235;
    TextEditingController addressTextEditingController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var locationProvider =  Provider.of<LocationProvider>(context,listen: false);
      locationProvider.setDistricName(AppConstants.Please_enter_the_district, 0);
      locationProvider.setMunicipalitiesName(AppConstants.Please_be_a_municipality,0);
      locationProvider.setMunicipalitiesName(AppConstants.Please_be_a_municipality,0);

      locationProvider.setPradesh(locations.pradeshName!, locations.perPradeshId!);
      locationProvider.getDistricts(locations.perPradeshId!).then((value) {
        locationProvider.setDistricName(locations.districtName!, locations.perDistrictId!);


        locationProvider.getMunicipalities(locations.perDistrictId!).then((value) {
          locationProvider.setMunicipalitiesName(locations.muniName!,locations.perMuniId!);
        });

      });



    });





    return showDialog(
        context: context,
        builder: (BuildContext context) {

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            addressTextEditingController.text = locations.location!;
            Provider.of<MyProfileProvider>(context,listen: false).setAllUpdateLocation(
                locations.pradeshName!,
                locations.perPradeshId!,
                locations.districtName!,
                locations.perDistrictId!,
                locations.muniName!,
                locations.perMuniId!,
            );
          });
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>
                    SizedBox(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
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
                                SizedBox(width: 10,),
                                Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                                Expanded(child: Container()),
                                InkWell(
                                  onHover: (_){},
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: height - 100,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.Province1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                  Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)

                                                ],
                                              ),
                                              stateDropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.District1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                  Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)
                                                ],
                                              ),
                                              district1Dropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.Village_Municipality,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                  Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)

                                                ],
                                              ),
                                              municipalityDropdown()
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(right: 5,bottom: 10),
                                        child:Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(AppConstants.address1,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),),
                                                  Text(' *',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_READ_COLOR,fontWeight:Dimensions.FONT_MEDIUM_NORMUL ),)
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                height: 35,
                                                decoration: myBoxDecoration(),
                                                child: TextField(
                                                  controller: addressTextEditingController,
                                                  decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder: InputBorder.none,
                                                    enabledBorder: InputBorder.none,
                                                    errorBorder: InputBorder.none,
                                                    disabledBorder: InputBorder.none,
                                                    contentPadding:
                                                    EdgeInsets.only(left: 5, bottom: 11, top: 0, right: 5),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ) ,

                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                          Expanded(child: Container()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Container()),
                              CustomButton(AppConstants.save,(){

                                String title = addressTextEditingController.text;
                                int pradeshId = myProfileProvider.pradeshId;
                                int districtsId = myProfileProvider.districtsId;
                                int municipalitiesId = myProfileProvider.municipalitiesId;


                                if(title == ''){
                                  return showCustomSnackBar('1',context);
                                }
                                if(pradeshId == 0){
                                  return showCustomSnackBar('2',context);
                                }
                                if(districtsId == 0){
                                  return showCustomSnackBar('3',context);
                                }
                                if(municipalitiesId == 0){
                                  return showCustomSnackBar('4',context);
                                }
                                Map<String, dynamic> data = {
                                  "location": title,
                                  "per_pradesh_id":pradeshId,
                                  "per_district_id":districtsId,
                                  "per_muni_id":municipalitiesId
                                };
                                final formData = FormData.fromMap(data);

                                showLoaderDialog(context);
                                myProfileProvider.updatePreferenceLocation(locations.id!,formData).then((value){
                                  if(value.isSuccess){
                                    Navigator.of(context).pop();
                                    isEdit ?
                                    successDialog(AppConstants.The_job_location_has_been_successfully_added_edit):
                                    successDialog(AppConstants.The_job_location_has_been_successfully_added);
                                    myProfileProvider.getMyProfile();
                                  }else{
                                    Navigator.of(context).pop();
                                  }
                                });

                              },height: 24,wight: 62,textSize: 10,padding: 2,),
                              const SizedBox(width: 10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
              )
          );
        }
    );
  }

  stateDropdown(){
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width/1.1,
      decoration: myBoxDecoration(),
      child: Consumer2<MyProfileProvider,LocationProvider>(
        builder: (context,myProfileProvider,locationProvider,child)=>
        Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(locationProvider.pleasePradashValueWord,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: locationProvider.pleasePradashValueWord, //add this parameter
              items: locationProvider.pradashWords?.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != AppConstants.Province2 ? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                 // Province1ValueWord= selectedValue!;
                  int id = locationProvider.pradashWords!.indexOf(selectedValue!);
                  myProfileProvider.setPradesh(selectedValue, locationProvider.pradashWordsIdList![id]);
                  locationProvider.setPradesh(selectedValue,id);


                  locationProvider.getDistricts(id);
                  locationProvider.setDistricName(AppConstants.Please_enter_the_district, 0);

                });
              },
            ),
          ),
        ),
      ),
    );
  }

  district1Dropdown(){
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width/1.1,
      decoration: myBoxDecoration(),

      child: Consumer2<MyProfileProvider,LocationProvider>(
        builder: (context,myProfileProvider,locationProvider,child) =>
        Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(locationProvider.districtsName,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: locationProvider.districtsName, //add this parameter
              items: locationProvider.pleaseTheDistrictWords.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != AppConstants.Please_enter_the_district? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                 // District1ValueWord= selectedValue!;
                 // District1HintValueword = selectedValue;
                  int id = myProfileProvider.pleaseTheDistrictWords.indexOf(selectedValue!);
                  myProfileProvider.setDistricts(selectedValue, myProfileProvider.pleaseTheDistrictWordsIdList[id]);
                  locationProvider.setDistricName(selectedValue, id);
  locationProvider.getMunicipalities(id);
                  locationProvider.setMunicipalitiesName(AppConstants.Please_be_a_municipality,0);
               


                });
              },
            ),
          ),
        ),
      ),
    );
  }

  municipalityDropdown(){
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width/1.1,
      decoration: myBoxDecoration(),
      child: Consumer2<MyProfileProvider,LocationProvider>(
        builder: (context,myProfileProvider,locationProvider,child) =>
        Container(
          margin: const EdgeInsets.only(left: 10,right: 10),
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
              hint: Text(locationProvider.municipalitiesName,
                style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                    fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_GRAY_COLOR),),
              iconSize: 20,
              value: locationProvider.municipalitiesName, //add this parameter
              items: locationProvider.pleaseMunicipalityWordsAll.map((String dropDownStringItem) {
                return DropdownMenuItem(
                  value: dropDownStringItem,
                  child: Text( dropDownStringItem,style: TextStyle(fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                      fontSize: Dimensions.BODY_10,color: dropDownStringItem != AppConstants.Please_be_a_municipality? ColorsResource.TEXT_BLACK_COLOR:ColorsResource.TEXT_GRAY_COLOR),),
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                 // District1ValueWord= selectedValue!;
                //  District1HintValueword = selectedValue;
                  int id = myProfileProvider.pleaseMunicipalityWordsAll.indexOf(selectedValue!);
                  myProfileProvider.setMunicipalities(selectedValue, myProfileProvider.pleaseMunicipalityWordsIdListAll[id]);


                  locationProvider.setMunicipalitiesName(selectedValue,id);


                });
              },
            ),
          ),
        ),
      ),
    );
  }



  ///Add_a_social_media_account
  addASocialMediaAccountDialog(String title,List<SocialNameData>? socialNameDataLst){
    String textOneName ='';
    TextEditingController textOneValue = TextEditingController();

    String textTowName = '';
    TextEditingController textTowValue = TextEditingController();

    String textTreeName = '';
    TextEditingController textTreeValue = TextEditingController();

    double height = 255;
    return showDialog(
        context: context,
        builder: (BuildContext context) {

          if(socialNameDataLst!.length >= 1){
            String? name1 = socialNameDataLst[0].name!;
            textOneName = name1;
          }
          if(socialNameDataLst.length >= 2){
            String? name1 = socialNameDataLst[1].name!;
            textTowName = name1;
          }
          if(socialNameDataLst.length >= 3){
            String? name1 = socialNameDataLst[2].name!;
            textTreeName = name1;
          }


          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child) =>

                Container(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
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
                            SizedBox(width: 10,),
                            Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_){},
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 100,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                                    height: 35,
                                    child: Container(
                                      decoration: myBoxDecoration(),
                                      child: Container(
                                          margin: EdgeInsets.only(top: 10,left: 10),
                                          child: Text(textOneName)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                                    height: 35,
                                    child: Container(
                                        child: TextField(
                                          controller: textOneValue,
                                          decoration: InputDecoration(
                                            hintText: 'URL',
                                            contentPadding: EdgeInsets.only(left: 5)
                                          ),
                                        ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                                    height: 35,
                                    child: Container(
                                      decoration: myBoxDecoration(),
                                      child: Container(
                                          margin: EdgeInsets.only(top: 10,left: 10),
                                          child: Text(textTowName)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                                    height: 35,
                                    child: Container(
                                      child: TextField(
                                        controller: textTowValue,
                                        decoration: InputDecoration(
                                            hintText: 'URL',
                                            contentPadding: EdgeInsets.only(left: 5)
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                                    height: 35,
                                    child:Container(
                                      decoration: myBoxDecoration(),
                                      child: Container(
                                          margin: EdgeInsets.only(top: 10,left: 10),
                                          child: Text(textTreeName)),

                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                                    height: 35,
                                    child: Container(
                                      child: TextField(
                                        controller: textTreeValue,
                                        decoration: InputDecoration(
                                            hintText: 'URL',
                                            contentPadding: EdgeInsets.only(left: 5)
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,() async{

                          String oneName = textOneName;
                          String oneValue = textOneValue.text;

                          String towName = textTowName;
                          String towValue = textTowValue.text;

                          String treeName = textTreeName;
                          String treeValue = textTreeValue.text;

                          List? _myActivities = [MapEntry('$oneName', '$oneValue')];
                          final data = {
                            "accounts": json.encode({'$oneName': '$oneValue', '$towName': '$towValue', '$treeName': '$treeValue'}),
                          };

                          var formData = FormData.fromMap({"accounts": [
                            {"name":"$oneName","url":"$oneValue"},
                            {"name":"$towName","url":"$towValue"},
                            {"name":"$treeName","url":"$treeValue"}
                          ]});

                          // List<Accounts>? accounts = [Accounts(name:oneName,url: oneValue )] ;
                          // SendSocialAccount sendSocialAccount = SendSocialAccount(accounts:accounts );



                          String? token ="";
                          final box = GetStorage();
                          token = box.read(AppConstants.TOKEN);
                          BaseOptions options = BaseOptions(
                              baseUrl: Apis.BASE_URL,
                              headers: {
                                'Accept':'application/json',
                                'Authorization': 'Bearer $token'}
                          );
                          Dio dio = Dio(options);

                          var response = await dio.post(
                            Apis.ADD_SOCIAL,
                            data: formData,
                            options: Options(
                                followRedirects: false,
                                validateStatus: (status) {
                                  return status! <= 500;
                                }),
                          );

                          print( "fdskj   ${response.statusCode}");
                          print("sfdsf  ${response.data}");
                          Navigator.of(context).pop();
                          if(response.statusCode == 200){
                            successDialog(AppConstants.The_social_media_account_has_been_successfully_added);
                            myProfileProvider.getMyProfile();
                          }
                          },height: 24,wight: 62,textSize: 10,padding: 2,),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  ///Add Specialization
  addSpecializationDialog(String title){

    TextEditingController textEditingController = TextEditingController();

    const maxLines = 10;
    double height = 250;
    return showDialog(
        context: context,
        builder: (BuildContext context) {

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

          });
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child)=>
                 SizedBox(
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
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
                            SizedBox(width: 10,),
                            Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                            Expanded(child: Container()),
                            InkWell(
                              onHover: (_){},
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: height - 100,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: TextField(
                          controller: textEditingController,
                          maxLines: maxLines,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: const OutlineInputBorder(),
                            labelStyle: new TextStyle(color: Colors.green),

                            hintText: "Enter a message",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Container()),
                          CustomButton(AppConstants.save,(){
                            String specialText = textEditingController.text;
                            if(specialText == ''){
                              return showCustomSnackBar('1',context);
                            }
                            Map<String, dynamic> data = {
                              "specialization": specialText
                            };
                            final formData = FormData.fromMap(data);
                            myProfileProvider.postSpecialAdd(formData).then((value) {
                              showLoaderDialog(context);
                              if(value.isSuccess){
                                Navigator.of(context).pop();
                                myProfileProvider.getMyProfile();
                              }else{

                              }
                            });
                            Navigator.of(context).pop();
                            successDialog(AppConstants.Expertise_has_been_successfully_added);
                          },height: 24,wight: 62,textSize: 10,padding: 2,),
                          SizedBox(width: 10,),
                        ],
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }






  updateSpecializationDialog(String title,String data){

    TextEditingController textEditingController = TextEditingController();

    const maxLines = 10;
    double height = 250;
    return showDialog(
        context: context,
        builder: (BuildContext context) {

          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            textEditingController.text = data;
          });
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Consumer<MyProfileProvider>(
                builder: (context,myProfileProvider,child)=>
                    SizedBox(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
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
                                SizedBox(width: 10,),
                                Text(title,style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_14),),
                                Expanded(child: Container()),
                                InkWell(
                                  onHover: (_){},
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.PRAYMARY_TEXT_COLOR,)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: height - 100,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: TextField(
                              controller: textEditingController,
                              maxLines: maxLines,
                              decoration: const InputDecoration(
                                enabledBorder:  OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border:  OutlineInputBorder(),
                                labelStyle:  TextStyle(color: Colors.green),
                                hintText: "Enter a message",
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(child: Container()),
                              CustomButton(AppConstants.save,(){
                                String specialText = textEditingController.text;
                                if(specialText == ''){
                                  return showCustomSnackBar('Enter a message',context);
                                }
                                Map<String, dynamic> data = {
                                  "specialization": specialText
                                };
                                final formData = FormData.fromMap(data);
                                myProfileProvider.postSpecialAdd(formData).then((value) {
                                  if(value.isSuccess){
                                    Navigator.of(context).pop();
                                    myProfileProvider.getMyProfile();
                                  }else{
                                    Navigator.of(context).pop();
                                  }
                                });
                                successDialog(AppConstants.Expertise_has_been_successfully_added);
                              },height: 24,wight: 62,textSize: 10,padding: 2,),
                              SizedBox(width: 10,),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
              )
          );
        }
    );
  }


  successDialog(String title){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
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
                            onHover: (_){},
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.TEXT_BLACK_COLOR,)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(title,textAlign:TextAlign.center, style: TextStyle(fontSize: Dimensions.BODY_20,color: ColorsResource.TEXT_BLACK_COLOR),))),
                    SizedBox(height: 20,),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppImages.ic_sucses))
                  ],
                ),
              )
          );
        }
    );
  }




  showToast(String title){
    final snackBar = SnackBar(
      content: Text(title),
      backgroundColor: Colors.red,
      behavior:SnackBarBehavior.floating
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);

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
