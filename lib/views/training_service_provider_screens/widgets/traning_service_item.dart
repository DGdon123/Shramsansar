import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmiis/utils/AppConstants.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/dimensions.dart';

import '../../../models/ResponsModels/TspModel.dart';
import '../../../utils/Apis.dart';
import '../../../utils/colors_resource.dart';
import '../../Job_description_view_screens/Job_description_view_screen.dart';
import '../../news_information_details_screens/news_information_details_screens.dart';

class TrainginServiceItem extends StatelessWidget {

  TspData tspData;
  Function() onTap;
  TrainginServiceItem(this.tspData, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (_){},
      onTap: onTap ,
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
                  child: tspData.logo != null ? CachedNetworkImage(imageUrl: '${Apis.URL}${tspData.logo}',height: 60,width: 60,fit: BoxFit.fill,placeholder: (context, url) =>  Image.asset(AppImages.placeHolder), errorWidget: (context, url, error) => Image.asset(AppImages.placeHolder)):Container(),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width -122,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10,top: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Text('${tspData.name}',
                        maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),)),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.ic_location,color: ColorsResource.TEXT_BLACK_COLOR,),
                            SizedBox(width:10,),
                            Text('${tspData.districtName}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                          ],
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            SvgPicture.asset(AppImages.ic_phone_view,color: ColorsResource.TEXT_BLACK_COLOR,),
                            const SizedBox(width:5,),
                            Text('${tspData.mobile}',style: TextStyle(fontSize: Dimensions.BODY_10,color: ColorsResource.TEXT_BLACK_COLOR),)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
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
}
