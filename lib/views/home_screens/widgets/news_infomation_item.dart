import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lmiis/utils/AppConstants.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/dimensions.dart';

import '../../../models/ResponsModels/NewsNoticeModel.dart';
import '../../../utils/colors_resource.dart';
import '../../news_information_details_screens/news_information_details_screens.dart';

class NewsInformationItem extends StatelessWidget {

  NewsNoticeData newsNoticeData;


  NewsInformationItem(this.newsNoticeData);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onHover: (_){},
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => NewsInformationDetailsScreens(newsNoticeData.typeName == 'Notice'? true : false,newsNoticeData)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
        decoration: myBoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,top: 5),
                    width: MediaQuery.of(context).size.width - 120,
                    child: Text('${newsNoticeData.title}',maxLines: 1,overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: Dimensions.BODY_16,color: ColorsResource.PRAYMARY_TEXT_COLOR),)),
                Expanded(child: Container()),

                Row(
                  children: [
                    SizedBox(width: 10,),
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.ic_location),
                        SizedBox(width:10,),
                        Text('${newsNoticeData.location}')
                      ],
                    ),
                    const SizedBox(width: 15,),
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.ic_calender),
                        const SizedBox(width:10,),
                        Text('${newsNoticeData.publishedDate}')
                      ],
                    )
                  ],
                ),
                SizedBox(height: 8,)
              ],
            ),
            Expanded(child: Container()),
            Column(
             children: [
               Container(
                 padding: EdgeInsets.only(left: 13,right: 13,top: 1,bottom: 1),
                 decoration: myBoxDecorationTop(),
                 child:Text('${newsNoticeData.typeName}', style: TextStyle(color: ColorsResource.PRAYMARY_TEXT_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
               )
             ],
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
