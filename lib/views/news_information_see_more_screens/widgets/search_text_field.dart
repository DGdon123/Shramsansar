import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/AppConstants.dart';
import '../../../utils/colors_resource.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/app_images.dart';

class CustomSearchTextFieldWithTitle extends StatelessWidget {


  String hintText;
  TextEditingController controller;
  FocusNode focusNode;
  bool isShowRequrStar;
  double height;
  Function(String)? onChanged;
  bool inputTypePassword;
  String inputType;
  bool isValid;
  bool isVisibleTopHint;
  String prefixIcon;
  String insideHintText;

  CustomSearchTextFieldWithTitle(this.hintText,this.controller,this.focusNode,
      {this.isShowRequrStar = false,this.onChanged,this.height = 54,
        this.inputTypePassword = false, this.inputType = AppConstants.TEXT,
        this.isValid = false,this.prefixIcon ='',this.isVisibleTopHint=true,
        this.insideHintText = ''
      });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Visibility(
                visible: isVisibleTopHint,
                child:Text(hintText,style: TextStyle(fontSize: Dimensions.BODY_14,color: ColorsResource.PRAYMARY_TEXT_COLOR,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),),
            ),
            const SizedBox(width: 5,),
            Visibility(
              visible: isShowRequrStar,
                child: Text('*',style: TextStyle(fontSize: Dimensions.BODY_16,color: Theme.of(context).primaryColor,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),))
          ],
        ),
        SizedBox(
            height: height,
            child: TextField(
                obscureText: inputTypePassword,
                keyboardType: inputType != AppConstants.TEXT ? TextInputType.phone:TextInputType.text,
                decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: insideHintText,
                prefixIcon: prefixIcon != ''? Container(
                    margin: const EdgeInsets.all(10),
                    child: SvgPicture.asset(prefixIcon)) : null,
                focusedBorder:OutlineInputBorder(
                    borderSide: isValid ?  BorderSide(color: ColorsResource.TEXT_READ_COLOR,width: 1) :
                    BorderSide(color: ColorsResource.PRAYMARY_TEXT_COLOR,width: 1)
                  ),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(color: ColorsResource.PRAYMARY_TEXT_COLOR ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsResource.PRAYMARY_TEXT_COLOR,
                        width: .10
                    )
                ),

              ),
              controller:controller,
              onChanged: onChanged,
              focusNode: focusNode,

            )
        ),
      ],
    );
  }
}
