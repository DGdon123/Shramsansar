import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/ResponsModels/MyProfileModel.dart';
import '../../../utils/app_images.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';

class SocialMediaAccount extends StatelessWidget {

  SocialAccounts socialAccounts;
  Function() onDeleteButton;
  SocialMediaAccount(this.socialAccounts,this.onDeleteButton);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 5),
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
                      Text('${socialAccounts.name}: ${socialAccounts.url}',
                        style: TextStyle(fontSize: Dimensions.BODY_12,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM),
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
                ],
              ))
        ],
      ),
    );
  }
}
