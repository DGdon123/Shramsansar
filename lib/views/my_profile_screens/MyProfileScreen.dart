import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/provider/MyProfileProvider.dart';
import 'package:provider/provider.dart';

import '../../models/ResponsModels/MyProfileModel.dart';
import '../../utils/Apis.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import 'edite_profile_widgets/EducationItem.dart';
import 'edite_profile_widgets/ExperinceItem.dart';
import 'edite_profile_widgets/TraningItem.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MyProfileProvider>(context,listen: false).getMyProfile();

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
          AppConstants.Profile,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<MyProfileProvider>(
        builder: (context,myProfileProvider,child) =>
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                // Container(
                //   color: ColorsResource.PRAYMERY_COLOR,
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 40,
                //     margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                //     child: Column(
                //       children: [
                //         //Toolbar
                //         // Row(
                //         //   children: [
                //         //     InkWell(
                //         //         onHover: (_) {},
                //         //         onTap: () {
                //         //           Navigator.of(context).pop();
                //         //         },
                //         //         child: SvgPicture.asset(AppImages.ic_back_blue)),
                //         //     SizedBox(
                //         //       width: MediaQuery
                //         //           .of(context)
                //         //           .size
                //         //           .width - 65,
                //         //       child: Text(
                //         //         AppConstants.Profile,
                //         //         style: TextStyle(
                //         //             fontSize: Dimensions.BODY_20,
                //         //             fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                //         //             color: ColorsResource.PRAYMARY_TEXT_COLOR),
                //         //         textAlign: TextAlign.center,
                //         //       ),
                //         //     )
                //         //   ],
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            height: 100,
                            width: 100,
                            child: myProfileProvider.myProfileModel?.data?.file != null ?  CachedNetworkImage(imageUrl:'${Apis.IMAGE_URL}${myProfileProvider.myProfileModel?.data?.file}',placeholder: (context, url) => new CircularProgressIndicator(), errorWidget: (context, url, error) => Image.asset(AppImages.ic_demo_person)): Image.asset(AppImages.ic_demo_person),
                          ),

                          SizedBox(height: 5,),
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
                                    Text('${myProfileProvider.myProfileModel?.data?.email}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR,
                            padding: EdgeInsets.all(4),
                            child: Text(AppConstants.about_yourself,
                              style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 20,right: 10,top: 10),
                              child: Text('${myProfileProvider.myProfileModel?.data?.aboutYourself?.description}',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR),)),

                          ///Education
                          SizedBox(height: 10,),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR,
                            padding: EdgeInsets.all(4),
                            child: Text(AppConstants.education1,
                              style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 00),
                            width: MediaQuery.of(context).size.width,
                            height: (myProfileProvider.educations?.length)! * 160,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: myProfileProvider.educations?.length,
                              itemBuilder: (BuildContext context, int index) {
                                Educations education = myProfileProvider.educations![index];
                                return EducationItem(education,(){},(){},isVisibleEditOption: false);
                              },
                            ),
                          ),
                          ///Experience
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR,
                            padding: EdgeInsets.all(4),
                            child: Text(AppConstants.Experience1,
                              style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                            ),
                          ),
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

                                return ExperinceItem(experiences,(){},(){},isVisibleEditOption: false);
                              },
                            ),
                          ),

                          ///Training
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR,
                            padding: EdgeInsets.all(4),
                            child: Text(AppConstants.Training_Trainings,
                              style: TextStyle(color: ColorsResource.WHAIT,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: (myProfileProvider.trainings?.length)! * 150,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: myProfileProvider.trainings?.length,
                              itemBuilder: (BuildContext context, int index) {
                                Trainings trainings = myProfileProvider.trainings![index];
                                return TraningItem(trainings,(){},(){},isVisibleEditOption: false,);
                              },
                            ),
                          )

                        ],)

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
