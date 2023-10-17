


import 'package:flutter/material.dart';
import 'package:lmiis/utils/colors_resource.dart';
import 'package:loading_gifs/loading_gifs.dart';

import '../../utils/dimensions.dart';

void showCustomDialog(BuildContext context,String title) {
  showGeneralDialog(
    context: context,
    barrierLabel: title,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 140,
            width: 140,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(circularProgressIndicator, scale: 10),
                  SizedBox(height: 30,),
                  Text(title,style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_MEDIUM,fontSize: Dimensions.BODY_12),)
                ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}