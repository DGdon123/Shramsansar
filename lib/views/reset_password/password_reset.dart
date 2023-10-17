import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmiis/utils/colors_resource.dart';
import 'package:lmiis/views/home_screens/home_screen.dart';
import 'package:lmiis/views/login_screens/logIn_screen.dart';
import 'package:provider/provider.dart';

import '../../models/SendDataModels/ForegetPasswordSendModel.dart';
import '../../provider/AuthProvider.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/dimensions.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custtom_button.dart';
import '../widgets/showCustomSnackBar.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController emailTextEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsResource.PRAYMERY_COLOR,
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) => Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 40, left: 10, right: 10),
            color: ColorsResource.PRAYMERY_COLOR,
            child: Column(
              children: [
                //ToolBar
                Row(
                  children: [
                    InkWell(
                        onHover: (_) {},
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(AppImages.ic_back_blue)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 65,
                      child: Text(
                        AppConstants.password_reset,
                        style: TextStyle(
                            fontSize: Dimensions.BODY_30,
                            fontWeight: Dimensions.FONT_MEDIUM,
                            color: ColorsResource.PRAYMARY_TEXT_COLOR),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        CustomTextFieldWithTitle(AppConstants.Enter_your_email,
                            emailTextEditingController, emailFocusNode,
                            insideHintText: AppConstants.E_mail),
                        SizedBox(
                          height: 50,
                        ),
                        isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                AppConstants.Get_the_password,
                                ()async {
                                  String email =
                                      emailTextEditingController.text;

                                  if (email == '') {
                                    return showCustomSnackBar(
                                        AppConstants.Enter_your_email, context);
                                  }

                                  ForgetPasswordSendModel
                                      forgetPasswordSendModel =
                                      ForgetPasswordSendModel(email: email);
                                  setState(() {
                                    isLoading = true;
                                  });
                               await   authProvider
                                      .forgetPassword(forgetPasswordSendModel)
                                      .then((value) {
                                    if (value.isSuccess) {
                                      emailTextEditingController.text = '';

                                      // showCustomSnackBar(value.message,context,isError: false);
                                      // successDialog(AppConstants
                                      //     .Your_password_to_your_email_has_been_sent);
                                 
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (ctx) => LogInScreen()),
                                          (route) => false);  
                                             showCustomSnackBar(
                                         AppConstants
                                          .Your_password_to_your_email_has_been_sent, context,isError :false);
                                          //  successDialog(AppConstants
                                          // .Your_password_to_your_email_has_been_sent);
                                    } else {
                                      // log(value.message)
                                      showCustomSnackBar(
                                          value.message, context);
                                    }  setState(() {
                                    isLoading = false;
                                  });
                                  });
                                },
                                wight: 230,
                              ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  successDialog(String title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0)), //this right here
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(3),
                          topLeft: Radius.circular(3),
                        ),
                        color: ColorsResource.WHAIT,
                        border: Border.all(
                          color: ColorsResource.WHAIT,
                          width: 1,
                        ),
                      ),
                      height: 30,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onHover: (_) {},
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  AppImages.ic_close,
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Dimensions.BODY_20,
                              color: ColorsResource.TEXT_BLACK_COLOR),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppImages.ic_sucses))
                  ],
                ),
              ));
        });
  }
}
