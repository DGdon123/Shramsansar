import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmiis/utils/colors_resource.dart';

import '../../../models/ResponsModels/ViewAllTrainingsModel.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/dimensions.dart';
import '../../login_screens/logIn_screen.dart';
import 'special_training_detail_page.dart';

class SpecialTrainingServiceItem extends StatelessWidget {
  ViewAllTrainingsData viewAllTrainingsData;
  // Function() onTab;
  bool isVisibleTag;

  SpecialTrainingServiceItem(this.viewAllTrainingsData,  this.isVisibleTag);

  @override
  Widget build(BuildContext context) {
     Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onHover: (_){},
      onTap: (){   final box = GetStorage();
        String? token = box.read(AppConstants.TOKEN) ?? '';
         token.isEmpty ? showDialog(
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
                                                  screenType: "esspServiceDetailsTraining",
                                                  //screenType : "training"
                                                  //trainingModelData : trainingModelData
                                                  viewAllTrainingsData:
                                                      viewAllTrainingsData,
                                                )))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SpecialTrainingSingleItemDetails(
                                                    viewAllTrainingsData)));
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
                        SpecialTrainingSingleItemDetails(viewAllTrainingsData)));
        },
        
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
        decoration: myBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          children: [
            SizedBox(width: 10,),
            Container(
              width: MediaQuery.of(context).size.width - 52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10,top: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Text('${viewAllTrainingsData.title}',
                        maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: Dimensions.BODY_16,color: ColorsResource.PRAYMARY_TEXT_COLOR,fontWeight: Dimensions.FONT_MEDIUM),)),

                  Expanded(child: Container()),
                  Container(
                      margin: EdgeInsets.only(left: 10,top: 5),
                      width: MediaQuery.of(context).size.width - 55,
                      child: Row(
                        children: [
                          Text('${viewAllTrainingsData.serviceProviderName}',
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_GRAY_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                          Expanded(child: Container()),


                          Visibility(
                            visible: isVisibleTag,
                            child: Container(
                              decoration: myBoxDecorationItemHader(),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 5,right: 5),
                                  child: Text(AppConstants.Training,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.WHAIT),)),
                            ),
                          ),

                        ],

                      )

                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.ic_calender,color: ColorsResource.TEXT_BLACK_COLOR,height:10,width: 10,),
                            SizedBox(width: 4,),
                            Text('${viewAllTrainingsData.startDate} ${viewAllTrainingsData.startTime} To ${viewAllTrainingsData.endDate} ${viewAllTrainingsData.endTime}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                          ],
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,height:10,width: 10,),
                            SizedBox(width: 4,),
                            Text('${viewAllTrainingsData.districtName}'
                              ,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                          ],
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.ic_clock,color: ColorsResource.TEXT_BLACK_COLOR,height: 10,width: 10,),
                            SizedBox(width: 4,),
                            Text('${viewAllTrainingsData.endDate}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8,)
                ],
              ),
            ),


          ],
        ),
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

}
