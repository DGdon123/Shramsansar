import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/ResponsModels/MyProfileModel.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';

class EducationItem extends StatelessWidget {

  Educations education;
  Function() onEditButton;
  Function() onDeleteButton;
  bool isVisibleEditOption;

  EducationItem(this.education, this.onEditButton, this.onDeleteButton,{this.isVisibleEditOption = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( '${education.levelName}',
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                    ),
                    SizedBox(height: 5,),
                    Text( '${education.graduationYear}',
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text( '${AppConstants.Program}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM),
                        ),
                        Text( '${education.program}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                        ),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text( '${AppConstants.Board}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM),
                        ),
                        Text( '${education.board}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                        ),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text( '${AppConstants.Institute}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM),
                        ),
                        Text( '${education.institute}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                        ),
                      ],
                    ),


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
                    onTap: onDeleteButton,
                    onHover: (_){},
                    child: Container(

                      margin: EdgeInsets.only(top: 10),
                      width: 15,
                      height: 15,
                      child: SvgPicture.asset(AppImages.ic_delte_ful),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: onEditButton,
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

