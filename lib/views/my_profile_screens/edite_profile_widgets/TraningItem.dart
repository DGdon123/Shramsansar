import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/ResponsModels/MyProfileModel.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';

class TraningItem extends StatelessWidget {


  Trainings trainings;
  Function() onEditButton;
  Function() onDeleteButton;
  bool isVisibleEditOption;

  TraningItem(this.trainings,this.onEditButton, this.onDeleteButton,{this.isVisibleEditOption = true});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 9,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left:20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( '${trainings.title}',
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                    ),
                    SizedBox(height: 10,),
                    Text( '${trainings.year}',
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                    ),
                    Text( '${trainings.duration}',
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                    ),
                    SizedBox(height: 2,),
                    Container(
                        margin: EdgeInsets.only(left: 0,right: 10),
                        child: Text('${trainings.details}',style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.TEXT_BLACK_COLOR),)),

                  ],
                ),
              ),


            ],
          ),
        ),

        Expanded(
            flex: 2,
            child: Visibility(
              visible: isVisibleEditOption,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onHover: (_){},
                    onTap: onDeleteButton,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 15,
                      height: 15,
                      child: SvgPicture.asset(AppImages.ic_delte_ful),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap:onEditButton,
                    onHover: (_){},
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 15,
                      height: 15,
                      child: SvgPicture.asset(AppImages.ic_edite_full),
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              ),
            ))
      ],
    );
  }
}
