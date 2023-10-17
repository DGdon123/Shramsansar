import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/ResponsModels/MyProfileModel.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';

class ExperinceItem extends StatelessWidget {
  Experiences experiences;
  Function() onEditButton;
  Function() onDeleteButton;
  bool isVisibleEditOption;

  ExperinceItem(this.experiences,this.onEditButton, this.onDeleteButton,{this.isVisibleEditOption = true});

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
                    Text( '${experiences.title}',
                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                    ),

                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Text( '${AppConstants.From}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM),
                        ),
                        Text( '${experiences.startDate}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                        ),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text( '${AppConstants.To}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM),
                        ),
                        Text( '${experiences.endDate}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                        ),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text( '${AppConstants.Organization}',
                          style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_MEDIUM),
                        ),
                        Text( '${experiences.organization}',
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
                    onHover: (_){},
                    onTap: onEditButton,
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
