import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmiis/utils/AppConstants.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/dimensions.dart';

import '../../../models/ResponsModels/EsspServiceDetailsModel.dart';
import '../../../models/ResponsModels/ViewAllTrainingsModel.dart';
import '../../../utils/colors_resource.dart';
import '../../Job_description_view_screens/Job_description_view_screen.dart';
import '../../news_information_details_screens/news_information_details_screens.dart';

class TrainingServiceItem extends StatelessWidget {
  ViewAllTrainingsData viewAllTrainingsData;
  Function() onTab;
  bool isVisibleTag;

  TrainingServiceItem(this.viewAllTrainingsData, this.onTab, this.isVisibleTag);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (_){},
      onTap: onTab,
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
