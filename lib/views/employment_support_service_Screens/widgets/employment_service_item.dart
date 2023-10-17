import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmiis/utils/AppConstants.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/dimensions.dart';

import '../../../models/ResponsModels/EsspServiceDetailsModel.dart';
import '../../../models/ResponsModels/ViewAllJobsModel.dart';
import '../../../utils/Apis.dart';
import '../../../utils/colors_resource.dart';
import '../../Job_description_view_screens/Job_description_view_screen.dart';
import '../../login_screens/logIn_screen.dart';
import '../../news_information_details_screens/news_information_details_screens.dart';

class EmploymentServiceItem extends StatelessWidget {
  ViewAllJobsData viewAllJobData;
  // Function() onTab;
  EmploymentServiceItem(this.viewAllJobData);



  @override
  Widget build(BuildContext context) {    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onHover: (_){},
      onTap:(){
   final box = GetStorage();
        String? token = box.read(AppConstants.TOKEN) ?? '';
             token.isEmpty
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // title: const Text("कृपया लगइन गर्नुहोस्"),
                    content: SizedBox(
                      width: screenSize.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 30,
                                )),
                          ),
                          const Text(
                            "कृपया लगइन गर्नुहोस्",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,

                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                minimumSize: const Size(150, 50), //////// HERE
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                token.isEmpty
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => LogInScreen(
                                                  doCheckLastScreen: true,
                                                  screenType: "esspServiceDetailsJobs",
                                                  //screenType : "training"
                                                  //trainingModelData : trainingModelData
                                                  viewAllJobsData:
                                                      viewAllJobData,
                                                )))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JobDescriptionViewScreen(
                                                    viewAllJobData)));
                              },
                              child: const Text("लग - इन")),
                        ],
                      ),
                    ),
                  );
                })
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        JobDescriptionViewScreen(viewAllJobData)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
        decoration: myBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  padding: EdgeInsets.all(5),
                  child: viewAllJobData.serviceProvider!.logo != null ? CachedNetworkImage(imageUrl: '${Apis.URL}${viewAllJobData.serviceProvider!.logo}',height: 60,width: 60,fit: BoxFit.fill,placeholder: (context, url) =>  Image.asset(AppImages.placeHolder), errorWidget: (context, url, error) => Image.asset(AppImages.placeHolder)):Container(),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10,top: 10),
                    width: MediaQuery.of(context).size.width -135,
                    child: Text('${viewAllJobData.title}',maxLines: 1,overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: Dimensions.BODY_18,color: ColorsResource.PRAYMARY_TEXT_COLOR,fontWeight: Dimensions.FONT_MEDIUM),)),
                Container(
                    margin: EdgeInsets.only(left: 10,top: 5),
                    width: MediaQuery.of(context).size.width -135,
                    child: Row(
                      children: [
                        Text('${viewAllJobData.serviceProviderName}',
                          maxLines: 1,overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_GRAY_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                        Expanded(child: Container()),
                        Container(
                          decoration: myBoxDecorationItemHader(),
                          child: Padding(
                              padding: EdgeInsets.only(left: 5,right: 5),
                              child: Text(AppConstants.Employment,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.WHAIT),)),
                        ),

                      ],

                    )

                ),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 135,
                        height: 30,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,),
                                SizedBox(width:10,),
                                Text(
                                      '${viewAllJobData.ward},'
                                      '${viewAllJobData.muniName},'
                                      '${viewAllJobData.districtName},'
                                      '${viewAllJobData.pradeshName}',
                                  style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                              ],
                            ),
                            Expanded(child: Container()),
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.ic_clock,color: ColorsResource.TEXT_BLACK_COLOR,),
                                const SizedBox(width:10,),
                                Text('${viewAllJobData.deadline}  ',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }

  myBoxDecorationItemHader() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
      ),
      color: ColorsResource.PRAYMARY_TEXT_COLOR,
      border: Border.all(
        color: ColorsResource.PRAYMERY_COLOR,
        width: 1,
      ),
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ColorsResource.NEW_INFONMATION_ITEM_COLOR,
      border: Border.all(
        color: ColorsResource.NEW_INFONMATION_ITEM_COLOR,
        width: 1,
      ),
    );
  }

  myBoxDecorationTop() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5.0),),
      color: ColorsResource.PRAYMERY_COLOR,
      border: Border.all(
        color: ColorsResource.PRAYMERY_COLOR,
        width: 1,
      ),
    );
  }
}
