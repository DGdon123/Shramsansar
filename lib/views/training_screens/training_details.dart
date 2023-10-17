import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/ResponsModels/ViewAllTrainingsModel.dart';
import '../../utils/AppConstants.dart';
import '../../utils/app_images.dart';
import '../../utils/colors_resource.dart';
import '../../utils/dimensions.dart';
import '../news_information_see_more_screens/widgets/custtom_search_button.dart';

class TrainingDetailsScreen extends StatefulWidget {
  ViewAllTrainingsData viewAllTrainingsData;
  TrainingDetailsScreen(this.viewAllTrainingsData);

  @override
  State<TrainingDetailsScreen> createState() => _TrainingDetailsScreenState();
}

class _TrainingDetailsScreenState extends State<TrainingDetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 850,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: ColorsResource.PRAYMERY_COLOR,
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.050,
                    margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Column(
                      children: [
                        //Toolbar
                        Row(
                          children: [
                            InkWell(
                                onHover: (_) {},
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: SvgPicture.asset(AppImages.ic_back_blue)),
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 65,
                              child: Center(
                                child: Center(
                                  child: Text(
                                    AppConstants.Training_Service_Provider_Details,
                                    style: TextStyle(
                                        fontSize: Dimensions.BODY_20,
                                        fontWeight: Dimensions.FONT_MEDIUM_NORMUL,
                                        color: ColorsResource.PRAYMARY_TEXT_COLOR),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        //company info
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('sjhfkjsdfhjks', style: TextStyle(fontSize:Dimensions.BODY_20,color: ColorsResource.TEXT_BLACK_COLOR,fontWeight: Dimensions.FONT_BOLD),)
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10,),

                                    CustomSearchButton(AppConstants.Apply, () => {


                                    succesDialog(AppConstants.You_have_successfully_trained_applied_for,(){

                                    })
                                    }, height: 25,
                                        wight: 100,
                                        textSize: Dimensions.BODY_12,
                                        padding: 2
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        //Devider
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 1,
                          color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('प्रशिक्षण दिने संस्थाको विवरण',
                              style: TextStyle(
                                  color: ColorsResource.TEXT_BLACK_COLOR,
                                  fontSize: Dimensions.BODY_14,
                                  fontWeight: Dimensions.FONT_BOLD),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Achievers Consulting Services Pvt. Ltd.',
                                    style: TextStyle(
                                        color: ColorsResource.TEXT_GRAY_COLOR_LOW,
                                        fontSize: Dimensions.BODY_14),),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_location,
                                        color: ColorsResource.TEXT_BLACK_COLOR,),
                                      const SizedBox(width: 5,),
                                      SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width - 100,
                                          child: Text(
                                              'Itahari,Bangladesh', maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR,
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL)))
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_call,
                                        color: ColorsResource.TEXT_BLACK_COLOR,),
                                      const SizedBox(width: 5,),
                                      SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width - 100,
                                          child: Text('98567463463', maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR,
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL)))
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_email,
                                        color: ColorsResource.TEXT_BLACK_COLOR,),
                                      const SizedBox(width: 5,),
                                      SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width - 100,
                                          child: Text(
                                              'achievers@gmail.com', maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR,
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL)))
                                    ],
                                  )
                                ],
                              ),
                            ),


                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Center(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(AppConstants.Details_of_training,
                                  style: TextStyle(
                                      color: ColorsResource.TEXT_BLACK_COLOR,
                                      fontSize: Dimensions.BODY_14,
                                      fontWeight: Dimensions.FONT_BOLD),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              margin: EdgeInsets.only(left: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_location,
                                        color: ColorsResource.TEXT_BLACK_COLOR,),
                                      const SizedBox(width: 5,),
                                      SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width - 100,
                                          child: Text('Duhabi, Nepal', maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR,
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL)))
                                    ],
                                  ),

                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_group,
                                        color: ColorsResource.TEXT_BLACK_COLOR,),
                                      const SizedBox(width: 5,),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width - 100,
                                          child: Text(' 6', maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR,
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL)))
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_calender,
                                        color: ColorsResource.TEXT_BLACK_COLOR,),
                                      const SizedBox(width: 5,),
                                      SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width - 100,
                                          child: Text(' 2079-3-12 to 2079-3-13', maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR,
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL)))
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppImages.ic_clock,
                                        color: ColorsResource.TEXT_BLACK_COLOR,),
                                      const SizedBox(width: 5,),
                                      SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width - 100,
                                          child: Text(
                                              '4:00 pm to 7:00 pm', maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: Dimensions.BODY_12,
                                                  color: ColorsResource
                                                      .TEXT_BLACK_COLOR,
                                                  fontWeight: Dimensions
                                                      .FONT_MEDIUM_NORMUL)))
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text(AppConstants.description,
                                    style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_14,fontWeight: Dimensions.FONT_BOLD),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Text(
                                      AppConstants.Job_description_test,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: ColorsResource.TEXT_BLACK_COLOR,fontSize: Dimensions.BODY_12,fontWeight: Dimensions.FONT_MEDIUM_NORMUL),
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 1,
                          color: ColorsResource.TEXT_FEILD_STOCK_COLOR,
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  )

              )
            ],
          ),
        ),
      ),
    );
  }

  succesDialog(String title,Function() onTap){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)), //this right here
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
                            onHover: (_){},
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(AppImages.ic_close,color: ColorsResource.TEXT_BLACK_COLOR,)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Text(title,textAlign:TextAlign.center, style: TextStyle(fontSize: Dimensions.BODY_20,color: ColorsResource.TEXT_BLACK_COLOR),)),
                    SizedBox(height: 20,),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(AppImages.ic_sucses))
                  ],
                ),
              )
          );
        }
    );
  }

}
