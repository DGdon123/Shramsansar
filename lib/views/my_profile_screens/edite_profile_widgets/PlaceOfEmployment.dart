import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/ResponsModels/MyProfileModel.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';

class PlaceOfEmployment extends StatelessWidget {

  Locations locations;
  Function() onEditButton;
  Function() onDeleteButton;

  PlaceOfEmployment(this.locations,this.onEditButton, this.onDeleteButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Row (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${locations.location}',
                        style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(
                                    AppConstants.Province,
                                    style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),),
                                  SizedBox(width: 2,),
                                  Container(
                                    width: 85,
                                    child: Text('${locations.pradeshName}',
                                      style: TextStyle(fontSize: Dimensions.BODY_8,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(AppConstants.District,
                                    style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),),
                                  SizedBox(width: 2,),

                                  Container(
                                    width: 85,
                                    child: Text('${locations.districtName}',
                                      style: TextStyle(fontSize: Dimensions.BODY_8,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                  ),

                                ],
                              )

                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(AppConstants.Village,
                                    style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),),
                                  SizedBox(width: 2,),
                                  Container(
                                    width: 85,
                                    child: Text('whatever',
                                      style: TextStyle(fontSize: Dimensions.BODY_8,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(AppConstants.Municipality,
                                    style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),),
                                  SizedBox(width: 2,),
                                  Container(
                                    width: 70,
                                    child: Text('${locations.muniName}',
                                      style: TextStyle(fontSize: Dimensions.BODY_8,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                  ),

                                ],
                              )

                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(AppConstants.Metropolitan,
                                    style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),),
                                  Container(
                                    width: 69,
                                    child: Text('Province no. 1',
                                      style: TextStyle(fontSize: Dimensions.BODY_8,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [

                                ],
                              )

                          )
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
              ))
        ],
      ),
    );
  }
}
