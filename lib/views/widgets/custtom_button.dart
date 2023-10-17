import 'package:flutter/material.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  String name;
  double height;
  double wight;
  Function() onTap;
  double radius;
  double padding;
  double textSize;
  Color textColor;

  CustomButton(this.name,this.onTap, {this.height = 50,this.wight = 200 ,this.radius = 5,this.textColor = Colors.white,this.textSize = 20,this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onHover: (value){

        },
        child: Container(
          height: height,
          width: wight,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                color: Colors.black26,
                blurRadius: 2.0,
              ),],
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: ColorsResource.BUTTON_BLUE_COLOR
          ),
          child: Align(
            alignment: Alignment.center,
            child:   Text(name,style: TextStyle(color: textColor,fontSize: textSize,fontWeight: Dimensions.FONT_BOLD),),
        )
          ,),
      ),
    );
  }
}
