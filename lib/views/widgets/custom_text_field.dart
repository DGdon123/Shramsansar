import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/AppConstants.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../../utils/app_images.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
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
  double prefixIconPadding;
  String suffixIcon;
  double suffixIconPadding;
  double fontSize;
  String insideHintText;
  bool isBold;
  bool isPadding;
  double paddingDouble;
  TextInputAction? textInputAction;
  TextCapitalization? textCapitalization;
  CustomTextFieldWithTitle(this.hintText, this.controller, this.focusNode,
      {this.isShowRequrStar = false,
      this.onChanged,
      this.height = 54,
      this.inputTypePassword = false,
      this.inputType = AppConstants.TEXT,
      this.isValid = false,
      this.prefixIcon = '',
      this.suffixIcon = '',
      this.isVisibleTopHint = true,
      this.insideHintText = '',
      this.isBold = false,
      this.isPadding = true,
      this.prefixIconPadding = 10,
      this.suffixIconPadding = 10,
      this.fontSize = 15,
      this.paddingDouble = 5,
      this.textInputAction = TextInputAction.next,
      this.textCapitalization = TextCapitalization.none});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Visibility(
              visible: isVisibleTopHint,
              child: Text(
                hintText,
                style: TextStyle(
                    fontSize: Dimensions.BODY_14,
                    color: ColorsResource.TEXT_BLACK_COLOR,
                    fontWeight: isBold
                        ? Dimensions.FONT_BOLD
                        : Dimensions.FONT_MEDIUM_NORMUL),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Visibility(
                visible: isShowRequrStar,
                child: Text(
                  '*',
                  style: TextStyle(
                      fontSize: Dimensions.BODY_16,
                      color: ColorsResource.TEXT_READ_COLOR,
                      fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                ))
          ],
        ),
        SizedBox(
            height: height,
            child: TextField(
              textCapitalization: textCapitalization!,
              textInputAction: textInputAction,
              style: TextStyle(fontSize: fontSize),
              obscureText: inputTypePassword,
              keyboardType: inputType != AppConstants.TEXT
                  ? TextInputType.phone
                  : TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: isPadding
                    ? null
                    : EdgeInsets.only(
                        left: paddingDouble,
                        top: paddingDouble,
                        bottom: paddingDouble),
                filled: true,
                fillColor: Colors.white,
                hintText: insideHintText,
                prefixIcon: prefixIcon != ''
                    ? Container(
                        margin: EdgeInsets.all(prefixIconPadding),
                        child: SvgPicture.asset(prefixIcon))
                    : null,
                suffixIcon: suffixIcon != ''
                    ? Container(
                        margin: EdgeInsets.all(suffixIconPadding),
                        child: SvgPicture.asset(suffixIcon))
                    : null,
                focusedBorder: OutlineInputBorder(
                    borderSide: isValid
                        ? BorderSide(
                            color: ColorsResource.TEXT_READ_COLOR, width: 1)
                        : BorderSide(
                            color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                            width: 1)),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorsResource.TEXT_FEILD_STOCK_COLOR),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                        width: .5)),
              ),
              controller: controller,
              onChanged: onChanged,
              focusNode: focusNode,
            )),
      ],
    );
  }
}

class LoginTextFormFiled extends StatelessWidget {
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
  double prefixIconPadding;
  Widget? suffixIcon;
  double suffixIconPadding;
  double fontSize;
  String insideHintText;
  bool isBold;
  bool isPadding;
  double paddingDouble;
  bool ismaxLenght;
  LoginTextFormFiled(
    this.hintText,
    this.controller,
    this.focusNode, {
    this.isShowRequrStar = false,
    this.onChanged,
    this.height = 54,
    this.inputTypePassword = false,
    this.inputType = AppConstants.TEXT,
    this.isValid = false,
    this.prefixIcon = '',
    this.suffixIcon,
    this.isVisibleTopHint = true,
    this.insideHintText = '',
    this.isBold = false,
    this.isPadding = true,
    this.prefixIconPadding = 10,
    this.suffixIconPadding = 10,
    this.fontSize = 15,
    this.paddingDouble = 5,
    this.ismaxLenght=false
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Visibility(
              visible: isVisibleTopHint,
              child: Text(
                hintText,
                style: TextStyle(
                    fontSize: Dimensions.BODY_14,
                    color: ColorsResource.TEXT_BLACK_COLOR,
                    fontWeight: isBold
                        ? Dimensions.FONT_BOLD
                        : Dimensions.FONT_MEDIUM_NORMUL),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Visibility(
                visible: isShowRequrStar,
                child: Text(
                  '*',
                  style: TextStyle(
                      fontSize: Dimensions.BODY_16,
                      color: ColorsResource.TEXT_READ_COLOR,
                      fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                ))
          ],
        ),
        SizedBox(
            height: height,
            child: TextField(
              maxLength: ismaxLenght?10:null,
              style: TextStyle(fontSize: fontSize),
              obscureText: inputTypePassword,
              keyboardType: inputType != AppConstants.TEXT
                  ? TextInputType.phone
                  : TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: isPadding
                    ? null
                    : EdgeInsets.only(
                        left: paddingDouble,
                        top: paddingDouble,
                        bottom: paddingDouble),
                filled: true,
                fillColor: Colors.white,
                hintText: insideHintText,
                prefixIcon: prefixIcon != ''
                    ? Container(
                        margin: EdgeInsets.all(prefixIconPadding),
                        child: SvgPicture.asset(prefixIcon))
                    : null,
                suffixIcon: suffixIcon,
                focusedBorder: OutlineInputBorder(
                    borderSide: isValid
                        ? BorderSide(
                            color: ColorsResource.TEXT_READ_COLOR, width: 1)
                        : BorderSide(
                            color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                            width: 1)),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorsResource.TEXT_FEILD_STOCK_COLOR),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                        width: .5)),
              ),
              controller: controller,
              onChanged: onChanged,
              focusNode: focusNode,
            )),
      ],
    );
  }
}
