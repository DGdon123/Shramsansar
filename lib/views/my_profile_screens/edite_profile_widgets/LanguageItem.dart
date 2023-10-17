import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/ResponsModels/MyProfileModel.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';

class LanguageItem extends StatelessWidget {

  Languages languages;
  Function() onEditButton;
  Function() onDeleteButton;
  LanguageItem(this.languages,this.onEditButton, this.onDeleteButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
                      Text('${languages.languageName}',
                        style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(AppConstants.Reading,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),),
                                  SizedBox(width: 10,),
                                  RatingBar(
                                    initialRating: double.parse(languages.languageRatingReading!),
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                      full: SvgPicture.asset(AppImages.ic_rating_full),
                                      half: SvgPicture.asset(AppImages.ic_rating_full),
                                      empty: SvgPicture.asset(AppImages.ic_rating_half,
                                        color: ColorsResource.TEXT_GRAY_COLOR,),
                                    ),
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemSize: 10,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),

                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(AppConstants.Listening,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),),
                                  SizedBox(width: 10,),
                                  RatingBar(
                                    initialRating: double.parse(languages.languageRatingListening!),
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                      full: SvgPicture.asset(AppImages.ic_rating_full),
                                      half: SvgPicture.asset(AppImages.ic_rating_full),
                                      empty: SvgPicture.asset(AppImages.ic_rating_half,
                                        color: ColorsResource.TEXT_GRAY_COLOR,),
                                    ),
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemSize: 10,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
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
                                  Text(AppConstants.Writing,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),),
                                  SizedBox(width: 10,),
                                  RatingBar(
                                    initialRating: double.parse(languages.languageRatingWriting!),
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                      full: SvgPicture.asset(AppImages.ic_rating_full),
                                      half: SvgPicture.asset(AppImages.ic_rating_full),
                                      empty: SvgPicture.asset(AppImages.ic_rating_half,
                                        color: ColorsResource.TEXT_GRAY_COLOR,),
                                    ),
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemSize: 10,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),

                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Text(AppConstants.Speaking,style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),),
                                  SizedBox(width: 10,),
                                  RatingBar(
                                    initialRating: double.parse(languages.languageRatingSpeaking!),
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    ratingWidget: RatingWidget(
                                      full: SvgPicture.asset(AppImages.ic_rating_full),
                                      half: SvgPicture.asset(AppImages.ic_rating_full),
                                      empty: SvgPicture.asset(AppImages.ic_rating_half,
                                        color: ColorsResource.TEXT_GRAY_COLOR,),
                                    ),
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemSize: 10,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),

                                ],
                              )

                          )
                        ],
                      )
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
              ))
        ],
      ),
    );
  }
}
