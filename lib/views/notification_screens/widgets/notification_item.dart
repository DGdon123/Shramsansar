import 'package:flutter/material.dart';
import 'package:lmiis/utils/app_images.dart';
import 'package:lmiis/utils/colors_resource.dart';
import 'package:lmiis/utils/dimensions.dart';

import '../../../models/ResponsModels/NotificationModel.dart';
import '../../../utils/Apis.dart';

class NotificationItem extends StatelessWidget {

  NotificationData notificationData;
  NotificationItem(this.notificationData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: myBoxDecoration(),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: 100,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: notificationData.serviceProviderLogo != null ? Image.network('${Apis.URL}${notificationData.serviceProviderLogo}',height: 60,width: 60,fit: BoxFit.fill,):Container(),
                    ),

                    Expanded(child: Container()),
                  ],
                ),
              )

          ),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text('${notificationData.name}',style: TextStyle(fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_BOLD),),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text('${notificationData.serviceProviderName}',style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_GRAY_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 4),
                      width: MediaQuery.of(context).size.width - 10,
                      child: Text('${notificationData.message}',textAlign: TextAlign.start, style: TextStyle(fontSize: Dimensions.BODY_16,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
                  ),

                  SizedBox(height: 10,)
                ],
              ),
          )
        ],
      ),
    );
  }


  myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: ColorsResource.WHAIT,
      border: Border.all(
        color: ColorsResource.PRAYMARY_TEXT_COLOR,
        width: 1,
      ),
    );
  }

}
